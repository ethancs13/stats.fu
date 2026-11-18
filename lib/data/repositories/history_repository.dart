import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart' show Value;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database/app_database.dart';
import '../models/stream_history_entry.dart';

part 'history_repository.g.dart';

@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@riverpod
HistoryRepository historyRepository(HistoryRepositoryRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return HistoryRepository(db);
}

class HistoryRepository {
  HistoryRepository(this._db);

  final AppDatabase _db;

  /// Parses Spotify Extended Streaming History JSON files and inserts into Drift.
  /// Supports both the "old" (pre-2023) and "new" (extended) export formats.
  Future<int> importFromFiles(List<String> filePaths) async {
    var total = 0;
    for (final path in filePaths) {
      final file = File(path);
      final content = await file.readAsString();
      final companions = _parseHistoryFile(content);
      await _db.insertHistoryBatch(companions);
      total += companions.length;
    }
    return total;
  }

  List<StreamHistoryEntriesCompanion> _parseHistoryFile(String content) {
    final dynamic json = jsonDecode(content);
    if (json is! List) return [];

    final results = <StreamHistoryEntriesCompanion>[];
    for (final item in json) {
      try {
        final j = item as Map<String, dynamic>;
        final msPlayed = (j['ms_played'] ?? j['msPlayed'] ?? 0) as int;
        if (msPlayed < 30000) continue; // skip < 30s — not a real stream

        final tsStr = (j['ts'] ?? j['endTime']) as String?;
        if (tsStr == null) continue;

        results.add(StreamHistoryEntriesCompanion.insert(
          ts: DateTime.parse(tsStr).toLocal(),
          msPlayed: msPlayed,
          trackName: Value(j['master_metadata_track_name'] as String? ??
              j['trackName'] as String?),
          artistName: Value(j['master_metadata_album_artist_name'] as String? ??
              j['artistName'] as String?),
          albumName: Value(j['master_metadata_album_album_name'] as String? ??
              j['albumName'] as String?),
          spotifyTrackUri: Value(j['spotify_track_uri'] as String?),
          shuffle: Value(j['shuffle'] as bool? ?? false),
          skipped: Value(j['skipped'] as bool? ?? false),
        ));
      } catch (_) {
        continue;
      }
    }
    return results;
  }

  Future<int> getTotalStreamCount({DateTime? from, DateTime? to}) =>
      _db.getTotalStreamCount(from: from, to: to);

  Future<int> getTotalMsPlayed({DateTime? from, DateTime? to}) =>
      _db.getTotalMsPlayed(from: from, to: to);

  Future<List<int>> getListeningClock({DateTime? from, DateTime? to}) =>
      _db.getListeningClockData(from: from, to: to);

  Stream<int> watchHistoryCount() => _db.watchHistoryCount();

  Future<void> clearHistory() => _db.clearHistory();

  Future<List<HistoryRow>> getHistoryPage({
    int limit = 50,
    int offset = 0,
    String? artistFilter,
    String? trackFilter,
    DateTime? from,
    DateTime? to,
  }) =>
      _db.getHistoryPage(
        limit: limit,
        offset: offset,
        artistFilter: artistFilter,
        trackFilter: trackFilter,
        from: from,
        to: to,
      );

  Future<List<ArtistHistoryStats>> getTopArtists({
    int limit = 50,
    DateTime? from,
    DateTime? to,
  }) async {
    final entries = await _db.getHistoryPage(limit: 100000, from: from, to: to);

    final map = <String, _ArtistAgg>{};
    for (final e in entries) {
      if (e.artistName == null) continue;
      final agg = map.putIfAbsent(e.artistName!, () => _ArtistAgg(e.artistName!));
      agg.streamCount++;
      agg.msPlayed += e.msPlayed;
      if (agg.firstPlayed == null || e.ts.isBefore(agg.firstPlayed!)) {
        agg.firstPlayed = e.ts;
      }
      if (agg.lastPlayed == null || e.ts.isAfter(agg.lastPlayed!)) {
        agg.lastPlayed = e.ts;
      }
    }

    final sorted = map.values.toList()
      ..sort((a, b) => b.msPlayed.compareTo(a.msPlayed));

    return sorted.take(limit).toList().asMap().entries.map((e) {
      final a = e.value;
      return ArtistHistoryStats(
        artistName: a.name,
        streamCount: a.streamCount,
        msPlayed: a.msPlayed,
        firstPlayed: a.firstPlayed ?? DateTime.now(),
        lastPlayed: a.lastPlayed ?? DateTime.now(),
        rank: e.key + 1,
      );
    }).toList();
  }

  Future<List<TrackHistoryStats>> getTopTracks({
    int limit = 50,
    DateTime? from,
    DateTime? to,
  }) async {
    final entries = await _db.getHistoryPage(limit: 100000, from: from, to: to);

    final map = <String, _TrackAgg>{};
    for (final e in entries) {
      if (e.trackName == null || e.artistName == null) continue;
      final key = '${e.artistName}|${e.trackName}';
      final agg = map.putIfAbsent(
        key,
        () => _TrackAgg(e.trackName!, e.artistName!, e.albumName, e.spotifyTrackUri),
      );
      agg.streamCount++;
      agg.msPlayed += e.msPlayed;
      if (agg.firstPlayed == null || e.ts.isBefore(agg.firstPlayed!)) {
        agg.firstPlayed = e.ts;
      }
      if (agg.lastPlayed == null || e.ts.isAfter(agg.lastPlayed!)) {
        agg.lastPlayed = e.ts;
      }
    }

    final sorted = map.values.toList()
      ..sort((a, b) => b.streamCount.compareTo(a.streamCount));

    return sorted.take(limit).toList().asMap().entries.map((e) {
      final t = e.value;
      return TrackHistoryStats(
        trackName: t.trackName,
        artistName: t.artistName,
        albumName: t.albumName,
        spotifyTrackUri: t.spotifyTrackUri,
        streamCount: t.streamCount,
        msPlayed: t.msPlayed,
        firstPlayed: t.firstPlayed ?? DateTime.now(),
        lastPlayed: t.lastPlayed ?? DateTime.now(),
        rank: e.key + 1,
      );
    }).toList();
  }

  Future<ArtistHistoryStats?> getArtistStats(
    String artistName, {
    DateTime? from,
    DateTime? to,
  }) async {
    final all = await getTopArtists(limit: 10000, from: from, to: to);
    try {
      return all.firstWhere(
        (a) => a.artistName.toLowerCase() == artistName.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}

class _ArtistAgg {
  _ArtistAgg(this.name);
  final String name;
  int streamCount = 0;
  int msPlayed = 0;
  DateTime? firstPlayed;
  DateTime? lastPlayed;
}

class _TrackAgg {
  _TrackAgg(this.trackName, this.artistName, this.albumName, this.spotifyTrackUri);
  final String trackName;
  final String artistName;
  final String? albumName;
  final String? spotifyTrackUri;
  int streamCount = 0;
  int msPlayed = 0;
  DateTime? firstPlayed;
  DateTime? lastPlayed;
}
