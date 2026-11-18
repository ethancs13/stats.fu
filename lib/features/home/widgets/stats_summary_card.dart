import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';

class StatsSummaryCard extends StatelessWidget {
  const StatsSummaryCard({
    super.key,
    required this.value,
    required this.label,
    this.change,
    this.isLoading = false,
    this.animationDelay = Duration.zero,
  });

  final String value;
  final String label;
  final double? change;
  final bool isLoading;
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: isLoading ? _shimmer() : _content(),
    )
        .animate()
        .fadeIn(delay: animationDelay, duration: 400.ms)
        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutCubic);
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                letterSpacing: -1,
              ),
            ),
            if (change != null) ...[
              const SizedBox(width: 6),
              _ChangeChip(change: change!),
            ],
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _shimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ShimmerBox(width: 80, height: 28),
        const SizedBox(height: 6),
        _ShimmerBox(width: 120, height: 12),
      ],
    );
  }
}

class _ChangeChip extends StatelessWidget {
  const _ChangeChip({required this.change});
  final double change;

  @override
  Widget build(BuildContext context) {
    final isPositive = change >= 0;
    final color = isPositive ? AppColors.green : AppColors.error;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
            color: color,
            size: 10,
          ),
          const SizedBox(width: 2),
          Text(
            '${change.abs().toStringAsFixed(0)}%',
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(4),
      ),
    )
        .animate(onPlay: (c) => c.repeat())
        .shimmer(duration: 1200.ms, color: Colors.white.withValues(alpha: 0.08));
  }
}
