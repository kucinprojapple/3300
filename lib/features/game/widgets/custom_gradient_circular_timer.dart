import 'package:flutter/material.dart';

class GradientCircularTimer extends StatelessWidget {
  final double progress;

  const GradientCircularTimer({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 260,
      child: CustomPaint(painter: _GradientCirclePainter(progress)),
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double progress;

  _GradientCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 22.51;

    final borderPaint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 22.51
          ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, borderPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweepAngle = 2 * 3.14159265 * progress;
    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 3.14159265 * 2,
      colors: [Color(0xFF4BCB0B), Color(0xFF2F8703)],
    );
    final progressPaint =
        Paint()
          ..shader = gradient.createShader(rect)
          ..strokeWidth = 22.51
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, -3.14159265 / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
