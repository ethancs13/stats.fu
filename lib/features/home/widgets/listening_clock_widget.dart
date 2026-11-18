import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';

class ListeningClockWidget extends StatefulWidget {
  const ListeningClockWidget({
    super.key,
    required this.hourCounts,
    this.isLoading = false,
  });

  final List<int> hourCounts;
  final bool isLoading;

  @override
  State<ListeningClockWidget> createState() => _ListeningClockWidgetState();
}

class _ListeningClockWidgetState extends State<ListeningClockWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _progress = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    if (!widget.isLoading) _controller.forward();
  }

  @override
  void didUpdateWidget(ListeningClockWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isLoading && oldWidget.isLoading) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Listening clock',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Hours you've listened the most",
          style: TextStyle(fontSize: 14, color: AppColors.textMuted),
        ),
        const SizedBox(height: 24),
        Center(
          child: widget.isLoading
              ? _LoadingClock()
              : AnimatedBuilder(
                  animation: _progress,
                  builder: (context, _) => CustomPaint(
                    size: const Size(260, 260),
                    painter: _ClockPainter(
                      hourCounts: widget.hourCounts,
                      progress: _progress.value,
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Legend('Morning', '6–12', AppColors.green),
            const SizedBox(width: 16),
            _Legend('Afternoon', '12–18', const Color(0xFF26C6DA)),
            const SizedBox(width: 16),
            _Legend('Night', '18–24', const Color(0xFF7E57C2)),
          ],
        ),
      ],
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 500.ms);
  }
}

class _ClockPainter extends CustomPainter {
  _ClockPainter({required this.hourCounts, required this.progress});

  final List<int> hourCounts;
  final double progress;

  static const _hourColors = [
    Color(0xFF1DB954), // 0–6: late night (green)
    Color(0xFF1DB954),
    Color(0xFF26C6DA), // 6–12: morning (teal)
    Color(0xFF26C6DA),
    Color(0xFF7E57C2), // 12–18: afternoon (purple)
    Color(0xFF7E57C2),
    Color(0xFFFF7043), // 18–24: evening (orange)
    Color(0xFFFF7043),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2 - 8;
    final innerRadius = maxRadius * 0.35;

    final maxCount = hourCounts.isEmpty ? 1 : hourCounts.reduce(math.max);
    if (maxCount == 0) return;

    const sweepAngle = (math.pi * 2) / 24;

    // Background ring
    final bgPaint = Paint()
      ..color = AppColors.surfaceElevated
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, (innerRadius + maxRadius) / 2, bgPaint);

    for (var hour = 0; hour < 24; hour++) {
      final count = hourCounts.length > hour ? hourCounts[hour] : 0;
      final fraction = count / maxCount;
      final animatedFraction = fraction * progress;

      final startAngle = -math.pi / 2 + hour * sweepAngle;
      final barHeight = (maxRadius - innerRadius) * animatedFraction;

      if (barHeight < 2) continue;

      final colorIndex = (hour / 3).floor() % _hourColors.length;
      final paint = Paint()
        ..color = _hourColors[colorIndex]
        ..style = PaintingStyle.fill;

      final path = Path();

      // Draw as arc sector
      final rect = Rect.fromCircle(center: center, radius: innerRadius + barHeight);
      final innerRect = Rect.fromCircle(center: center, radius: innerRadius);

      path.arcTo(rect, startAngle + 0.02, sweepAngle - 0.04, false);
      path.arcTo(innerRect, startAngle + sweepAngle - 0.02, -(sweepAngle - 0.04), false);
      path.close();

      canvas.drawPath(path, paint);
    }

    // Hour labels
    final labelPaint = TextPainter(textDirection: TextDirection.ltr);
    for (final hour in [0, 6, 12, 18]) {
      final angle = -math.pi / 2 + hour * (math.pi * 2) / 24;
      final labelRadius = maxRadius + 18;
      final x = center.dx + labelRadius * math.cos(angle);
      final y = center.dy + labelRadius * math.sin(angle);

      labelPaint.text = TextSpan(
        text: hour == 0 ? '0' : '$hour',
        style: const TextStyle(
          color: AppColors.textMuted,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      );
      labelPaint.layout();
      labelPaint.paint(
        canvas,
        Offset(x - labelPaint.width / 2, y - labelPaint.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(_ClockPainter old) =>
      old.progress != progress || old.hourCounts != hourCounts;
}

class _LoadingClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 260,
      child: Center(
        child: Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceElevated,
          ),
        )
            .animate(onPlay: (c) => c.repeat())
            .shimmer(duration: 1200.ms, color: Colors.white.withValues(alpha: 0.05)),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend(this.label, this.time, this.color);
  final String label;
  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          time,
          style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
        ),
      ],
    );
  }
}
