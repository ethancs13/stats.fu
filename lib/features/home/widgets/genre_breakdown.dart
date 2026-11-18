import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';

class GenreBreakdown extends StatelessWidget {
  const GenreBreakdown({
    super.key,
    required this.genres,
    this.isLoading = false,
  });

  final List<GenreEntry> genres;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Genres',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        if (genres.isNotEmpty)
          Text(
            'Your top genre is ${genres.first.name}',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textMuted,
            ),
          ),
        const SizedBox(height: 16),
        if (isLoading)
          ...List.generate(5, (i) => _ShimmerRow(delay: Duration(milliseconds: i * 80)))
        else
          ...genres.take(8).toList().asMap().entries.map((e) => _GenreRow(
                entry: e.value,
                maxCount: genres.first.count,
                index: e.key,
              )),
      ],
    );
  }
}

class GenreEntry {
  const GenreEntry({required this.name, required this.count, required this.color});
  final String name;
  final int count;
  final Color color;
}

class _GenreRow extends StatelessWidget {
  const _GenreRow({
    required this.entry,
    required this.maxCount,
    required this.index,
  });

  final GenreEntry entry;
  final int maxCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    final fraction = maxCount > 0 ? entry.count / maxCount : 0.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Container(
                      height: 8,
                      width: constraints.maxWidth,
                      color: AppColors.surfaceElevated,
                    ),
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: fraction),
                      duration: Duration(milliseconds: 600 + index * 80),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, _) => Container(
                        height: 8,
                        width: constraints.maxWidth * value,
                        decoration: BoxDecoration(
                          color: entry.color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 100 + index * 60), duration: 400.ms)
        .slideX(begin: -0.05, end: 0);
  }
}

class _ShimmerRow extends StatelessWidget {
  const _ShimmerRow({required this.delay});
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(4),
            ),
          )
              .animate(onPlay: (c) => c.repeat())
              .shimmer(delay: delay, duration: 1200.ms, color: Colors.white.withValues(alpha: 0.08)),
          const SizedBox(height: 4),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(4),
            ),
          )
              .animate(onPlay: (c) => c.repeat())
              .shimmer(delay: delay, duration: 1200.ms, color: Colors.white.withValues(alpha: 0.08)),
        ],
      ),
    );
  }
}
