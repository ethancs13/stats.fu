// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentlyPlayedItem _$RecentlyPlayedItemFromJson(Map<String, dynamic> json) =>
    _RecentlyPlayedItem(
      track: Track.fromJson(json['track'] as Map<String, dynamic>),
      playedAt: DateTime.parse(json['playedAt'] as String),
    );

Map<String, dynamic> _$RecentlyPlayedItemToJson(_RecentlyPlayedItem instance) =>
    <String, dynamic>{
      'track': instance.track,
      'playedAt': instance.playedAt.toIso8601String(),
    };
