import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/repositories/auth_repository.dart';
import '../data/models/spotify_user.dart';
import '../data/repositories/spotify_repository.dart';

part 'auth_provider.g.dart';

@riverpod
Future<bool> isAuthenticated(IsAuthenticatedRef ref) async {
  final auth = ref.watch(authRepositoryProvider);
  return auth.isLoggedIn;
}

@riverpod
Future<SpotifyUser> currentUser(CurrentUserRef ref) async {
  final spotify = ref.watch(spotifyRepositoryProvider);
  return spotify.getCurrentUser();
}
