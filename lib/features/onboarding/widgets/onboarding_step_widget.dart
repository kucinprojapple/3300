import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../widgets/onboarding_step_circle_widget.dart';

class OnboardingStepWidget extends StatelessWidget {
  final int stepIndex;
  final Widget mainContent;
  final String title;
  final String description;
  final VoidCallback onNext;

  const OnboardingStepWidget({
    super.key,
    required this.stepIndex,
    required this.mainContent,
    required this.title,
    required this.description,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
        ),
        Positioned(
          left: 32.w,
          top: 140.h,
          right: 32.w,
          child: Center(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomGradientContainerWidget(
                      width: 280.w,
                      height: 278.h,
                      backgroundGradient:
                          AppColors.gradientColors.containerGradientDarkGreen,
                      borderGradient:
                          AppColors.gradientColors.borderGradientDarkGreen,
                      borderWidth: 2.w,
                      borderRadius: 30.r,
                      child: mainContent,
                    ),

                    Positioned(
                      top: -15,
                      left: -15,
                      child: OnboardingStepCircleWidget(stepIndex: stepIndex),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                MainTextBody.gradientText(
                  context,
                  title,
                  alignment: Alignment.center,
                  height: 1.1,
                  fontSize: 25.sp,
                ),
                SizedBox(height: 24.h),
                MainTextBody.gradientText(
                  context,
                  description,
                  alignment: Alignment.center,
                  height: 1.5,
                  fontSize: 17.sp,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0.w,
          right: 0.w,
          bottom: 100.h,
          child: Center(
            child: ActionButtonWidget(
              width: 224.w,
              height: 88.h,
              text: AppTexts.buttonNext,
              fontSize: 35.sp,
              onPressed: onNext,
            ),
          ),
        ),
      ],
    );
  }
}
