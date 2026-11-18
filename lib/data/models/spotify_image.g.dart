// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotifyImage _$SpotifyImageFromJson(Map<String, dynamic> json) =>
    _SpotifyImage(
      url: json['url'] as String,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpotifyImageToJson(_SpotifyImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
