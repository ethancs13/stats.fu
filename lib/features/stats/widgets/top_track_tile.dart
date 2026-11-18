import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/spotify_image.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/track.dart';

class TopTrackTile extends StatelessWidget {
  const TopTrackTile({
    super.key,
    required this.track,
    required this.rank,
    this.streamCount,
    this.animationDelay = Duration.zero,
  });

  final Track track;
  final int rank;
  final int? streamCount;
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    final imageUrl = track.album.images.isNotEmpty ? track.album.images.largest : null;

    final tile = GestureDetector(
      onTap: () => context.push('/track/${track.id}'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Rank
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
            // Album art
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl != null
                  ? CachedNetworkImage(imageUrl: imageUrl, width: 54, height: 54, fit: BoxFit.cover)
                  : Container(
                      width: 54,
                      height: 54,
                      color: AppColors.surface,
                      child: const Icon(Icons.music_note_rounded, color: AppColors.textMuted, size: 28),
                    ),
            ),
            const SizedBox(width: 14),
            // Track info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    track.artists.map((a) => a.name).join(', '),
                    style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Stream count or duration
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (streamCount != null)
                  Text(
                    '${Formatters.compactNumber(streamCount!)}×',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  )
                else
                  Text(
                    Formatters.duration(track.durationMs),
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textMuted,
                    ),
                  ),
                if (track.explicit)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.textMuted.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Text('E', style: TextStyle(fontSize: 9, color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );

    if (rank > 10) return tile;
    return tile
        .animate()
        .fadeIn(delay: animationDelay, duration: 350.ms)
        .slideX(begin: 0.04, end: 0, curve: Curves.easeOutCubic);
  }
}
