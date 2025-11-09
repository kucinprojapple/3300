import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_core_design/assets.dart';
import '../../app_core_design/colors.dart';
import '../../app_core_design/text_styles.dart';
import 'custom_gradient_container_widget.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,

        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        padding: EdgeInsets.zero,
        duration: const Duration(seconds: 1),
        content: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(scale: 0.90 + (0.1 * value), child: child),
            );
          },

          child: CustomGradientContainerWidget(
            width: 300.w,
            height: 40.h,
            backgroundGradient:
                AppColors.gradientColors.containerGradientBrightGreen,
            borderGradient: AppColors.gradientColors.borderGradientBrightGreen,
            borderRadius: 12.r,
            borderWidth: 1.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.achievementDone,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 12.w),
                  Flexible(
                    child: MainTextBody.gradientText(
                      context,
                      message,
                      alignment: Alignment.center,
                      useShadow: false,
                      height: 1.2,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
