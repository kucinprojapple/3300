import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';

class OnboardingStep1Widget extends StatelessWidget {
  const OnboardingStep1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.w,
          top: 12.h,
          right: 0.w,
          child: Image.asset(
            AppAssets.exerciseSquats,
            height: 196.h,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 13.h,
          child: MainTextBody.gradientText(
            context,
            AppTexts.onboardingStep1YouGotTheExerciseSquats,
            size: TextSize.m,
            alignment: Alignment.bottomCenter,
            useShadow: false,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
