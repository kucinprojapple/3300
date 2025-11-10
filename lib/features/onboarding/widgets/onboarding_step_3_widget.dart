import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

class OnboardingStep3Widget extends StatelessWidget {
  const OnboardingStep3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.h),
          child: CustomGradientContainerWidget(
            width: 188.w,
            height: 148.h,
            backgroundGradient:
                AppColors.gradientColors.containerGradientDarkGreen,
            borderGradient: AppColors.gradientColors.borderGradientDarkGreen,
            borderRadius: 10.r,
            borderWidth: 1.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Column(
                children: [
                  MainTextBody.gradientText(
                    context,
                    AppTexts.squats,
                    fontSize: 20.sp,
                    alignment: Alignment.bottomCenter,
                    useShadow: false,
                    height: 1.1,
                  ),
                  SizedBox(height: 2.h),
                  Image.asset(AppAssets.exerciseSquats, height: 100.h),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 8.h),
        CustomGradientContainerWidget(
          width: 188.w,
          height: 32.h,
          backgroundGradient:
              AppColors.gradientColors.containerGradientDarkGreen,
          borderGradient: AppColors.gradientColors.borderGradientDarkGreen,
          borderRadius: 10.r,
          borderWidth: 1.w,

          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Padding(
            padding: EdgeInsets.only(right: 32.w),
            child: Row(
              children: [
                MainTextBody.gradientText(
                  context,
                  AppTexts.time,
                  fontSize: 14.sp,
                  alignment: Alignment.center,

                  useShadow: false,
                  height: 1.0,
                ),

                Spacer(),
                MainTextBody.gradientText(
                  context,
                  '00:30',
                  fontSize: 14.sp,
                  alignment: Alignment.center,

                  useShadow: false,
                  height: 1.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),
        CustomGradientContainerWidget(
          width: 188.w,
          height: 32.h,
          backgroundGradient:
              AppColors.gradientColors.containerGradientDarkGreen,
          borderGradient: AppColors.gradientColors.borderGradientDarkGreen,
          borderRadius: 10.r,
          borderWidth: 1.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              MainTextBody.gradientText(
                context,
                AppTexts.reps,
                fontSize: 14.sp,
                alignment: Alignment.center,
                useShadow: false,
                height: 1.0,
              ),
              Spacer(),
              MainTextBody.gradientText(
                context,
                '10',
                alignment: Alignment.center,
                fontSize: 14.sp,
                useShadow: false,
                height: 1.0,
              ),
              SizedBox(width: 8.w),
              Center(
                child: Image.asset(
                  AppAssets.iconEdit,
                  width: 22.w,
                  height: 22.h,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
