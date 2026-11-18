import 'package:freezed_annotation/freezed_annotation.dart';

part 'spotify_image.freezed.dart';
part 'spotify_image.g.dart';

@freezed
abstract class SpotifyImage with _$SpotifyImage {
  const factory SpotifyImage({
    required String url,
    int? width,
    int? height,
  }) = _SpotifyImage;

  factory SpotifyImage.fromJson(Map<String, dynamic> json) =>
      _$SpotifyImageFromJson(json);
}

extension SpotifyImageListX on List<SpotifyImage> {
  String? get largest {
    if (isEmpty) return null;
    return reduce((a, b) => (a.width ?? 0) >= (b.width ?? 0) ? a : b).url;
  }

  String? get medium {
    if (isEmpty) return null;
    if (length == 1) return first.url;
    return this[length ~/ 2].url;
  }
}
