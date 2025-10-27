import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import '../../../app_core_design/styles.dart';
import '../../../core/widgets/action_button_widget.dart';

import '../widgets/onboarding_step_circle_widget.dart';

class OnboardingStepFiveWidget extends StatelessWidget {
  final int stepIndex;
  final VoidCallback onNext;

  const OnboardingStepFiveWidget({
    super.key,
    required this.onNext,
    required this.stepIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),

          Positioned(
            left: 55.w,
            top: 139.h,
            right: 55.w,
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
                          child: Stack(
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

                                child: NumbersTextBody.gradientNumbers(
                                  context,
                                  'You got the\nexercise Squats',
                                  size: TextSize.m,
                                  alignment: Alignment.bottomCenter,
                                  useShadow: false,
                                  height: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: -15,
                        left: -15,
                        child: OnboardingStepCircleWidget(stepIndex: stepIndex),
                      ),
                    ],
                  ),

                  SizedBox(height: 22.h),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: NumbersTextBody.gradientNumbers(
                      context,
                      'Workout Begins',
                      size: TextSize.l,
                      alignment: Alignment.center,
                      height: 1.1,
                    ),
                  ),

                  SizedBox(height: 31.h),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: NumbersTextBody.gradientNumbers(
                      context,
                      'Unlock your random\nworkout!',
                      size: TextSize.s,
                      alignment: Alignment.center,
                      height: 1.5,
                    ),
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
      ),
    );
  }
}
