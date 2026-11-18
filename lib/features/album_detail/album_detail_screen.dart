import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../providers/history_providers.dart';

class AlbumDetailScreen extends ConsumerWidget {
  const AlbumDetailScreen({
    super.key,
    required this.albumId,
    required this.albumName,
    this.albumImageUrl,
  });

  final String albumId;
  final String albumName;
  final String? albumImageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyTracks = ref.watch(historyTopTracksProvider());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
            backgroundColor: AppColors.background,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_rounded, size: 20),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                albumName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  albumImageUrl != null
                      ? CachedNetworkImage(imageUrl: albumImageUrl!, fit: BoxFit.cover)
                      : Container(color: AppColors.surface),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppColors.background],
                        stops: const [0.4, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              child: historyTracks.when(
                data: (tracks) {
                  final albumTracks = tracks.where((t) => t.albumName?.toLowerCase() == albumName.toLowerCase()).toList();
                  if (albumTracks.isEmpty) {
                    return const _NoHistoryState();
                  }
                  final totalStreams = albumTracks.fold<int>(0, (sum, t) => sum + t.streamCount);
                  final totalMs = albumTracks.fold<int>(0, (sum, t) => sum + t.msPlayed);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _AlbumStat(value: Formatters.compactNumber(totalStreams), label: 'total streams'),
                          const SizedBox(width: 12),
                          _AlbumStat(value: Formatters.minutes(totalMs), label: 'total time'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text('Your streams by track', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      ...albumTracks.take(20).toList().asMap().entries.map((e) {
                        final t = e.value;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            '${e.key + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: e.key < 3 ? AppColors.green : AppColors.textMuted,
                            ),
                          ),
                          title: Text(t.trackName, maxLines: 1, overflow: TextOverflow.ellipsis),
                          subtitle: Text(Formatters.streams(t.streamCount), style: const TextStyle(color: AppColors.green, fontSize: 12)),
                          trailing: Text(Formatters.minutes(t.msPlayed), style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                          onTap: t.spotifyTrackUri != null
                              ? () => context.push('/track/${t.spotifyTrackUri!.split(':').last}')
                              : null,
                        )
                            .animate()
                            .fadeIn(delay: Duration(milliseconds: e.key * 50), duration: 300.ms);
                      }),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator(color: AppColors.green)),
                error: (_, __) => const _NoHistoryState(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumStat extends StatelessWidget {
  const _AlbumStat({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.green)),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }
}

class _NoHistoryState extends StatelessWidget {
  const _NoHistoryState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.album_rounded, size: 64, color: AppColors.textMuted),
            const SizedBox(height: 16),
            const Text('No stream data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('Import your Spotify history to see album stats.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => context.push('/import'),
              icon: const Icon(Icons.upload_rounded),
              label: const Text('Import History'),
            ),
          ],
        ),
      ),
    );
  }
}
