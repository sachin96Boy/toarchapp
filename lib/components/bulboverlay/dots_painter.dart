import 'dart:math';

import 'package:flutter/material.dart';

class DotsPainter extends CustomPainter {
  final double animationValue;
  final int dotCount;
  final Color color;

  DotsPainter({
    required this.animationValue,
    required this.dotCount,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    final Paint paint =
        Paint()
          ..color = color.withOpacity(0.5 * animationValue)
          ..style = PaintingStyle.fill;

    for (int i = 0; i < dotCount; i++) {
      final angle = (2 * pi / dotCount) * i;
      final dx = center.dx + radius * cos(angle);
      final dy = center.dy + radius * sin(angle);
      canvas.drawCircle(Offset(dx, dy), 3 * animationValue, paint);
    }
  }

  @override
  bool shouldRepaint(covariant DotsPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
