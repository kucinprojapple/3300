import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../widgets/onboarding_step_circle_widget.dart';

class OnboardingStepWidget extends StatelessWidget {
  final int stepIndex;
  final Widget mainContent;
  final String title;
  final String description;

  const OnboardingStepWidget({
    super.key,
    required this.stepIndex,
    required this.mainContent,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.all(15.h),
              child: CustomGradientContainerWidget(
                width: 280.w,
                height: 280.h,
                backgroundGradient:
                    AppColors.gradientColors.containerGradientDarkGreen,
                borderGradient:
                    AppColors.gradientColors.borderGradientDarkGreen,
                borderWidth: 2.w,
                borderRadius: 30.r,
                child: mainContent,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
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
    );
  }
}
