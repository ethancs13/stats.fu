import 'package:freezed_annotation/freezed_annotation.dart';
import 'spotify_image.dart';

part 'spotify_user.freezed.dart';
part 'spotify_user.g.dart';

@freezed
abstract class SpotifyUser with _$SpotifyUser {
  const factory SpotifyUser({
    required String id,
    required String displayName,
    String? email,
    @Default([]) List<SpotifyImage> images,
    int? followersTotal,
    String? country,
    String? product,
    String? externalUrl,
  }) = _SpotifyUser;

  factory SpotifyUser.fromJson(Map<String, dynamic> json) =>
      _$SpotifyUserFromJson(json);
}
