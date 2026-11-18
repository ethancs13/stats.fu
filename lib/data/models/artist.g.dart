// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Artist _$ArtistFromJson(Map<String, dynamic> json) => _Artist(
  id: json['id'] as String,
  name: json['name'] as String,
  genres:
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => SpotifyImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  popularity: (json['popularity'] as num?)?.toInt(),
  followersTotal: (json['followersTotal'] as num?)?.toInt(),
  externalUrl: json['externalUrl'] as String?,
);

Map<String, dynamic> _$ArtistToJson(_Artist instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'genres': instance.genres,
  'images': instance.images,
  'popularity': instance.popularity,
  'followersTotal': instance.followersTotal,
  'externalUrl': instance.externalUrl,
};
