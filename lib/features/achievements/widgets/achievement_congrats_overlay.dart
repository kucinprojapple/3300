import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../achievements_overlay_bloc/achievements_overlay_bloc.dart';
import '../model/achievement_model.dart';
import 'achievements_general_overlay_widget.dart';

class AchievementCongratsOverlay extends StatelessWidget {
  final Achievement achievement;

  const AchievementCongratsOverlay({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return AchievementsGeneralOverlayWidget(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.read<AchievementsOverlayBloc>().add(
            const HideAchievementsOverlayEvent(),
          );
        },

        child: GestureDetector(
          onTap: () {},
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 200.h),
              child: CustomGradientContainerWidget(
                width: 332.w,
                // height: 384.h,
                backgroundGradient:
                    AppColors.gradientColors.containerGradientDarkGreen,
                borderGradient:
                    AppColors.gradientColors.borderGradientDarkGreen,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: MainTextBody.gradientText(
                        context,
                        AppTexts.congratsTitle,
                        alignment: Alignment.center,
                        height: 1.2,
                        fontSize: 40.sp,
                      ),
                    ),
                    Image.asset(
                      AppAssets.achievementCupGold,
                      width: 180.w,
                      height: 180.w,
                    ),
                    SizedBox(height: 20.h),
                    MainTextBody.gradientText(
                      context,
                      AppTexts.congratsReceivedTitle,
                      fontSize: 20.sp,
                      alignment: Alignment.center,
                      height: 1.1,
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: MainTextBody.gradientText(
                        context,
                        achievement.title,
                        fontSize: 28.sp,
                        alignment: Alignment.center,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
