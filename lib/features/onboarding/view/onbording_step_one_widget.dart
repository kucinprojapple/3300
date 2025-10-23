
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core._design/assets.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../onboarding_cubit/onboarding_cubit.dart';

class OnboardingStepOneWidget extends StatelessWidget {
  final VoidCallback onNext;

  const OnboardingStepOneWidget({super.key, required this.onNext});

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
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF1D5401), Color(0xFF020500)],
                        ),
                        borderRadius: BorderRadius.circular(28.r),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 32,
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            // Номер шага
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.greenAccent,
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            Image.asset(
                              AppAssets.exercisePushUps,

                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 10),

                            Text(
                              'You got the\nexercise Squats',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    'Workout Begins',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'OtomanopeeOne',
                      fontSize: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 31.h),
                  Text(
                    'Unlock your random\nworkout!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'OtomanopeeOne',
                      fontSize: 20.sp,
                      color: Colors.white,
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
                onPressed: () {
                  context.read<OnboardingCubit>().goNext();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
