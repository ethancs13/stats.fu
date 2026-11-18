import 'package:freezed_annotation/freezed_annotation.dart';
import 'spotify_image.dart';

part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
abstract class Artist with _$Artist {
  const factory Artist({
    required String id,
    required String name,
    @Default([]) List<String> genres,
    @Default([]) List<SpotifyImage> images,
    int? popularity,
    int? followersTotal,
    String? externalUrl,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) =>
      _$ArtistFromJson(json);
}

@freezed
abstract class ArtistWithStats with _$ArtistWithStats {
  const factory ArtistWithStats({
    required Artist artist,
    required int rank,
    int? streamCount,
    int? msPlayed,
    int? appearsInRecentCount,
  }) = _ArtistWithStats;
}
