import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/auth_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/stats/stats_screen.dart';
import '../../features/artist_detail/artist_detail_screen.dart';
import '../../features/track_detail/track_detail_screen.dart';
import '../../features/album_detail/album_detail_screen.dart';
import '../../features/history/history_screen.dart';
import '../../features/friends/friends_screen.dart';
import '../../features/discover/discover_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/settings/import_history_screen.dart';
import '../../providers/auth_provider.dart';
import '../shell/main_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(isAuthenticatedProvider);

  return GoRouter(
    initialLocation: '/home',
    redirect: (context, state) {
      final isAuth = authState.valueOrNull ?? false;
      final isAuthRoute = state.matchedLocation == '/auth';
      if (!isAuth && !isAuthRoute) return '/auth';
      if (isAuth && isAuthRoute) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/stats',
            builder: (context, state) => const StatsScreen(),
          ),
          GoRoute(
            path: '/history',
            builder: (context, state) => const HistoryScreen(),
          ),
          GoRoute(
            path: '/friends',
            builder: (context, state) => const FriendsScreen(),
          ),
          GoRoute(
            path: '/discover',
            builder: (context, state) => const DiscoverScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/artist/:id',
        builder: (context, state) => ArtistDetailScreen(
          artistId: state.pathParameters['id']!,
          heroTag: state.extra as String?,
        ),
      ),
      GoRoute(
        path: '/track/:id',
        builder: (context, state) => TrackDetailScreen(
          trackId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: '/album/:id',
        builder: (context, state) => AlbumDetailScreen(
          albumId: state.pathParameters['id']!,
          albumName: (state.extra as Map<String, String>?)?['name'] ?? '',
          albumImageUrl: (state.extra as Map<String, String>?)?['image'],
        ),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/import',
        builder: (context, state) => const ImportHistoryScreen(),
      ),
    ],
  );
});
