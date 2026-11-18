import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/constants/spotify_constants.dart';
import '../data/models/artist.dart';
import '../data/models/recently_played.dart';
import '../data/models/track.dart';
import '../data/repositories/spotify_repository.dart';

part 'spotify_providers.g.dart';

@riverpod
Future<List<Artist>> topArtists(
  TopArtistsRef ref, {
  String timeRange = SpotifyConstants.mediumTerm,
}) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getTopArtists(timeRange);
}

@riverpod
Future<List<Track>> topTracks(
  TopTracksRef ref, {
  String timeRange = SpotifyConstants.mediumTerm,
}) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getTopTracks(timeRange);
}

@riverpod
Future<List<RecentlyPlayedItem>> recentlyPlayed(RecentlyPlayedRef ref) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getRecentlyPlayed();
}

@riverpod
Future<Artist> artistDetail(ArtistDetailRef ref, String artistId) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getArtist(artistId);
}

@riverpod
Future<List<Artist>> relatedArtists(RelatedArtistsRef ref, String artistId) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getRelatedArtists(artistId);
}

@riverpod
Future<List<Track>> artistTopTracks(ArtistTopTracksRef ref, String artistId) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getArtistTopTracks(artistId);
}

@riverpod
Future<Track> trackDetail(TrackDetailRef ref, String trackId) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getTrack(trackId);
}

@riverpod
Future<AudioFeatures?> audioFeatures(AudioFeaturesRef ref, String trackId) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getAudioFeatures(trackId);
}

@riverpod
Future<List<Track>> recommendations(RecommendationsRef ref) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  final topArtistsList = await ref.watch(
    topArtistsProvider(timeRange: SpotifyConstants.shortTerm).future,
  );
  final topTracksList = await ref.watch(
    topTracksProvider(timeRange: SpotifyConstants.shortTerm).future,
  );
  return spotify.getRecommendations(
    seedArtists: topArtistsList.take(3).map((a) => a.id).toList(),
    seedTracks: topTracksList.take(2).map((t) => t.id).toList(),
  );
}

@riverpod
Future<List<Artist>> followedArtists(FollowedArtistsRef ref) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getFollowedArtists();
}
