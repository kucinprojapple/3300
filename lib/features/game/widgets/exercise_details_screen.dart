import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:green_gym_club/features/game/widgets/custom_gradient_container_widget.dart';
import '../../../app_core._design/assets.dart';
import '../../../app_core._design/styles.dart';
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
            child: Container(
              width: 335.w,
              height: 270.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
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
                  width: 4,
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 4.h),
                  NumbersTextBody.gradientNumbers(
                    context,
                    exercise.name,
                    size: TextSize.l,
                    alignment: Alignment.bottomCenter,
                    useShadow: false,
                    height: 1.1,
                  ),

                  SizedBox(height: 12.h),
                  Image.asset(exercise.image, height: 152.h),
                  SizedBox(height: 12.h),
                  NumbersTextBody.gradientNumbers(
                    context,
                    'Target: ${exercise.target}',
                    size: TextSize.s,
                    alignment: Alignment.bottomCenter,
                    useShadow: false,
                    height: 1.1,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 8.w,
            bottom: 192.h,
            right: 8.w,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10.h),
                    CustomGradientContainerWidget(
                      width: 340,
                      height: 86,
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
                      child: NumbersTextBody.gradientNumbers(
                        context,
                        'Technique: ${exercise.technique}',
                        size: TextSize.xs,
                        alignment: Alignment.center,
                        useGradient: false,
                        useShadow: false,
                        height: 1.0,
                      ),
                    ),

                    SizedBox(height: 10.h),
                    CustomGradientContainerWidget(
                      width: 340,
                      height: 60,
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
                      child: NumbersTextBody.gradientNumbers(
                        context,
                        'Tip: ${exercise.tip}',
                        size: TextSize.xs,
                        alignment: Alignment.center,
                        useGradient: false,
                        useShadow: false,
                        height: 1.0,
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
