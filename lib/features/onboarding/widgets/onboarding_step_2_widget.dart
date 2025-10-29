import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/styles.dart';

class OnboardingStep2Widget extends StatelessWidget {
  const OnboardingStep2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: _GreenTimerCircle(secondsLeft: 5, totalSeconds: 30));
  }
}

class _GreenTimerCircle extends StatelessWidget {
  final int secondsLeft;
  final int totalSeconds;

  const _GreenTimerCircle({
    required this.secondsLeft,
    required this.totalSeconds,
  });

  @override
  Widget build(BuildContext context) {
    final double progress =
        totalSeconds > 0 ? (totalSeconds - secondsLeft) / totalSeconds : 0.0;
    final timeString = '00:${secondsLeft.toString().padLeft(2, '0')}';

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 40.h,
          child: SizedBox(
            width: 172.w,
            height: 172.w,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 9.w,
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF389A07)),
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          child: NumbersTextBody.gradientNumbers(
            context,
            timeString,
            size: TextSize.m,
            alignment: Alignment.center,
            useGradient: false,
            useShadow: false,
            height: 1.0,
            fontSize: 24.sp,
          ),
        ),
      ],
    );
  }
}
