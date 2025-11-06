import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../exercises/data/exercise_list.dart';
import '../../exercises/model/exercise_entity.dart';
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
                    MainTextBody.gradientText(
                      context,
                      '${AppTexts.youGotTheExercise}\n${exercise.name}',
                      fontSize: 25.sp,
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
