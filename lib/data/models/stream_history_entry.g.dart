// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StreamHistoryEntry _$StreamHistoryEntryFromJson(Map<String, dynamic> json) =>
    _StreamHistoryEntry(
      ts: DateTime.parse(json['ts'] as String),
      msPlayed: (json['msPlayed'] as num).toInt(),
      trackName: json['trackName'] as String?,
      artistName: json['artistName'] as String?,
      albumName: json['albumName'] as String?,
      spotifyTrackUri: json['spotifyTrackUri'] as String?,
      reasonStart: json['reasonStart'] as String?,
      reasonEnd: json['reasonEnd'] as String?,
      shuffle: json['shuffle'] as bool? ?? false,
      skipped: json['skipped'] as bool? ?? false,
    );

Map<String, dynamic> _$StreamHistoryEntryToJson(_StreamHistoryEntry instance) =>
    <String, dynamic>{
      'ts': instance.ts.toIso8601String(),
      'msPlayed': instance.msPlayed,
      'trackName': instance.trackName,
      'artistName': instance.artistName,
      'albumName': instance.albumName,
      'spotifyTrackUri': instance.spotifyTrackUri,
      'reasonStart': instance.reasonStart,
      'reasonEnd': instance.reasonEnd,
      'shuffle': instance.shuffle,
      'skipped': instance.skipped,
    };
