// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StreamHistoryEntriesTable extends StreamHistoryEntries
    with TableInfo<$StreamHistoryEntriesTable, HistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreamHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _trackNameMeta = const VerificationMeta(
    'trackName',
  );
  @override
  late final GeneratedColumn<String> trackName = GeneratedColumn<String>(
    'track_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _artistNameMeta = const VerificationMeta(
    'artistName',
  );
  @override
  late final GeneratedColumn<String> artistName = GeneratedColumn<String>(
    'artist_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albumNameMeta = const VerificationMeta(
    'albumName',
  );
  @override
  late final GeneratedColumn<String> albumName = GeneratedColumn<String>(
    'album_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spotifyTrackUriMeta = const VerificationMeta(
    'spotifyTrackUri',
  );
  @override
  late final GeneratedColumn<String> spotifyTrackUri = GeneratedColumn<String>(
    'spotify_track_uri',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _msPlayedMeta = const VerificationMeta(
    'msPlayed',
  );
  @override
  late final GeneratedColumn<int> msPlayed = GeneratedColumn<int>(
    'ms_played',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
    'ts',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shuffleMeta = const VerificationMeta(
    'shuffle',
  );
  @override
  late final GeneratedColumn<bool> shuffle = GeneratedColumn<bool>(
    'shuffle',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("shuffle" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _skippedMeta = const VerificationMeta(
    'skipped',
  );
  @override
  late final GeneratedColumn<bool> skipped = GeneratedColumn<bool>(
    'skipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("skipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trackName,
    artistName,
    albumName,
    spotifyTrackUri,
    msPlayed,
    ts,
    shuffle,
    skipped,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stream_history_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('track_name')) {
      context.handle(
        _trackNameMeta,
        trackName.isAcceptableOrUnknown(data['track_name']!, _trackNameMeta),
      );
    }
    if (data.containsKey('artist_name')) {
      context.handle(
        _artistNameMeta,
        artistName.isAcceptableOrUnknown(data['artist_name']!, _artistNameMeta),
      );
    }
    if (data.containsKey('album_name')) {
      context.handle(
        _albumNameMeta,
        albumName.isAcceptableOrUnknown(data['album_name']!, _albumNameMeta),
      );
    }
    if (data.containsKey('spotify_track_uri')) {
      context.handle(
        _spotifyTrackUriMeta,
        spotifyTrackUri.isAcceptableOrUnknown(
          data['spotify_track_uri']!,
          _spotifyTrackUriMeta,
        ),
      );
    }
    if (data.containsKey('ms_played')) {
      context.handle(
        _msPlayedMeta,
        msPlayed.isAcceptableOrUnknown(data['ms_played']!, _msPlayedMeta),
      );
    } else if (isInserting) {
      context.missing(_msPlayedMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('shuffle')) {
      context.handle(
        _shuffleMeta,
        shuffle.isAcceptableOrUnknown(data['shuffle']!, _shuffleMeta),
      );
    }
    if (data.containsKey('skipped')) {
      context.handle(
        _skippedMeta,
        skipped.isAcceptableOrUnknown(data['skipped']!, _skippedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      trackName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_name'],
      ),
      artistName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist_name'],
      ),
      albumName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album_name'],
      ),
      spotifyTrackUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}spotify_track_uri'],
      ),
      msPlayed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ms_played'],
      )!,
      ts: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ts'],
      )!,
      shuffle: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}shuffle'],
      )!,
      skipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}skipped'],
      )!,
    );
  }

  @override
  $StreamHistoryEntriesTable createAlias(String alias) {
    return $StreamHistoryEntriesTable(attachedDatabase, alias);
  }
}

