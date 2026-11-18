import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_history_entry.freezed.dart';
part 'stream_history_entry.g.dart';

/// Represents a single entry from Spotify's Extended Streaming History JSON export.
/// File format: StreamingHistory_music_N.json
@freezed
abstract class StreamHistoryEntry with _$StreamHistoryEntry {
  const factory StreamHistoryEntry({
    required DateTime ts,
    required int msPlayed,
    String? trackName,
    String? artistName,
    String? albumName,
    String? spotifyTrackUri,
    String? reasonStart,
    String? reasonEnd,
    @Default(false) bool shuffle,
    @Default(false) bool skipped,
  }) = _StreamHistoryEntry;

  factory StreamHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$StreamHistoryEntryFromJson(json);
}

@freezed
abstract class ArtistHistoryStats with _$ArtistHistoryStats {
  const factory ArtistHistoryStats({
    required String artistName,
    required int streamCount,
    required int msPlayed,
    required DateTime firstPlayed,
    required DateTime lastPlayed,
    required int rank,
  }) = _ArtistHistoryStats;
}

@freezed
abstract class TrackHistoryStats with _$TrackHistoryStats {
  const factory TrackHistoryStats({
    required String trackName,
    required String artistName,
    required String? albumName,
    required String? spotifyTrackUri,
    required int streamCount,
    required int msPlayed,
    required DateTime firstPlayed,
    required DateTime lastPlayed,
    required int rank,
  }) = _TrackHistoryStats;
}

@freezed
abstract class ListeningClockData with _$ListeningClockData {
  const factory ListeningClockData({
    required List<int> hourCounts,
  }) = _ListeningClockData;

  factory ListeningClockData.empty() =>
      const ListeningClockData(hourCounts: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
}
