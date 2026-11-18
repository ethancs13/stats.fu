import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/auth_repository.dart';
import 'providers/auth_provider.dart';

class StatsFuApp extends ConsumerStatefulWidget {
  const StatsFuApp({super.key});

  @override
  ConsumerState<StatsFuApp> createState() => _StatsFuAppState();
}

class _StatsFuAppState extends ConsumerState<StatsFuApp> {
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen(_handleDeepLink);
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) _handleDeepLink(uri);
    });
  }

  Future<void> _handleDeepLink(Uri uri) async {
    if (uri.scheme == 'com.statsfu.app' && uri.host == 'callback') {
      final auth = ref.read(authRepositoryProvider);
      final success = await auth.handleCallback(uri);
      if (success) {
        // Force router to re-check auth — redirects /auth → /home automatically
        ref.invalidate(isAuthenticatedProvider);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'stats.fu',
      theme: AppTheme.dark,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
