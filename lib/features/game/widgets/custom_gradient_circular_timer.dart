import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientCircularTimer extends StatefulWidget {
  final double progress;
  final bool isRunning;

  const CustomGradientCircularTimer({
    super.key,
    required this.progress,
    this.isRunning = true,
  });

  @override
  State<CustomGradientCircularTimer> createState() =>
      _CustomGradientCircularTimerState();
}

class _CustomGradientCircularTimerState
    extends State<CustomGradientCircularTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(CustomGradientCircularTimer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.progress != _oldProgress) {
      _controller.stop();
      _controller.reset();
      _animation = Tween<double>(
        begin: _oldProgress,
        end: widget.progress,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
      _controller.forward();
      _oldProgress = widget.progress;
    }

    if (!widget.isRunning) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return SizedBox(
          width: 260.w,
          height: 260.h,
          child: CustomPaint(painter: _GradientCirclePainter(_animation.value)),
        );
      },
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double progress;

  _GradientCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2 - 22).r;

    final borderPaint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 22.r
          ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, borderPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweepAngle = 2 * math.pi * progress;

    final gradient = SweepGradient(
      startAngle: -math.pi / 2,
      endAngle: 1.5 * math.pi,
      colors: [const Color(0xFF4BCB0B), const Color(0xFF2F8703)],
      transform: GradientRotation(-math.pi / 2),
    );

    final progressPaint =
        Paint()
          ..shader = gradient.createShader(rect)
          ..strokeWidth = 22.r
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -math.pi / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
