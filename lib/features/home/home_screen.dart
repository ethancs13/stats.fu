import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/spotify_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../providers/auth_provider.dart';
import '../../providers/history_providers.dart';
import '../../providers/spotify_providers.dart';
import 'widgets/genre_breakdown.dart';
import 'widgets/listening_clock_widget.dart';
import 'widgets/stats_summary_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final recentAsync = ref.watch(recentlyPlayedProvider);
    final topArtistsShort = ref.watch(topArtistsProvider(timeRange: SpotifyConstants.shortTerm));
    final totalStreamsAsync = ref.watch(historyTotalStreamsProvider());
    final totalMsAsync = ref.watch(historyTotalMsProvider());
    final listeningClockAsync = ref.watch(listeningClockProvider());
    final historyCount = ref.watch(historyCountProvider);

    final hasHistory = historyCount.valueOrNull != null && historyCount.valueOrNull! > 0;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Row(
              children: [
                const Text(
                  'stats.fu',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'FREE',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => context.push('/import'),
                icon: const Icon(Icons.upload_rounded),
                tooltip: 'Import history',
              ),
              GestureDetector(
                onTap: () => context.push('/settings'),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: user.when(
                    data: (u) => CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.surface,
                      backgroundImage: u.images.isNotEmpty
                          ? CachedNetworkImageProvider(u.images.first.url)
                          : null,
                      child: u.images.isEmpty
                          ? Text(
                              u.displayName.isNotEmpty ? u.displayName[0].toUpperCase() : '?',
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            )
                          : null,
                    ),
                    loading: () => const CircleAvatar(radius: 18, backgroundColor: AppColors.surface),
                    error: (_, __) => const CircleAvatar(radius: 18, backgroundColor: AppColors.surface),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats header
                  Text(
                    user.valueOrNull != null
                        ? 'Hey, ${user.value!.displayName.split(' ').first}!'
                        : 'Your Stats',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.1, end: 0),
                  const SizedBox(height: 4),
                  const Text(
                    'Past 6 months',
                    style: TextStyle(fontSize: 14, color: AppColors.textMuted),
                  )
                      .animate()
                      .fadeIn(delay: 100.ms, duration: 400.ms),
                  const SizedBox(height: 20),

                  // Stats grid
                  _StatsGrid(
                    hasHistory: hasHistory,
                    totalStreamsAsync: totalStreamsAsync,
                    totalMsAsync: totalMsAsync,
                    recentAsync: recentAsync,
                  ),
                  const SizedBox(height: 32),

                  // Import banner if no history
                  if (!hasHistory) ...[
                    _ImportBanner(onTap: () => context.push('/import')),
                    const SizedBox(height: 32),
                  ],

                  // Genre breakdown
                  topArtistsShort.when(
                    data: (artists) {
                      final genreMap = <String, int>{};
                      for (final artist in artists) {
                        for (final genre in artist.genres) {
                          genreMap[genre] = (genreMap[genre] ?? 0) + 1;
                        }
                      }
                      final sorted = genreMap.entries.toList()
                        ..sort((a, b) => b.value.compareTo(a.value));
                      final entries = sorted.take(8).toList().asMap().entries.map((e) {
                        final color = AppColors.genreColors[e.key % AppColors.genreColors.length];
                        return GenreEntry(name: e.value.key, count: e.value.value, color: color);
                      }).toList();
                      return GenreBreakdown(genres: entries);
                    },
                    loading: () => const GenreBreakdown(genres: [], isLoading: true),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 32),

                  // Listening clock
                  listeningClockAsync.when(
                    data: (hours) {
                      final List<int> clockData = hours.isNotEmpty
                          ? hours
                          : recentAsync.valueOrNull
                              ?.fold<List<int>>(List.filled(24, 0), (acc, item) {
                                acc[item.playedAt.hour]++;
                                return acc;
                              }) ?? List.filled(24, 0);
                      return ListeningClockWidget(hourCounts: clockData);
                    },
                    loading: () => const ListeningClockWidget(hourCounts: [], isLoading: true),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 32),

                  // Recently played
                  recentAsync.when(
                    data: (items) => _RecentlyPlayed(items: items),
                    loading: () => const _RecentlyPlayedShimmer(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({
    required this.hasHistory,
    required this.totalStreamsAsync,
    required this.totalMsAsync,
    required this.recentAsync,
  });

  final bool hasHistory;
  final AsyncValue<int> totalStreamsAsync;
  final AsyncValue<int> totalMsAsync;
  final AsyncValue<dynamic> recentAsync;

  @override
  Widget build(BuildContext context) {
    final streams = hasHistory ? totalStreamsAsync : const AsyncData(0);
    final ms = hasHistory ? totalMsAsync : const AsyncData(0);

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        StatsSummaryCard(
          value: streams.when(
            data: (v) => Formatters.compactNumber(v),
            loading: () => '—',
            error: (_, __) => '—',
          ),
          label: hasHistory ? 'total streams (lifetime)' : 'Import history for lifetime stats',
          isLoading: streams.isLoading,
          animationDelay: const Duration(milliseconds: 0),
        ),
        StatsSummaryCard(
          value: ms.when(
            data: (v) => Formatters.minutes(v),
            loading: () => '—',
            error: (_, __) => '—',
          ),
          label: hasHistory ? 'total minutes (lifetime)' : 'minutes streamed',
          isLoading: ms.isLoading,
          animationDelay: const Duration(milliseconds: 80),
        ),
        StatsSummaryCard(
          value: recentAsync.when(
            data: (items) {
              final recent = items as List;
              return '${recent.length}';
            },
            loading: () => '—',
            error: (_, __) => '—',
          ),
          label: 'tracks in last 50 plays',
          isLoading: recentAsync.isLoading,
          animationDelay: const Duration(milliseconds: 160),
        ),
        StatsSummaryCard(
          value: recentAsync.when(
            data: (items) {
              final recent = items as List;
              final artists = <String>{};
              for (final item in recent) {
                artists.add(item.track.artists.first.name as String);
              }
              return '${artists.length}';
            },
            loading: () => '—',
            error: (_, __) => '—',
          ),
          label: 'different artists recently',
          isLoading: recentAsync.isLoading,
          animationDelay: const Duration(milliseconds: 240),
        ),
      ],
    );
  }
}

class _ImportBanner extends StatelessWidget {
  const _ImportBanner({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.green.withValues(alpha: 0.15),
              AppColors.green.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.green.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.green.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.upload_rounded, color: AppColors.green, size: 22),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Import your lifetime history',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Unlock total stream counts, listening clock & more — completely free.',
                    style: TextStyle(fontSize: 13, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      )
          .animate()
          .fadeIn(delay: 300.ms, duration: 400.ms)
          .slideY(begin: 0.05, end: 0),
    );
  }
}

class _RecentlyPlayed extends StatelessWidget {
  const _RecentlyPlayed({required this.items});
  final List items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recently played',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: () => context.go('/history'),
              child: const Text('See all'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items.take(5).toList().asMap().entries.map((e) {
          final item = e.value;
          final track = item.track;
          final imageUrl = track.album.images.isNotEmpty ? track.album.images.first.url : null;
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl != null
                  ? CachedNetworkImage(imageUrl: imageUrl, width: 48, height: 48, fit: BoxFit.cover)
                  : Container(
                      width: 48, height: 48,
                      color: AppColors.surface,
                      child: const Icon(Icons.music_note_rounded, color: AppColors.textMuted),
                    ),
            ),
            title: Text(
              track.name as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              (track.artists as List).map((a) => a.name).join(', '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
            ),
            onTap: () => context.push('/track/${track.id}'),
          )
              .animate()
              .fadeIn(delay: Duration(milliseconds: e.key * 60), duration: 300.ms)
              .slideX(begin: 0.05, end: 0);
        }),
      ],
    );
  }
}

class _RecentlyPlayedShimmer extends StatelessWidget {
  const _RecentlyPlayedShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150, height: 20,
          decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(4)),
        )
            .animate(onPlay: (c) => c.repeat())
            .shimmer(duration: 1200.ms, color: Colors.white.withValues(alpha: 0.08)),
        const SizedBox(height: 12),
        ...List.generate(5, (i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(8)),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .shimmer(delay: Duration(milliseconds: i * 100), duration: 1200.ms, color: Colors.white.withValues(alpha: 0.08)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: double.infinity, height: 14, decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(4)))
                        .animate(onPlay: (c) => c.repeat())
                        .shimmer(delay: Duration(milliseconds: i * 100), duration: 1200.ms, color: Colors.white.withValues(alpha: 0.08)),
                    const SizedBox(height: 6),
                    Container(width: 100, height: 12, decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(4)))
                        .animate(onPlay: (c) => c.repeat())
                        .shimmer(delay: Duration(milliseconds: i * 100), duration: 1200.ms, color: Colors.white.withValues(alpha: 0.08)),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
