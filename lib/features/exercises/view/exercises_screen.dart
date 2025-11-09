import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/router/router.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../data/exercise_list.dart';
import '../model/exercise_entity.dart';

@RoutePage()
class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ExerciseEntity> exercises = exercisesData;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),
          Positioned(
            left: 30.w,
            top: 48.h,
            child: CustomIconButtonWidget(
              iconAsset: AppAssets.iconBack,
              onPressed: () {
                context.router.maybePop();
              },
            ),
          ),

          Positioned(
            left: 0.w,
            top: 120.h,
            right: 0.w,
            child: MainTextBody.gradientText(
              context,
              AppTexts.exercises,
              fontSize: 25.sp,
              alignment: Alignment.center,
              useShadow: false,
              height: 1.1,
            ),
          ),

          Positioned.fill(
            top: 200.h,
            bottom: 40.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];

                return GestureDetector(
                  onTap: () {
                    context.pushRoute(ExerciseDetailsRoute(index: index));
                  },
                  child: CustomGradientContainerWidget(
                    width: 332.w,
                    height: 80.h,
                    backgroundGradient:
                        AppColors.gradientColors.containerGradientBrightGreen,
                    borderGradient:
                        AppColors.gradientColors.borderGradientBrightGreen,
                    borderRadius: 12.r,
                    borderWidth: 2.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 0.w,
                      vertical: 4.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: MainTextBody.gradientText(
                            context,
                            exercise.name,
                            alignment: Alignment.centerLeft,
                            height: 1.1,
                            fontSize: 18.sp,
                          ),
                        ),

                        if (exercise.image.isNotEmpty)
                          CustomGradientContainerWidget(
                            width: 64.w,
                            height: 64.h,
                            backgroundGradient:
                                AppColors
                                    .gradientColors
                                    .containerGradientDarkGreen,
                            borderGradient:
                                AppColors
                                    .gradientColors
                                    .borderGradientDarkGreen,
                            borderWidth: 1.w,
                            borderRadius: 12.r,
                            padding: EdgeInsets.all(4.w),
                            child: Image.asset(
                              exercise.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
