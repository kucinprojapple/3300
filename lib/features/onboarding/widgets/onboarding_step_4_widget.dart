import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

class OnboardingStep4Widget extends StatelessWidget {
  const OnboardingStep4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = 88;
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          SizedBox(
            width: size.w,
            height: size.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppAssets.achievementMedal_1,
                  width: size.w,
                  height: size.h,
                ),

                ClipOval(
                  child: Image.asset(
                    AppAssets.avatarWoman,
                    fit: BoxFit.cover,
                    width: (size * 0.80).w,
                    height: (size * 0.80).h,
                  ),
                ),

                Positioned(
                  bottom: 0.h,
                  child: Image.asset(
                    AppAssets.iconAdd,
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8.h),
          Container(
            width: 120.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: Color(0xFF031400),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: const Color(0xFF73706D), width: 1.w),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('')),
                Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Image.asset(
                    AppAssets.iconEdit,
                    width: 22.w,
                    height: 22.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          CustomGradientContainerWidget(
            width: 204.w,
            height: 28.h,
            backgroundGradient:
                AppColors.gradientColors.containerGradientBrightGreen,
            borderGradient: AppColors.gradientColors.borderGradientBrightGreen,
            borderWidth: 1.w,
            borderRadius: 12.r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainTextBody.gradientText(
                    context,
                    AppTexts.title,
                    alignment: Alignment.centerLeft,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                    fontSize: 14.sp,
                  ),
                  MainTextBody.gradientText(
                    context,
                    AppTexts.titlePushUpKing,
                    fontSize: 11.sp,
                    alignment: Alignment.centerLeft,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                  ),
                  Image.asset(AppAssets.iconEdit, width: 22.w, height: 22.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomGradientContainerWidget(
                    width: 60.w,
                    height: 80.h,
                    backgroundGradient:
                        AppColors.gradientColors.containerGradientBrightGreen,
                    borderGradient:
                        AppColors.gradientColors.borderGradientBrightGreen,
                    borderWidth: 1.w,
                    borderRadius: 12.r,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTextBody.gradientText(
                            context,
                            AppTexts.numberOfExercisesPerformed,
                            fontSize: 6.sp,
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.1,
                          ),
                          Spacer(),
                          MainTextBody.gradientText(
                            context,
                            '25',
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: CustomGradientContainerWidget(
                    width: 68.w,
                    height: 80.h,
                    backgroundGradient:
                        AppColors.gradientColors.containerGradientBrightGreen,
                    borderGradient:
                        AppColors.gradientColors.borderGradientBrightGreen,
                    borderWidth: 1.w,
                    borderRadius: 12.r,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTextBody.gradientText(
                            context,
                            AppTexts.amountOfTimeForExercise,
                            fontSize: 6.sp,
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.1,
                          ),
                          Spacer(),
                          MainTextBody.gradientText(
                            context,
                            '0:30',
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: CustomGradientContainerWidget(
                    width: 68.w,
                    height: 80.h,
                    backgroundGradient:
                        AppColors.gradientColors.containerGradientBrightGreen,
                    borderGradient:
                        AppColors.gradientColors.borderGradientBrightGreen,
                    borderRadius: 12.r,
                    borderWidth: 1.w,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTextBody.gradientText(
                            context,
                            AppTexts.numberOfRepetitions,
                            fontSize: 6.sp,
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.1,
                          ),
                          Spacer(),
                          MainTextBody.gradientText(
                            context,
                            '300',
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
