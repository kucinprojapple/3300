import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import '../../../app_core_design/styles.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../data/exercise_list.dart';
import '../model/exercise_entity.dart';
import 'game_general_overlay_widget.dart';

class WowOverlayWidget extends StatelessWidget {
  final int index;

  const WowOverlayWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final ExerciseEntity exercise =
        exercisesData[index.clamp(0, exercisesData.length - 1)];
    return GameGeneralOverlayWidget(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              left: 30.w,
              top: 48.h,
              child: IconButtonWidget(
                iconAsset: AppAssets.iconQuestion,
                onPressed: () {
                  context.router.maybePop();
                },
              ),
            ),
            Positioned(
              left: 0.w,
              top: 170.h,
              right: 0.w,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.wow),
                    SizedBox(height: 12.h),
                    Image.asset(exercise.image, fit: BoxFit.contain),
                    SizedBox(height: 14.h),
                    NumbersTextBody.gradientNumbers(
                      context,
                      'You got the exercise\n${exercise.name}',
                      size: TextSize.m,
                      alignment: Alignment.bottomCenter,
                      useShadow: false,
                      height: 1.1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
