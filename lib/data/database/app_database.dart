import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('HistoryRow')
class StreamHistoryEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get trackName => text().nullable()();
  TextColumn get artistName => text().nullable()();
  TextColumn get albumName => text().nullable()();
  TextColumn get spotifyTrackUri => text().nullable()();
  IntColumn get msPlayed => integer()();
  DateTimeColumn get ts => dateTime()();
  BoolColumn get shuffle => boolean().withDefault(const Constant(false))();
  BoolColumn get skipped => boolean().withDefault(const Constant(false))();
}

class CachedArtists extends Table {
  TextColumn get id => text().withLength(min: 1, max: 100)();
  TextColumn get name => text()();
  TextColumn get json => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class CachedTracks extends Table {
  TextColumn get id => text().withLength(min: 1, max: 100)();
  TextColumn get name => text()();
  TextColumn get json => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [StreamHistoryEntries, CachedArtists, CachedTracks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Stream history queries

  Future<int> insertHistoryEntry(StreamHistoryEntriesCompanion entry) =>
      into(streamHistoryEntries).insert(entry);

  Future<void> insertHistoryBatch(List<StreamHistoryEntriesCompanion> entries) async {
    await batch((b) => b.insertAll(streamHistoryEntries, entries));
  }

  Future<int> countHistoryEntries() async {
    final count = streamHistoryEntries.id.count();
    final query = selectOnly(streamHistoryEntries)..addColumns([count]);
    return (await query.getSingle()).read(count) ?? 0;
  }

  Future<void> clearHistory() => delete(streamHistoryEntries).go();

  Stream<int> watchHistoryCount() {
    final count = streamHistoryEntries.id.count();
    final query = selectOnly(streamHistoryEntries)..addColumns([count]);
    return query.watchSingle().map((r) => r.read(count) ?? 0);
  }

  Future<List<HistoryRow>> getHistoryPage({
    int limit = 50,
    int offset = 0,
    String? artistFilter,
    String? trackFilter,
    DateTime? from,
    DateTime? to,
  }) {
    final query = select(streamHistoryEntries)
      ..orderBy([(t) => OrderingTerm.desc(t.ts)])
      ..limit(limit, offset: offset);

    if (artistFilter != null) {
      query.where((t) =>
          t.artistName.lower().contains(artistFilter.toLowerCase()));
    }
    if (trackFilter != null) {
      query.where((t) =>
          t.trackName.lower().contains(trackFilter.toLowerCase()));
    }
    if (from != null) {
      query.where((t) => t.ts.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where((t) => t.ts.isSmallerOrEqualValue(to));
    }

    return query.get();
  }

  // Aggregate: total ms played in a range
  Future<int> getTotalMsPlayed({DateTime? from, DateTime? to}) async {
    final sum = streamHistoryEntries.msPlayed.sum();
    final query = selectOnly(streamHistoryEntries)..addColumns([sum]);
    if (from != null) {
      query.where(streamHistoryEntries.ts.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where(streamHistoryEntries.ts.isSmallerOrEqualValue(to));
    }
    return (await query.getSingle()).read(sum) ?? 0;
  }

  // Aggregate: stream count in a range
  Future<int> getTotalStreamCount({DateTime? from, DateTime? to}) async {
    final count = streamHistoryEntries.id.count();
    final query = selectOnly(streamHistoryEntries)..addColumns([count]);
    if (from != null) {
      query.where(streamHistoryEntries.ts.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where(streamHistoryEntries.ts.isSmallerOrEqualValue(to));
    }
    return (await query.getSingle()).read(count) ?? 0;
  }

  // Listening clock: streams per hour of day
  Future<List<int>> getListeningClockData({DateTime? from, DateTime? to}) async {
    final results = await getHistoryPage(
      limit: 100000,
      from: from,
      to: to,
    );
    final hours = List<int>.filled(24, 0);
    for (final entry in results) {
      hours[entry.ts.hour]++;
    }
    return hours;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'stats.fu.db'));
    return NativeDatabase.createInBackground(file);
  });
}
