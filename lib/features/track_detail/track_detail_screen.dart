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

class TrackDetailScreen extends ConsumerWidget {
  const TrackDetailScreen({super.key, required this.trackId});
  final String trackId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackAsync = ref.watch(trackDetailProvider(trackId));
    final featuresAsync = ref.watch(audioFeaturesProvider(trackId));

    return Scaffold(
      body: trackAsync.when(
        data: (track) {
          final imageUrl = track.album.images.isNotEmpty ? track.album.images.largest : null;
          final historyTracks = ref.watch(historyTopTracksProvider());
          final trackStats = historyTracks.valueOrNull?.firstWhere(
            (h) => h.trackName.toLowerCase() == track.name.toLowerCase() &&
                h.artistName.toLowerCase() == track.artists.first.name.toLowerCase(),
            orElse: () => throw StateError('not found'),
          );

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 300,
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
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      imageUrl != null
                          ? CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover)
                          : Container(color: AppColors.surface),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, AppColors.background],
                            stops: const [0.5, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        track.name,
                        style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.5,
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .slideY(begin: 0.1, end: 0),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () => context.push('/artist/${track.artists.first.id}'),
                        child: Text(
                          track.artists.map((a) => a.name).join(', '),
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(delay: 100.ms, duration: 400.ms),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () => context.push('/album/${track.album.id}',
                            extra: {'name': track.album.name, 'image': imageUrl}),
                        child: Text(
                          track.album.name,
                          style: const TextStyle(fontSize: 14, color: AppColors.textMuted),
                        ),
                      )
                          .animate()
                          .fadeIn(delay: 150.ms, duration: 400.ms),
                      const SizedBox(height: 24),

                      // Stats row
                      Row(
                        children: [
                          if (trackStats != null) ...[
                            _StatPill(
                              icon: Icons.replay_rounded,
                              value: '${Formatters.compactNumber(trackStats.streamCount)}×',
                              label: 'streams',
                              highlight: true,
                            ),
                            const SizedBox(width: 10),
                            _StatPill(
                              icon: Icons.schedule_rounded,
                              value: Formatters.minutes(trackStats.msPlayed),
                              label: 'listened',
                            ),
                          ] else ...[
                            _StatPill(
                              icon: Icons.timer_outlined,
                              value: Formatters.duration(track.durationMs),
                              label: 'duration',
                            ),
                          ],
                          if (track.popularity != null) ...[
                            const SizedBox(width: 10),
                            _StatPill(
                              icon: Icons.trending_up_rounded,
                              value: '${(track.popularity! / 10).toStringAsFixed(1)}',
                              label: 'popularity',
                            ),
                          ],
                        ],
                      )
                          .animate()
                          .fadeIn(delay: 200.ms, duration: 400.ms),

                      if (trackStats != null) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _StatPill(
                              icon: Icons.calendar_today_rounded,
                              value: Formatters.shortDate(trackStats.firstPlayed),
                              label: 'first played',
                            ),
                            const SizedBox(width: 10),
                            _StatPill(
                              icon: Icons.history_rounded,
                              value: Formatters.relativeDate(trackStats.lastPlayed),
                              label: 'last played',
                            ),
                          ],
                        )
                            .animate()
                            .fadeIn(delay: 250.ms, duration: 400.ms),
                      ],
                      const SizedBox(height: 32),

                      // Audio features
                      featuresAsync.when(
                        data: (features) {
                          if (features == null) return const SizedBox.shrink();
                          return _AudioFeaturesSection(features: features);
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),

                      // Import nudge
                      if (trackStats == null) ...[
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () => context.push('/import'),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.green.withValues(alpha: 0.2)),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.upload_rounded, color: AppColors.green, size: 20),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Import your Spotify history to see how many times you\'ve streamed this track.',
                                    style: TextStyle(fontSize: 13, color: AppColors.textMuted),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

class _StatPill extends StatelessWidget {
  const _StatPill({required this.icon, required this.value, required this.label, this.highlight = false});
  final IconData icon;
  final String value;
  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: highlight ? AppColors.green.withValues(alpha: 0.1) : AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: highlight ? Border.all(color: AppColors.green.withValues(alpha: 0.3)) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: highlight ? AppColors.green : AppColors.textMuted),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: highlight ? AppColors.green : AppColors.textPrimary)),
              Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}

class _AudioFeaturesSection extends StatelessWidget {
  const _AudioFeaturesSection({required this.features});
  final dynamic features;

  @override
  Widget build(BuildContext context) {
    final bars = [
      ('Danceability', features.danceability as double),
      ('Energy', features.energy as double),
      ('Valence', features.valence as double),
      ('Acousticness', features.acousticness as double),
      ('Speechiness', features.speechiness as double),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Audio features', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        ...bars.asMap().entries.map((e) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.value.$1, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  Text(
                    '${(e.value.$2 * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: e.value.$2),
                  duration: Duration(milliseconds: 700 + e.key * 80),
                  curve: Curves.easeOutCubic,
                  builder: (_, v, __) => LinearProgressIndicator(
                    value: v,
                    minHeight: 6,
                    backgroundColor: AppColors.surfaceElevated,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.lerp(AppColors.green, const Color(0xFF26C6DA), e.value.$2) ?? AppColors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: Duration(milliseconds: 100 + e.key * 60), duration: 400.ms)),
      ],
    );
  }
}
