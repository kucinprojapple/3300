import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/action_button_widget.dart';
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
                    Container(
                      width: 281.w,
                      height: 278.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.r),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF1D5401), Color(0xFF020500)],
                          ),
                        ),
                        child: mainContent,
                      ),
                    ),

                    Positioned(
                      top: -15,
                      left: -15,
                      child: OnboardingStepCircleWidget(stepIndex: stepIndex),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                NumbersTextBody.gradientNumbers(
                  context,
                  title,
                  alignment: Alignment.center,
                  height: 1.1,
                  fontSize: 25.sp,
                ),
                SizedBox(height: 24.h),
                NumbersTextBody.gradientNumbers(
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
          left: 0,
          bottom: 109.h,
          right: 0,
          child: Center(
            child: ActionButtonWidget(
              width: 227.w,
              height: 89.h,
              text: 'Next',
              fontSize: 35.sp,
              onPressed: onNext,
            ),
          ),
        ),
      ],
    );
  }
}
