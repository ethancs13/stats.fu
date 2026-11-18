import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../data/repositories/lastfm_repository.dart';
import '../../providers/lastfm_providers.dart';

class LastFmConnectCard extends ConsumerStatefulWidget {
  const LastFmConnectCard({super.key, this.compact = false});

  /// Compact mode shows a smaller card (for History page)
  final bool compact;

  @override
  ConsumerState<LastFmConnectCard> createState() => _LastFmConnectCardState();
}

class _LastFmConnectCardState extends ConsumerState<LastFmConnectCard> {
  bool _editing = false;
  bool _loading = false;
  String? _error;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _connect() async {
    final username = _controller.text.trim();
    if (username.isEmpty) return;
    setState(() { _loading = true; _error = null; });
    try {
      final repo = ref.read(lastFmRepositoryProvider);
      // Validate the username by fetching user info
      await repo.getUserInfo(username);
      await repo.saveUsername(username);
      ref.invalidate(lastFmUsernameProvider);
      ref.invalidate(lastFmUserProvider);
      if (mounted) setState(() { _editing = false; _loading = false; });
    } catch (_) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = 'User not found. Check your Last.fm username.';
        });
      }
    }
  }

  Future<void> _disconnect() async {
    final repo = ref.read(lastFmRepositoryProvider);
    await repo.saveUsername(null);
    ref.invalidate(lastFmUsernameProvider);
    ref.invalidate(lastFmUserProvider);
    ref.invalidate(lastFmTopArtistsProvider());
    ref.invalidate(lastFmTopTracksProvider());
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(lastFmUserProvider);
    final isConnected = userAsync.valueOrNull != null;

    if (isConnected && !_editing) {
      return _ConnectedCard(
        user: userAsync.value!,
        compact: widget.compact,
        onDisconnect: _disconnect,
      ).animate().fadeIn(duration: 400.ms);
    }

    return _DisconnectCard(
      compact: widget.compact,
      editing: _editing,
      loading: _loading,
      error: _error,
      controller: _controller,
      onConnect: () => setState(() { _editing = true; _error = null; }),
      onSubmit: _connect,
      onCancel: () => setState(() { _editing = false; _error = null; _controller.clear(); }),
    );
  }
}

class _ConnectedCard extends StatelessWidget {
  const _ConnectedCard({required this.user, required this.compact, required this.onDisconnect});
  final dynamic user;
  final bool compact;
  final VoidCallback onDisconnect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: compact
          ? const EdgeInsets.symmetric(horizontal: 14, vertical: 12)
          : const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD51007).withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFD51007).withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('lfm', style: TextStyle(color: Color(0xFFD51007), fontWeight: FontWeight.w900, fontSize: 11)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Last.fm connected', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.green.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('ACTIVE', style: TextStyle(fontSize: 9, color: AppColors.green, fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '@${user.name} · ${Formatters.compactNumber(user.playCount as int)} scrobbles',
                  style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _confirmDisconnect(context),
            icon: const Icon(Icons.link_off_rounded, color: AppColors.textMuted, size: 20),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  void _confirmDisconnect(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Disconnect Last.fm?'),
        content: const Text('Your Last.fm stats will no longer appear in the app.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () { Navigator.pop(ctx); onDisconnect(); },
            child: const Text('Disconnect', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}

class _DisconnectCard extends StatelessWidget {
  const _DisconnectCard({
    required this.compact,
    required this.editing,
    required this.loading,
    required this.error,
    required this.controller,
    required this.onConnect,
    required this.onSubmit,
    required this.onCancel,
  });

  final bool compact;
  final bool editing;
  final bool loading;
  final String? error;
  final TextEditingController controller;
  final VoidCallback onConnect;
  final VoidCallback onSubmit;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    if (!editing) {
      return GestureDetector(
        onTap: onConnect,
        child: Container(
          padding: compact
              ? const EdgeInsets.symmetric(horizontal: 14, vertical: 12)
              : const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFD51007).withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFD51007).withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('lfm', style: TextStyle(color: Color(0xFFD51007), fontWeight: FontWeight.w900, fontSize: 11)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Connect Last.fm',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      compact
                          ? 'Unlock lifetime play counts & full history'
                          : 'See total play counts, lifetime streams, and full listening history',
                      style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD51007).withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFD51007).withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('lfm', style: TextStyle(color: Color(0xFFD51007), fontWeight: FontWeight.w900, fontSize: 11)),
                ),
              ),
              const SizedBox(width: 10),
              const Text('Enter your Last.fm username', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => onSubmit(),
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'your_lastfm_username',
              hintStyle: const TextStyle(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.surfaceElevated,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              errorText: error,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textMuted,
                    side: const BorderSide(color: AppColors.divider),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  onPressed: loading ? null : onSubmit,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFD51007),
                    foregroundColor: Colors.white,
                  ),
                  child: loading
                      ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Text('Connect'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
