import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../exercises/data/exercise_list.dart';
import '../../exercises/model/exercise_entity.dart';

class OnboardingStep6Widget extends StatelessWidget {
  const OnboardingStep6Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final ExerciseEntity exercise = exercisesData.firstWhere(
      (ex) => ex.name == AppTexts.lunges,
    );
    return Column(
      children: [
        SizedBox(height: 18.h),
        CustomGradientContainerWidget(
          width: 188.w,
          height: 148.h,
          backgroundGradient:
              AppColors.gradientColors.containerGradientDarkGreen,
          borderGradient: AppColors.gradientColors.borderGradientDarkGreen,
          borderRadius: 10.r,
          borderWidth: 1.w,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 4.h),
              MainTextBody.gradientText(
                context,
                exercise.name,
                fontSize: 15.sp,
                alignment: Alignment.bottomCenter,
                useShadow: false,
                height: 1.1,
              ),

              SizedBox(height: 8.h),
              Image.asset(exercise.image, height: 88.h),
              SizedBox(height: 8.h),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: MainTextBody.gradientText(
                  context,
                  '${AppTexts.exerciseDetailsTarget} ${exercise.target}',
                  alignment: Alignment.bottomCenter,
                  useShadow: false,
                  height: 1.1,
                  fontSize: 8.sp,
                ),
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              CustomGradientContainerWidget(
                width: 188.w,
                height: 48.h,
                backgroundGradient:
                    AppColors.gradientColors.containerGradientDarkGreen,
                borderGradient:
                    AppColors.gradientColors.borderGradientDarkGreen,
                borderRadius: 10.r,
                borderWidth: 1.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: MainTextBody.gradientText(
                    context,
                    '${AppTexts.exerciseDetailsTechnique} ${exercise.technique}',
                    alignment: Alignment.center,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                    fontSize: 8.sp,
                  ),
                ),
              ),

              SizedBox(height: 8.h),
              CustomGradientContainerWidget(
                width: 188.w,
                height: 32.h,
                backgroundGradient:
                    AppColors.gradientColors.containerGradientDarkGreen,
                borderGradient:
                    AppColors.gradientColors.borderGradientDarkGreen,
                borderRadius: 10.r,
                borderWidth: 1.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: MainTextBody.gradientText(
                    context,
                    '${AppTexts.exerciseDetailsTip} ${exercise.tip}',
                    alignment: Alignment.center,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                    fontSize: 8.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
