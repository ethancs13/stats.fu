import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../data/models/spotify_image.dart';
import '../../providers/spotify_providers.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recsAsync = ref.watch(recommendationsProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Discover'), floating: true, snap: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommended for you',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Based on your top artists and tracks',
                    style: TextStyle(fontSize: 14, color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          recsAsync.when(
            data: (tracks) => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final track = tracks[i];
                    final imageUrl = track.album.images.isNotEmpty ? track.album.images.largest : null;
                    return GestureDetector(
                      onTap: () => context.push('/track/${track.id}'),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: imageUrl != null
                                  ? CachedNetworkImage(imageUrl: imageUrl, width: 56, height: 56, fit: BoxFit.cover)
                                  : Container(width: 56, height: 56, color: AppColors.surfaceElevated),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    track.name,
                                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    track.artists.map((a) => a.name).join(', '),
                                    style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  Formatters.duration(track.durationMs),
                                  style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                                ),
                                if (track.explicit)
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: AppColors.textMuted.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: const Text('E', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: Duration(milliseconds: i * 50), duration: 350.ms)
                        .slideY(begin: 0.05, end: 0, curve: Curves.easeOutCubic);
                  },
                  childCount: tracks.length,
                ),
              ),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(color: AppColors.green)),
            ),
            error: (e, _) => SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.explore_off_rounded, size: 48, color: AppColors.textMuted),
                    const SizedBox(height: 16),
                    const Text('Could not load recommendations'),
                    const SizedBox(height: 8),
                    Text(e.toString(), style: const TextStyle(color: AppColors.textMuted, fontSize: 12), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}
