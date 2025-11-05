import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../data/exercise_list.dart';
import '../model/exercise_entity.dart';

@RoutePage()
class ExerciseDetailsScreen extends StatelessWidget {
  final int index;

  const ExerciseDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final ExerciseEntity exercise =
        exercisesData[index.clamp(0, exercisesData.length - 1)];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),
          Positioned(
            top: 48.h,
            left: 30.w,
            child: IconButtonWidget(
              iconAsset: AppAssets.iconBack,
              onPressed: () {
                context.router.maybePop();
              },
            ),
          ),

          Positioned(
            left: 20.w,
            top: 194.h,
            right: 20.w,
            child: CustomGradientContainerWidget(
              width: 332.w,
              height: 270.h,
              backgroundGradient:
                  AppColors.gradientColors.containerGradientDarkGreen,
              borderGradient: AppColors.gradientColors.borderGradientDarkGreen,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 4.h),
                  MainTextBody.gradientText(
                    context,
                    exercise.name,
                    size: TextSize.l,
                    alignment: Alignment.bottomCenter,
                    useShadow: false,
                    height: 1.1,
                  ),

                  SizedBox(height: 12.h),
                  Image.asset(exercise.image, height: 160.h),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: MainTextBody.gradientText(
                      context,
                      '${AppTexts.exerciseDetailsTarget} ${exercise.target}',
                      alignment: Alignment.bottomCenter,
                      useShadow: false,
                      height: 1.1,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 8.w,
            top: 472.h,
            right: 8.w,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    SizedBox(height: 18.h),
                    CustomGradientContainerWidget(
                      width: 332.w,
                      height: 88.h,
                      backgroundGradient:
                          AppColors.gradientColors.containerGradientDarkGreen,
                      borderGradient:
                          AppColors.gradientColors.borderGradientDarkGreen,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: MainTextBody.gradientText(
                          context,
                          '${AppTexts.exerciseDetailsTarget} ${exercise.technique}',
                          alignment: Alignment.center,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),
                    CustomGradientContainerWidget(
                      width: 332.w,
                      height: 60.h,
                      backgroundGradient:
                          AppColors.gradientColors.containerGradientDarkGreen,
                      borderGradient:
                          AppColors.gradientColors.borderGradientDarkGreen,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: MainTextBody.gradientText(
                          context,
                          '${AppTexts.exerciseDetailsTarget} ${exercise.tip}',
                          alignment: Alignment.center,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
