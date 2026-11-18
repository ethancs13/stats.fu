import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/spotify_image.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/artist.dart';

class TopArtistTile extends StatelessWidget {
  const TopArtistTile({
    super.key,
    required this.artist,
    required this.rank,
    this.streamCount,
    this.msPlayed,
    this.animationDelay = Duration.zero,
  });

  final Artist artist;
  final int rank;
  final int? streamCount;
  final int? msPlayed;
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    final imageUrl = artist.images.isNotEmpty ? artist.images.largest : null;
    final heroTag = 'artist-${artist.id}';

    final tile = GestureDetector(
      onTap: () => context.push('/artist/${artist.id}', extra: heroTag),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Text(
                '$rank',
                style: TextStyle(
                  fontSize: rank <= 3 ? 18 : 15,
                  fontWeight: FontWeight.w800,
                  color: rank <= 3 ? AppColors.green : AppColors.textMuted,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 12),
            Hero(
              tag: heroTag,
              child: ClipOval(
                child: imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 54,
                        height: 54,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 54,
                        height: 54,
                        color: AppColors.surface,
                        child: const Icon(Icons.person_rounded, color: AppColors.textMuted, size: 28),
                      ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artist.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      if (streamCount != null) ...[
                        Text(
                          Formatters.streams(streamCount!),
                          style: const TextStyle(fontSize: 12, color: AppColors.green),
                        ),
                        const Text(' · ', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                      ],
                      if (artist.genres.isNotEmpty)
                        Expanded(
                          child: Text(
                            artist.genres.take(2).join(', '),
                            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (artist.popularity != null)
              _PopularityBar(popularity: artist.popularity!),
          ],
        ),
      ),
    );

    // Skip entrance animation for off-screen items — prevents re-animating on scroll
    if (rank > 10) return tile;
    return tile
        .animate()
        .fadeIn(delay: animationDelay, duration: 350.ms)
        .slideX(begin: 0.04, end: 0, curve: Curves.easeOutCubic);
  }
}

class _PopularityBar extends StatelessWidget {
  const _PopularityBar({required this.popularity});
  final int popularity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${(popularity / 10).toStringAsFixed(1)}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 3),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: popularity / 100),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          builder: (_, v, __) => SizedBox(
            width: 40,
            height: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: v,
                backgroundColor: AppColors.surfaceElevated,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.green),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
