import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';

class ArtistStatGrid extends StatelessWidget {
  const ArtistStatGrid({
    super.key,
    required this.stats,
  });

  final List<ArtistStat> stats;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: stats.asMap().entries.map((e) => _StatCell(
        stat: e.value,
        index: e.key,
      )).toList(),
    );
  }
}

class ArtistStat {
  const ArtistStat({required this.value, required this.label, this.isHighlighted = false});
  final String value;
  final String label;
  final bool isHighlighted;
}

class _StatCell extends StatelessWidget {
  const _StatCell({required this.stat, required this.index});
  final ArtistStat stat;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: stat.isHighlighted
            ? Border.all(color: AppColors.green.withValues(alpha: 0.4), width: 1)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stat.value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: stat.isHighlighted ? AppColors.green : AppColors.textPrimary,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 100 + index * 60), duration: 400.ms)
        .scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1), curve: Curves.easeOutCubic);
  }
}
