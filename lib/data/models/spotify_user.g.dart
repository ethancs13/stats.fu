// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotifyUser _$SpotifyUserFromJson(Map<String, dynamic> json) => _SpotifyUser(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  email: json['email'] as String?,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => SpotifyImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  followersTotal: (json['followersTotal'] as num?)?.toInt(),
  country: json['country'] as String?,
  product: json['product'] as String?,
  externalUrl: json['externalUrl'] as String?,
);

Map<String, dynamic> _$SpotifyUserToJson(_SpotifyUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'images': instance.images,
      'followersTotal': instance.followersTotal,
      'country': instance.country,
      'product': instance.product,
      'externalUrl': instance.externalUrl,
    };
