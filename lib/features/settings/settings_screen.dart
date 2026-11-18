import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/history_repository.dart';
import '../../features/lastfm/lastfm_connect_card.dart';
import '../../providers/auth_provider.dart';
import '../../providers/history_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final historyCount = ref.watch(historyCountProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // ── Spotify account ──────────────────────────────────────────────
          userAsync.when(
            data: (user) => ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.surface,
                child: Text(
                  user.displayName.isNotEmpty ? user.displayName[0].toUpperCase() : '?',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              title: Text(user.displayName, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(user.email ?? user.id, style: const TextStyle(color: AppColors.textMuted)),
            ),
            loading: () => const ListTile(title: Text('Loading...')),
            error: (_, __) => const ListTile(title: Text('Spotify Account')),
          ),
          const Divider(),

          // ── Last.fm ──────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'Last.fm',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
                letterSpacing: 0.8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const LastFmConnectCard(),
          ),
          const Divider(),

          // ── Spotify data import (optional / advanced) ────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'Advanced',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
                letterSpacing: 0.8,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.upload_rounded, color: AppColors.textMuted),
            title: const Text('Import Spotify history'),
            subtitle: Text(
              historyCount.valueOrNull != null && historyCount.value! > 0
                  ? '${historyCount.value} streams imported'
                  : 'Upload your Spotify data export for lifetime stats',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
            ),
            trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
            onTap: () => context.push('/import'),
          ),
          if (historyCount.valueOrNull != null && historyCount.value! > 0)
            ListTile(
              leading: const Icon(Icons.delete_outline_rounded, color: AppColors.error),
              title: const Text('Clear imported history', style: TextStyle(color: AppColors.error)),
              onTap: () => _confirmClear(context, ref),
            ),
          const Divider(),

          // ── About ────────────────────────────────────────────────────────
          const ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text('About stats.fu'),
            subtitle: Text('Version 1.0.0 · Open source · No paywalls',
                style: TextStyle(color: AppColors.textMuted)),
          ),
          const Divider(),

          // ── Logout ───────────────────────────────────────────────────────
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: AppColors.error),
            title: const Text('Disconnect Spotify', style: TextStyle(color: AppColors.error)),
            onTap: () => _confirmLogout(context, ref),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _confirmClear(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Clear imported history?'),
        content: const Text('This will delete all imported streaming history from this device.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await ref.read(historyRepositoryProvider).clearHistory();
              ref.invalidate(historyCountProvider);
            },
            child: const Text('Clear', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Disconnect Spotify?'),
        content: const Text('You\'ll need to reconnect to view your stats.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await ref.read(authRepositoryProvider).logout();
              if (context.mounted) context.go('/auth');
            },
            child: const Text('Disconnect', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}
