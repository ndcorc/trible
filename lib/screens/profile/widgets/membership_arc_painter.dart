import 'package:flutter/material.dart';

class MembershipArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFF7BA7B1)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round;

    final backgroundPaint =
        Paint()
          ..color = Colors.grey.shade300
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2 - 4;

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14, // Start from 180 degrees (left side)
      3.14, // Sweep 180 degrees (semicircle)
      false,
      backgroundPaint,
    );

    // Draw progress arc (approximately 70% complete for "Pillar" level)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14, // Start from 180 degrees (left side)
      3.14 * 0.7, // 70% of semicircle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
