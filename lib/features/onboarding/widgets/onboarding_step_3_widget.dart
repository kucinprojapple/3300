import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

class OnboardingStep3Widget extends StatelessWidget {
  const OnboardingStep3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 24.h),
        CustomGradientContainerWidget(
          width: 188.w,
          height: 144.h,
          borderRadius: 10.r,
          borderWidth: 2,
          backgroundGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D5401), Color(0xFF020500)],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
          ),
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              MainTextBody.gradientText(
                context,
               AppTexts.squats,
                size: TextSize.l,
                alignment: Alignment.bottomCenter,
                useShadow: false,
                height: 1.1,
              ),
              SizedBox(height: 2.h),
              Image.asset(AppAssets.exerciseSquats, height: 100.h),
            ],
          ),
        ),

        SizedBox(height: 8.h),
        // Time/Rep containers
        CustomGradientContainerWidget(
          width: 200.w,
          height: 32.h,
          borderRadius: 10.r,
          borderWidth: 2,
          backgroundGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D5401), Color(0xFF020500)],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
          ),
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              MainTextBody.gradientText(
                context,
                AppTexts.time,
                alignment: Alignment.center,
                useGradient: false,
                useShadow: false,
                height: 1.0,
                fontSize: 14.sp,
              ),

              Spacer(),
              MainTextBody.gradientText(
                context,
                '00:30',
                alignment: Alignment.center,
                useGradient: false,
                useShadow: false,
                height: 1.0,
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
        CustomGradientContainerWidget(
          width: 200.w,
          height: 32.h,
          borderRadius: 10.r,
          borderWidth: 2,
          backgroundGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D5401), Color(0xFF020500)],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
          ),
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              MainTextBody.gradientText(
                context,
                AppTexts.reps,
                alignment: Alignment.center,
                useGradient: false,
                useShadow: false,
                height: 1.0,
                fontSize: 14.sp,
              ),
              Spacer(),
              MainTextBody.gradientText(
                context,
                '10',
                alignment: Alignment.center,
                useGradient: false,
                useShadow: false,
                height: 1.0,
                fontSize: 14.sp,
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
