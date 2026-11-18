import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/lastfm_models.dart';
import '../data/repositories/lastfm_repository.dart';

part 'lastfm_providers.g.dart';

/// The saved Last.fm username (null = not connected)
@riverpod
Future<String?> lastFmUsername(LastFmUsernameRef ref) async {
  final repo = ref.watch(lastFmRepositoryProvider);
  return repo.getSavedUsername();
}

/// Whether Last.fm is connected
@riverpod
Future<bool> lastFmConnected(LastFmConnectedRef ref) async {
  final username = await ref.watch(lastFmUsernameProvider.future);
  return username != null && username.isNotEmpty;
}

/// Full user info (only fetched when username is set)
@riverpod
Future<LastFmUser?> lastFmUser(LastFmUserRef ref) async {
  final username = await ref.watch(lastFmUsernameProvider.future);
  if (username == null || username.isEmpty) return null;
  final repo = ref.watch(lastFmRepositoryProvider);
  return repo.getUserInfo(username);
}

/// Top artists from Last.fm for a given period
@riverpod
Future<List<LastFmArtist>> lastFmTopArtists(
  LastFmTopArtistsRef ref, {
  String period = 'overall',
  int limit = 50,
}) async {
  final username = await ref.watch(lastFmUsernameProvider.future);
  if (username == null || username.isEmpty) return [];
  final repo = ref.watch(lastFmRepositoryProvider);
  return repo.getTopArtists(username, period: period, limit: limit);
}

/// Top tracks from Last.fm for a given period
@riverpod
Future<List<LastFmTrack>> lastFmTopTracks(
  LastFmTopTracksRef ref, {
  String period = 'overall',
  int limit = 50,
}) async {
  final username = await ref.watch(lastFmUsernameProvider.future);
  if (username == null || username.isEmpty) return [];
  final repo = ref.watch(lastFmRepositoryProvider);
  return repo.getTopTracks(username, period: period, limit: limit);
}

/// Recent scrobbles from Last.fm
@riverpod
Future<List<LastFmRecentTrack>> lastFmRecentTracks(
  LastFmRecentTracksRef ref, {
  int limit = 50,
}) async {
  final username = await ref.watch(lastFmUsernameProvider.future);
  if (username == null || username.isEmpty) return [];
  final repo = ref.watch(lastFmRepositoryProvider);
  return repo.getRecentTracks(username, limit: limit);
}

/// Play count for a specific artist (from top 1000)
@riverpod
Future<int?> lastFmArtistPlayCount(
  LastFmArtistPlayCountRef ref,
  String artistName,
) async {
  final username = await ref.watch(lastFmUsernameProvider.future);
  if (username == null || username.isEmpty) return null;
  final repo = ref.watch(lastFmRepositoryProvider);
  return repo.getArtistPlayCount(username, artistName);
}
