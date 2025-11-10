import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';

class OnboardingStep1Widget extends StatelessWidget {
  const OnboardingStep1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Image.asset(
            AppAssets.exerciseSquats,
            height: 172.h,
            fit: BoxFit.contain,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: MainTextBody.gradientText(
            context,
            AppTexts.onboardingStep1YouGotTheExerciseSquats,
            fontSize: 25.sp,
            alignment: Alignment.bottomCenter,
            useShadow: false,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