class HistoryRow extends DataClass implements Insertable<HistoryRow> {
  final int id;
  final String? trackName;
  final String? artistName;
  final String? albumName;
  final String? spotifyTrackUri;
  final int msPlayed;
  final DateTime ts;
  final bool shuffle;
  final bool skipped;
  const HistoryRow({
    required this.id,
    this.trackName,
    this.artistName,
    this.albumName,
    this.spotifyTrackUri,
    required this.msPlayed,
    required this.ts,
    required this.shuffle,
    required this.skipped,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || trackName != null) {
      map['track_name'] = Variable<String>(trackName);
    }
    if (!nullToAbsent || artistName != null) {
      map['artist_name'] = Variable<String>(artistName);
    }
    if (!nullToAbsent || albumName != null) {
      map['album_name'] = Variable<String>(albumName);
    }
    if (!nullToAbsent || spotifyTrackUri != null) {
      map['spotify_track_uri'] = Variable<String>(spotifyTrackUri);
    }
    map['ms_played'] = Variable<int>(msPlayed);
    map['ts'] = Variable<DateTime>(ts);
    map['shuffle'] = Variable<bool>(shuffle);
    map['skipped'] = Variable<bool>(skipped);
    return map;
  }

  StreamHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return StreamHistoryEntriesCompanion(
      id: Value(id),
      trackName: trackName == null && nullToAbsent
          ? const Value.absent()
          : Value(trackName),
      artistName: artistName == null && nullToAbsent
          ? const Value.absent()
          : Value(artistName),
      albumName: albumName == null && nullToAbsent
          ? const Value.absent()
          : Value(albumName),
      spotifyTrackUri: spotifyTrackUri == null && nullToAbsent
          ? const Value.absent()
          : Value(spotifyTrackUri),
      msPlayed: Value(msPlayed),
      ts: Value(ts),
      shuffle: Value(shuffle),
      skipped: Value(skipped),
    );
  }

  factory HistoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryRow(
      id: serializer.fromJson<int>(json['id']),
      trackName: serializer.fromJson<String?>(json['trackName']),
      artistName: serializer.fromJson<String?>(json['artistName']),
      albumName: serializer.fromJson<String?>(json['albumName']),
      spotifyTrackUri: serializer.fromJson<String?>(json['spotifyTrackUri']),
      msPlayed: serializer.fromJson<int>(json['msPlayed']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      shuffle: serializer.fromJson<bool>(json['shuffle']),
      skipped: serializer.fromJson<bool>(json['skipped']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trackName': serializer.toJson<String?>(trackName),
      'artistName': serializer.toJson<String?>(artistName),
      'albumName': serializer.toJson<String?>(albumName),
      'spotifyTrackUri': serializer.toJson<String?>(spotifyTrackUri),
      'msPlayed': serializer.toJson<int>(msPlayed),
      'ts': serializer.toJson<DateTime>(ts),
      'shuffle': serializer.toJson<bool>(shuffle),
      'skipped': serializer.toJson<bool>(skipped),
    };
  }

  HistoryRow copyWith({
    int? id,
    Value<String?> trackName = const Value.absent(),
    Value<String?> artistName = const Value.absent(),
    Value<String?> albumName = const Value.absent(),
    Value<String?> spotifyTrackUri = const Value.absent(),
    int? msPlayed,
    DateTime? ts,
    bool? shuffle,
    bool? skipped,
  }) => HistoryRow(
    id: id ?? this.id,
    trackName: trackName.present ? trackName.value : this.trackName,
    artistName: artistName.present ? artistName.value : this.artistName,
    albumName: albumName.present ? albumName.value : this.albumName,
    spotifyTrackUri: spotifyTrackUri.present
        ? spotifyTrackUri.value
        : this.spotifyTrackUri,
    msPlayed: msPlayed ?? this.msPlayed,
    ts: ts ?? this.ts,
    shuffle: shuffle ?? this.shuffle,
    skipped: skipped ?? this.skipped,
  );
  HistoryRow copyWithCompanion(StreamHistoryEntriesCompanion data) {
    return HistoryRow(
      id: data.id.present ? data.id.value : this.id,
      trackName: data.trackName.present ? data.trackName.value : this.trackName,
      artistName: data.artistName.present
          ? data.artistName.value
          : this.artistName,
      albumName: data.albumName.present ? data.albumName.value : this.albumName,
      spotifyTrackUri: data.spotifyTrackUri.present
          ? data.spotifyTrackUri.value
          : this.spotifyTrackUri,
      msPlayed: data.msPlayed.present ? data.msPlayed.value : this.msPlayed,
      ts: data.ts.present ? data.ts.value : this.ts,
      shuffle: data.shuffle.present ? data.shuffle.value : this.shuffle,
      skipped: data.skipped.present ? data.skipped.value : this.skipped,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryRow(')
          ..write('id: $id, ')
          ..write('trackName: $trackName, ')
          ..write('artistName: $artistName, ')
          ..write('albumName: $albumName, ')
          ..write('spotifyTrackUri: $spotifyTrackUri, ')
          ..write('msPlayed: $msPlayed, ')
          ..write('ts: $ts, ')
          ..write('shuffle: $shuffle, ')
          ..write('skipped: $skipped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    trackName,
    artistName,
    albumName,
    spotifyTrackUri,
    msPlayed,
    ts,
    shuffle,
    skipped,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryRow &&
          other.id == this.id &&
          other.trackName == this.trackName &&
          other.artistName == this.artistName &&
          other.albumName == this.albumName &&
          other.spotifyTrackUri == this.spotifyTrackUri &&
          other.msPlayed == this.msPlayed &&
          other.ts == this.ts &&
          other.shuffle == this.shuffle &&
          other.skipped == this.skipped);
}

class StreamHistoryEntriesCompanion extends UpdateCompanion<HistoryRow> {
  final Value<int> id;
  final Value<String?> trackName;
  final Value<String?> artistName;
  final Value<String?> albumName;
  final Value<String?> spotifyTrackUri;
  final Value<int> msPlayed;
  final Value<DateTime> ts;
  final Value<bool> shuffle;
  final Value<bool> skipped;
  const StreamHistoryEntriesCompanion({
    this.id = const Value.absent(),
    this.trackName = const Value.absent(),
    this.artistName = const Value.absent(),
    this.albumName = const Value.absent(),
    this.spotifyTrackUri = const Value.absent(),
    this.msPlayed = const Value.absent(),
    this.ts = const Value.absent(),
    this.shuffle = const Value.absent(),
    this.skipped = const Value.absent(),
  });
  StreamHistoryEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.trackName = const Value.absent(),
    this.artistName = const Value.absent(),
    this.albumName = const Value.absent(),
    this.spotifyTrackUri = const Value.absent(),
    required int msPlayed,
    required DateTime ts,
    this.shuffle = const Value.absent(),
    this.skipped = const Value.absent(),
  }) : msPlayed = Value(msPlayed),
       ts = Value(ts);
  static Insertable<HistoryRow> custom({
    Expression<int>? id,
    Expression<String>? trackName,
    Expression<String>? artistName,
    Expression<String>? albumName,
    Expression<String>? spotifyTrackUri,
    Expression<int>? msPlayed,
    Expression<DateTime>? ts,
    Expression<bool>? shuffle,
    Expression<bool>? skipped,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackName != null) 'track_name': trackName,
      if (artistName != null) 'artist_name': artistName,
      if (albumName != null) 'album_name': albumName,
      if (spotifyTrackUri != null) 'spotify_track_uri': spotifyTrackUri,
      if (msPlayed != null) 'ms_played': msPlayed,
      if (ts != null) 'ts': ts,
      if (shuffle != null) 'shuffle': shuffle,
      if (skipped != null) 'skipped': skipped,
    });
  }

  StreamHistoryEntriesCompanion copyWith({
    Value<int>? id,
    Value<String?>? trackName,
    Value<String?>? artistName,
    Value<String?>? albumName,
    Value<String?>? spotifyTrackUri,
    Value<int>? msPlayed,
    Value<DateTime>? ts,
    Value<bool>? shuffle,
    Value<bool>? skipped,
  }) {
    return StreamHistoryEntriesCompanion(
      id: id ?? this.id,
      trackName: trackName ?? this.trackName,
      artistName: artistName ?? this.artistName,
      albumName: albumName ?? this.albumName,
      spotifyTrackUri: spotifyTrackUri ?? this.spotifyTrackUri,
      msPlayed: msPlayed ?? this.msPlayed,
      ts: ts ?? this.ts,
      shuffle: shuffle ?? this.shuffle,
      skipped: skipped ?? this.skipped,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trackName.present) {
      map['track_name'] = Variable<String>(trackName.value);
    }
    if (artistName.present) {
      map['artist_name'] = Variable<String>(artistName.value);
    }
    if (albumName.present) {
      map['album_name'] = Variable<String>(albumName.value);
    }
    if (spotifyTrackUri.present) {
      map['spotify_track_uri'] = Variable<String>(spotifyTrackUri.value);
    }
    if (msPlayed.present) {
      map['ms_played'] = Variable<int>(msPlayed.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (shuffle.present) {
      map['shuffle'] = Variable<bool>(shuffle.value);
    }
    if (skipped.present) {
      map['skipped'] = Variable<bool>(skipped.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreamHistoryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('trackName: $trackName, ')
          ..write('artistName: $artistName, ')
          ..write('albumName: $albumName, ')
          ..write('spotifyTrackUri: $spotifyTrackUri, ')
          ..write('msPlayed: $msPlayed, ')
          ..write('ts: $ts, ')
          ..write('shuffle: $shuffle, ')
          ..write('skipped: $skipped')
          ..write(')'))
        .toString();
  }
}

class $CachedArtistsTable extends CachedArtists
    with TableInfo<$CachedArtistsTable, CachedArtist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedArtistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
    'json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, json, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_artists';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedArtist> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('json')) {
      context.handle(
        _jsonMeta,
        json.isAcceptableOrUnknown(data['json']!, _jsonMeta),
      );
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedArtist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedArtist(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      json: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedArtistsTable createAlias(String alias) {
    return $CachedArtistsTable(attachedDatabase, alias);
  }
}

class CachedArtist extends DataClass implements Insertable<CachedArtist> {
  final String id;
  final String name;
  final String json;
  final DateTime cachedAt;
  const CachedArtist({
    required this.id,
    required this.name,
    required this.json,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['json'] = Variable<String>(json);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedArtistsCompanion toCompanion(bool nullToAbsent) {
    return CachedArtistsCompanion(
      id: Value(id),
      name: Value(name),
      json: Value(json),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedArtist.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedArtist(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      json: serializer.fromJson<String>(json['json']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'json': serializer.toJson<String>(json),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedArtist copyWith({
    String? id,
    String? name,
    String? json,
    DateTime? cachedAt,
  }) => CachedArtist(
    id: id ?? this.id,
    name: name ?? this.name,
    json: json ?? this.json,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedArtist copyWithCompanion(CachedArtistsCompanion data) {
    return CachedArtist(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      json: data.json.present ? data.json.value : this.json,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedArtist(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('json: $json, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, json, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedArtist &&
          other.id == this.id &&
          other.name == this.name &&
          other.json == this.json &&
          other.cachedAt == this.cachedAt);
}

class CachedArtistsCompanion extends UpdateCompanion<CachedArtist> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> json;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedArtistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.json = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedArtistsCompanion.insert({
    required String id,
    required String name,
    required String json,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       json = Value(json),
       cachedAt = Value(cachedAt);
  static Insertable<CachedArtist> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? json,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (json != null) 'json': json,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedArtistsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? json,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedArtistsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      json: json ?? this.json,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedArtistsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('json: $json, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedTracksTable extends CachedTracks
    with TableInfo<$CachedTracksTable, CachedTrack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedTracksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
    'json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, json, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_tracks';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedTrack> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('json')) {
      context.handle(
        _jsonMeta,
        json.isAcceptableOrUnknown(data['json']!, _jsonMeta),
      );
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedTrack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedTrack(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      json: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedTracksTable createAlias(String alias) {
    return $CachedTracksTable(attachedDatabase, alias);
  }
}

class CachedTrack extends DataClass implements Insertable<CachedTrack> {
  final String id;
  final String name;
  final String json;
  final DateTime cachedAt;
  const CachedTrack({
    required this.id,
    required this.name,
    required this.json,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['json'] = Variable<String>(json);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedTracksCompanion toCompanion(bool nullToAbsent) {
    return CachedTracksCompanion(
      id: Value(id),
      name: Value(name),
      json: Value(json),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedTrack.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedTrack(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      json: serializer.fromJson<String>(json['json']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'json': serializer.toJson<String>(json),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedTrack copyWith({
    String? id,
    String? name,
    String? json,
    DateTime? cachedAt,
  }) => CachedTrack(
    id: id ?? this.id,
    name: name ?? this.name,
    json: json ?? this.json,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedTrack copyWithCompanion(CachedTracksCompanion data) {
    return CachedTrack(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      json: data.json.present ? data.json.value : this.json,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedTrack(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('json: $json, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, json, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedTrack &&
          other.id == this.id &&
          other.name == this.name &&
          other.json == this.json &&
          other.cachedAt == this.cachedAt);
}

class CachedTracksCompanion extends UpdateCompanion<CachedTrack> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> json;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedTracksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.json = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedTracksCompanion.insert({
    required String id,
    required String name,
    required String json,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       json = Value(json),
       cachedAt = Value(cachedAt);
  static Insertable<CachedTrack> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? json,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (json != null) 'json': json,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedTracksCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? json,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedTracksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      json: json ?? this.json,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedTracksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('json: $json, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StreamHistoryEntriesTable streamHistoryEntries =
      $StreamHistoryEntriesTable(this);
  late final $CachedArtistsTable cachedArtists = $CachedArtistsTable(this);
  late final $CachedTracksTable cachedTracks = $CachedTracksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    streamHistoryEntries,
    cachedArtists,
    cachedTracks,
  ];
}

typedef $$StreamHistoryEntriesTableCreateCompanionBuilder =
    StreamHistoryEntriesCompanion Function({
      Value<int> id,
      Value<String?> trackName,
      Value<String?> artistName,
      Value<String?> albumName,
      Value<String?> spotifyTrackUri,
      required int msPlayed,
      required DateTime ts,
      Value<bool> shuffle,
      Value<bool> skipped,
    });
typedef $$StreamHistoryEntriesTableUpdateCompanionBuilder =
    StreamHistoryEntriesCompanion Function({
      Value<int> id,
      Value<String?> trackName,
      Value<String?> artistName,
      Value<String?> albumName,
      Value<String?> spotifyTrackUri,
      Value<int> msPlayed,
      Value<DateTime> ts,
      Value<bool> shuffle,
      Value<bool> skipped,
    });

class $$StreamHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $StreamHistoryEntriesTable> {
  $$StreamHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trackName => $composableBuilder(
    column: $table.trackName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artistName => $composableBuilder(
    column: $table.artistName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get albumName => $composableBuilder(
    column: $table.albumName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get spotifyTrackUri => $composableBuilder(
    column: $table.spotifyTrackUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get msPlayed => $composableBuilder(
    column: $table.msPlayed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get shuffle => $composableBuilder(
    column: $table.shuffle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StreamHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $StreamHistoryEntriesTable> {
  $$StreamHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackName => $composableBuilder(
    column: $table.trackName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artistName => $composableBuilder(
    column: $table.artistName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get albumName => $composableBuilder(
    column: $table.albumName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get spotifyTrackUri => $composableBuilder(
    column: $table.spotifyTrackUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get msPlayed => $composableBuilder(
    column: $table.msPlayed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get shuffle => $composableBuilder(
    column: $table.shuffle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StreamHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreamHistoryEntriesTable> {
  $$StreamHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get trackName =>
      $composableBuilder(column: $table.trackName, builder: (column) => column);

  GeneratedColumn<String> get artistName => $composableBuilder(
    column: $table.artistName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get albumName =>
      $composableBuilder(column: $table.albumName, builder: (column) => column);

  GeneratedColumn<String> get spotifyTrackUri => $composableBuilder(
    column: $table.spotifyTrackUri,
    builder: (column) => column,
  );

  GeneratedColumn<int> get msPlayed =>
      $composableBuilder(column: $table.msPlayed, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<bool> get shuffle =>
      $composableBuilder(column: $table.shuffle, builder: (column) => column);

  GeneratedColumn<bool> get skipped =>
      $composableBuilder(column: $table.skipped, builder: (column) => column);
}

class $$StreamHistoryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreamHistoryEntriesTable,
          HistoryRow,
          $$StreamHistoryEntriesTableFilterComposer,
          $$StreamHistoryEntriesTableOrderingComposer,
          $$StreamHistoryEntriesTableAnnotationComposer,
          $$StreamHistoryEntriesTableCreateCompanionBuilder,
          $$StreamHistoryEntriesTableUpdateCompanionBuilder,
          (
            HistoryRow,
            BaseReferences<
              _$AppDatabase,
              $StreamHistoryEntriesTable,
              HistoryRow
            >,
          ),
          HistoryRow,
          PrefetchHooks Function()
        > {
  $$StreamHistoryEntriesTableTableManager(
    _$AppDatabase db,
    $StreamHistoryEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreamHistoryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreamHistoryEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$StreamHistoryEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> trackName = const Value.absent(),
                Value<String?> artistName = const Value.absent(),
                Value<String?> albumName = const Value.absent(),
                Value<String?> spotifyTrackUri = const Value.absent(),
                Value<int> msPlayed = const Value.absent(),
                Value<DateTime> ts = const Value.absent(),
                Value<bool> shuffle = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
              }) => StreamHistoryEntriesCompanion(
                id: id,
                trackName: trackName,
                artistName: artistName,
                albumName: albumName,
                spotifyTrackUri: spotifyTrackUri,
                msPlayed: msPlayed,
                ts: ts,
                shuffle: shuffle,
                skipped: skipped,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> trackName = const Value.absent(),
                Value<String?> artistName = const Value.absent(),
                Value<String?> albumName = const Value.absent(),
                Value<String?> spotifyTrackUri = const Value.absent(),
                required int msPlayed,
                required DateTime ts,
                Value<bool> shuffle = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
              }) => StreamHistoryEntriesCompanion.insert(
                id: id,
                trackName: trackName,
                artistName: artistName,
                albumName: albumName,
                spotifyTrackUri: spotifyTrackUri,
                msPlayed: msPlayed,
                ts: ts,
                shuffle: shuffle,
                skipped: skipped,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StreamHistoryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreamHistoryEntriesTable,
      HistoryRow,
      $$StreamHistoryEntriesTableFilterComposer,
      $$StreamHistoryEntriesTableOrderingComposer,
      $$StreamHistoryEntriesTableAnnotationComposer,
      $$StreamHistoryEntriesTableCreateCompanionBuilder,
      $$StreamHistoryEntriesTableUpdateCompanionBuilder,
      (
        HistoryRow,
        BaseReferences<_$AppDatabase, $StreamHistoryEntriesTable, HistoryRow>,
      ),
      HistoryRow,
      PrefetchHooks Function()
    >;
typedef $$CachedArtistsTableCreateCompanionBuilder =
    CachedArtistsCompanion Function({
      required String id,
      required String name,
      required String json,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedArtistsTableUpdateCompanionBuilder =
    CachedArtistsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> json,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedArtistsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedArtistsTable> {
  $$CachedArtistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get json => $composableBuilder(
    column: $table.json,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedArtistsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedArtistsTable> {
  $$CachedArtistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get json => $composableBuilder(
    column: $table.json,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedArtistsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedArtistsTable> {
  $$CachedArtistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedArtistsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedArtistsTable,
          CachedArtist,
          $$CachedArtistsTableFilterComposer,
          $$CachedArtistsTableOrderingComposer,
          $$CachedArtistsTableAnnotationComposer,
          $$CachedArtistsTableCreateCompanionBuilder,
          $$CachedArtistsTableUpdateCompanionBuilder,
          (
            CachedArtist,
            BaseReferences<_$AppDatabase, $CachedArtistsTable, CachedArtist>,
          ),
          CachedArtist,
          PrefetchHooks Function()
        > {
  $$CachedArtistsTableTableManager(_$AppDatabase db, $CachedArtistsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedArtistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedArtistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedArtistsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> json = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedArtistsCompanion(
                id: id,
                name: name,
                json: json,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String json,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedArtistsCompanion.insert(
                id: id,
                name: name,
                json: json,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedArtistsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedArtistsTable,
      CachedArtist,
      $$CachedArtistsTableFilterComposer,
      $$CachedArtistsTableOrderingComposer,
      $$CachedArtistsTableAnnotationComposer,
      $$CachedArtistsTableCreateCompanionBuilder,
      $$CachedArtistsTableUpdateCompanionBuilder,
      (
        CachedArtist,
        BaseReferences<_$AppDatabase, $CachedArtistsTable, CachedArtist>,
      ),
      CachedArtist,
      PrefetchHooks Function()
    >;
typedef $$CachedTracksTableCreateCompanionBuilder =
    CachedTracksCompanion Function({
      required String id,
      required String name,
      required String json,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedTracksTableUpdateCompanionBuilder =
    CachedTracksCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> json,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedTracksTableFilterComposer
    extends Composer<_$AppDatabase, $CachedTracksTable> {
  $$CachedTracksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get json => $composableBuilder(
    column: $table.json,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedTracksTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedTracksTable> {
  $$CachedTracksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get json => $composableBuilder(
    column: $table.json,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedTracksTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedTracksTable> {
  $$CachedTracksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedTracksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedTracksTable,
          CachedTrack,
          $$CachedTracksTableFilterComposer,
          $$CachedTracksTableOrderingComposer,
          $$CachedTracksTableAnnotationComposer,
          $$CachedTracksTableCreateCompanionBuilder,
          $$CachedTracksTableUpdateCompanionBuilder,
          (
            CachedTrack,
            BaseReferences<_$AppDatabase, $CachedTracksTable, CachedTrack>,
          ),
          CachedTrack,
          PrefetchHooks Function()
        > {
  $$CachedTracksTableTableManager(_$AppDatabase db, $CachedTracksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedTracksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedTracksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedTracksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> json = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedTracksCompanion(
                id: id,
                name: name,
                json: json,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String json,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedTracksCompanion.insert(
                id: id,
                name: name,
                json: json,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedTracksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedTracksTable,
      CachedTrack,
      $$CachedTracksTableFilterComposer,
      $$CachedTracksTableOrderingComposer,
      $$CachedTracksTableAnnotationComposer,
      $$CachedTracksTableCreateCompanionBuilder,
      $$CachedTracksTableUpdateCompanionBuilder,
      (
        CachedTrack,
        BaseReferences<_$AppDatabase, $CachedTracksTable, CachedTrack>,
      ),
      CachedTrack,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StreamHistoryEntriesTableTableManager get streamHistoryEntries =>
      $$StreamHistoryEntriesTableTableManager(_db, _db.streamHistoryEntries);
  $$CachedArtistsTableTableManager get cachedArtists =>
      $$CachedArtistsTableTableManager(_db, _db.cachedArtists);
  $$CachedTracksTableTableManager get cachedTracks =>
      $$CachedTracksTableTableManager(_db, _db.cachedTracks);
}
