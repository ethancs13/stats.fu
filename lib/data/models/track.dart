import 'package:freezed_annotation/freezed_annotation.dart';
import 'artist.dart';
import 'spotify_image.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
abstract class Album with _$Album {
  const factory Album({
    required String id,
    required String name,
    @Default([]) List<SpotifyImage> images,
    String? releaseDate,
    String? externalUrl,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}

@freezed
abstract class Track with _$Track {
  const factory Track({
    required String id,
    required String name,
    required Album album,
    required List<Artist> artists,
    required int durationMs,
    int? popularity,
    String? previewUrl,
    String? externalUrl,
    @Default(false) bool explicit,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

@freezed
abstract class TrackWithStats with _$TrackWithStats {
  const factory TrackWithStats({
    required Track track,
    required int rank,
    int? streamCount,
    int? msPlayed,
    DateTime? firstPlayed,
    DateTime? lastPlayed,
  }) = _TrackWithStats;
}

@freezed
abstract class AudioFeatures with _$AudioFeatures {
  const factory AudioFeatures({
    required String id,
    required double danceability,
    required double energy,
    required double valence,
    required double acousticness,
    required double instrumentalness,
    required double speechiness,
    required double liveness,
    required double loudness,
    required int tempo,
    required int key,
    required int timeSignature,
  }) = _AudioFeatures;

  factory AudioFeatures.fromJson(Map<String, dynamic> json) =>
      _$AudioFeaturesFromJson(json);
}
