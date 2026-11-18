// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Album _$AlbumFromJson(Map<String, dynamic> json) => _Album(
  id: json['id'] as String,
  name: json['name'] as String,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => SpotifyImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  releaseDate: json['releaseDate'] as String?,
  externalUrl: json['externalUrl'] as String?,
);

Map<String, dynamic> _$AlbumToJson(_Album instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'images': instance.images,
  'releaseDate': instance.releaseDate,
  'externalUrl': instance.externalUrl,
};

_Track _$TrackFromJson(Map<String, dynamic> json) => _Track(
  id: json['id'] as String,
  name: json['name'] as String,
  album: Album.fromJson(json['album'] as Map<String, dynamic>),
  artists: (json['artists'] as List<dynamic>)
      .map((e) => Artist.fromJson(e as Map<String, dynamic>))
      .toList(),
  durationMs: (json['durationMs'] as num).toInt(),
  popularity: (json['popularity'] as num?)?.toInt(),
  previewUrl: json['previewUrl'] as String?,
  externalUrl: json['externalUrl'] as String?,
  explicit: json['explicit'] as bool? ?? false,
);

Map<String, dynamic> _$TrackToJson(_Track instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'album': instance.album,
  'artists': instance.artists,
  'durationMs': instance.durationMs,
  'popularity': instance.popularity,
  'previewUrl': instance.previewUrl,
  'externalUrl': instance.externalUrl,
  'explicit': instance.explicit,
};

_AudioFeatures _$AudioFeaturesFromJson(Map<String, dynamic> json) =>
    _AudioFeatures(
      id: json['id'] as String,
      danceability: (json['danceability'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      valence: (json['valence'] as num).toDouble(),
      acousticness: (json['acousticness'] as num).toDouble(),
      instrumentalness: (json['instrumentalness'] as num).toDouble(),
      speechiness: (json['speechiness'] as num).toDouble(),
      liveness: (json['liveness'] as num).toDouble(),
      loudness: (json['loudness'] as num).toDouble(),
      tempo: (json['tempo'] as num).toInt(),
      key: (json['key'] as num).toInt(),
      timeSignature: (json['timeSignature'] as num).toInt(),
    );

Map<String, dynamic> _$AudioFeaturesToJson(_AudioFeatures instance) =>
    <String, dynamic>{
      'id': instance.id,
      'danceability': instance.danceability,
      'energy': instance.energy,
      'valence': instance.valence,
      'acousticness': instance.acousticness,
      'instrumentalness': instance.instrumentalness,
      'speechiness': instance.speechiness,
      'liveness': instance.liveness,
      'loudness': instance.loudness,
      'tempo': instance.tempo,
      'key': instance.key,
      'timeSignature': instance.timeSignature,
    };
