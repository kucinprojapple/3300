import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../app_core_design/styles.dart';
import '../../exercises/data/exercise_list.dart';
import '../../exercises/model/exercise_entity.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

class OnboardingStep6Widget extends StatelessWidget {
  const OnboardingStep6Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final ExerciseEntity exercise = exercisesData.firstWhere(
      (ex) => ex.name == 'Lunges',
    );
    return Column(
      children: [
        SizedBox(height: 12.h),

        Container(
          width: 184.w,
          height: 148.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1D5401), Color(0xFF020500)],
            ),
            border: GradientBoxBorder(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
              ),
              width: 1,
            ),
          ),

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
                fontSize: 15.sp,
              ),

              SizedBox(height: 4.h),
              Image.asset(exercise.image, height: 92.h),
              SizedBox(height: 12.h),
              MainTextBody.gradientText(
                context,
                'Target: ${exercise.target}',
                alignment: Alignment.bottomCenter,
                useShadow: false,
                height: 1.1,
                fontSize: 8.sp,
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                CustomGradientContainerWidget(
                  width: 184.w,
                  height: 48.h,
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
                  borderRadius: 10.r,
                  borderWidth: 1.w,
                  child: MainTextBody.gradientText(
                    context,
                    'Technique: ${exercise.technique}',
                    alignment: Alignment.center,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                    fontSize: 8.sp,
                  ),
                ),

                SizedBox(height: 10.h),
                CustomGradientContainerWidget(
                  width: 184.w,
                  height: 32.h,
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
                  borderRadius: 10.r,
                  borderWidth: 1.w,
                  child: MainTextBody.gradientText(
                    context,
                    'Tip: ${exercise.tip}',
                    alignment: Alignment.center,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                    fontSize: 8.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
