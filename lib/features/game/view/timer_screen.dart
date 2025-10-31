import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';

import '../widgets/custom_gradient_circular_timer.dart';

class TimerScreen extends StatelessWidget {
  final int secondsLeft;
  final int totalSeconds;
  final VoidCallback? onStart;
  final VoidCallback? onPause;

  const TimerScreen({
    super.key,
    required this.secondsLeft,
    required this.totalSeconds,
    this.onStart,
    this.onPause,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 200.h),
                SizedBox(
                  width: 260.w,
                  height: 260.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomGradientCircularTimer(
                        progress: 1 - (secondsLeft / totalSeconds),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),

                MainTextBody.gradientText(
                  context,
                  '$minutes:$seconds',
                  size: TextSize.m,
                  alignment: Alignment.center,
                  useGradient: false,
                  useShadow: false,
                  height: 1.0,
                  fontSize: 35.sp,
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 82,

                      onPressed: onStart,
                      icon: Image.asset(AppAssets.iconTimerPlay),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      iconSize: 82,

                      onPressed: onPause,
                      icon: Image.asset(AppAssets.iconTimerStop),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
