import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../providers/history_providers.dart';
import '../../data/models/spotify_image.dart';
import '../../providers/spotify_providers.dart';
import 'widgets/artist_stat_grid.dart';

class ArtistDetailScreen extends ConsumerWidget {
  const ArtistDetailScreen({super.key, required this.artistId, this.heroTag});

  final String artistId;
  final String? heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistAsync = ref.watch(artistDetailProvider(artistId));
    final topTracksAsync = ref.watch(artistTopTracksProvider(artistId));
    final relatedAsync = ref.watch(relatedArtistsProvider(artistId));
    final recentlyPlayed = ref.watch(recentlyPlayedProvider);

    return Scaffold(
      body: artistAsync.when(
        data: (artist) {
          final imageUrl = artist.images.isNotEmpty ? artist.images.largest : null;
          final historyStats = ref.watch(artistHistoryStatsProvider(artist.name));

          // Count appearances in recently played
          final recentCount = recentlyPlayed.valueOrNull
              ?.where((item) => item.track.artists.any((a) => a.id == artist.id))
              .length ?? 0;

          final stats = [
            ArtistStat(
              value: historyStats.valueOrNull != null
                  ? '${Formatters.compactNumber(historyStats.value!.streamCount)}×'
                  : '—',
              label: 'total times streamed',
              isHighlighted: historyStats.valueOrNull != null,
            ),
            ArtistStat(
              value: historyStats.valueOrNull != null
                  ? Formatters.minutes(historyStats.value!.msPlayed)
                  : '—',
              label: 'total minutes streamed',
            ),
            ArtistStat(
              value: artist.popularity != null
                  ? (artist.popularity! / 10).toStringAsFixed(1)
                  : '—',
              label: '0–10 popularity',
            ),
            ArtistStat(
              value: artist.followersTotal != null
                  ? Formatters.compactNumber(artist.followersTotal!)
                  : '—',
              label: 'followers',
            ),
            ArtistStat(
              value: '$recentCount',
              label: 'times in last 50 streams',
            ),
            if (historyStats.valueOrNull != null)
              ArtistStat(
                value: '#${historyStats.value!.rank}',
                label: 'of your most streamed (lifetime)',
                isHighlighted: historyStats.value!.rank <= 10,
              ),
          ];

          return CustomScrollView(
            slivers: [
              // Hero header with parallax
              SliverAppBar(
                expandedHeight: 320,
                pinned: true,
                stretch: true,
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
                  stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: heroTag ?? 'artist-$artistId',
                        child: imageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                              )
                            : Container(color: AppColors.surface),
                      ),
                      // Gradient overlay
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.background.withValues(alpha: 0.7),
                              AppColors.background,
                            ],
                            stops: const [0.4, 0.75, 1.0],
                          ),
                        ),
                      ),
                      // Artist name at bottom
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              artist.name,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: -1,
                              ),
                            ),
                            if (artist.followersTotal != null)
                              Text(
                                '${Formatters.compactNumber(artist.followersTotal!)} followers',
                                style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Genre chips
                      if (artist.genres.isNotEmpty) ...[
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: artist.genres.take(5).map((g) => Chip(
                            label: Text(g),
                            backgroundColor: AppColors.surfaceElevated,
                            labelStyle: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            visualDensity: VisualDensity.compact,
                            side: BorderSide.none,
                          )).toList(),
                        )
                            .animate()
                            .fadeIn(delay: 100.ms, duration: 400.ms),
                        const SizedBox(height: 24),
                      ],

                      // Stats grid
                      ArtistStatGrid(stats: stats),
                      const SizedBox(height: 32),

                      // Import nudge if no history
                      if (historyStats.valueOrNull == null) ...[
                        _ImportNudge(),
                        const SizedBox(height: 32),
                      ],

                      // Top tracks from this artist
                      topTracksAsync.when(
                        data: (tracks) {
                          if (tracks.isEmpty) return const SizedBox.shrink();
                          final historyTracks = ref.watch(historyTopTracksProvider());
                          final historyMap = <String, int>{};
                          if (historyTracks.valueOrNull != null) {
                            for (final h in historyTracks.value!) {
                              historyMap[h.trackName.toLowerCase()] = h.streamCount;
                            }
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your top tracks from ${artist.name}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...tracks.take(5).toList().asMap().entries.map((e) {
                                final track = e.value;
                                final streams = historyMap[track.name.toLowerCase()];
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Text(
                                    '${e.key + 1}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: e.key < 3 ? AppColors.green : AppColors.textMuted,
                                    ),
                                  ),
                                  title: Text(
                                    track.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: streams != null
                                      ? Text(
                                          '${Formatters.compactNumber(streams)} streams',
                                          style: const TextStyle(color: AppColors.green, fontSize: 12),
                                        )
                                      : Text(
                                          Formatters.duration(track.durationMs),
                                          style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                                        ),
                                  trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                                  onTap: () => context.push('/track/${track.id}'),
                                )
                                    .animate()
                                    .fadeIn(delay: Duration(milliseconds: e.key * 60), duration: 300.ms);
                              }),
                            ],
                          );
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                      const SizedBox(height: 32),

                      // Related artists
                      relatedAsync.when(
                        data: (related) {
                          if (related.isEmpty) return const SizedBox.shrink();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Related artists',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: related.length,
                                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                                  itemBuilder: (context, i) {
                                    final r = related[i];
                                    final rImage = r.images.isNotEmpty ? r.images.medium : null;
                                    return GestureDetector(
                                      onTap: () => context.push('/artist/${r.id}'),
                                      child: SizedBox(
                                        width: 80,
                                        child: Column(
                                          children: [
                                            ClipOval(
                                              child: rImage != null
                                                  ? CachedNetworkImage(imageUrl: rImage, width: 72, height: 72, fit: BoxFit.cover)
                                                  : Container(width: 72, height: 72, color: AppColors.surface),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              r.name,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        .animate()
                                        .fadeIn(delay: Duration(milliseconds: i * 50), duration: 300.ms)
                                        .slideX(begin: 0.1, end: 0);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.green)),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _ImportNudge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/import'),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.green.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            const Icon(Icons.info_outline_rounded, color: AppColors.green, size: 20),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Import your Spotify history to unlock total stream counts for this artist.',
                style: TextStyle(fontSize: 13, color: AppColors.textMuted),
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}
