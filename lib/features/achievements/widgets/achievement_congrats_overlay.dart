import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';

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
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: CustomGradientContainerWidget(
              width: 332.w,
              height: 384.h,
              backgroundGradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1D5401), Color(0xFF020500)],
              ),
              borderGradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 12.h,
                    ),
                    child: MainTextBody.gradientText(
                      context,
                      'Congrats!',
                      alignment: Alignment.center,
                      height: 1.2,
                      fontSize: 40.sp,
                    ),
                  ),
                  Image.asset(
                    AppAssets.achievementCupGold,
                    width: 188.w,
                    height: 188.w,
                  ),
                  SizedBox(height: 20.h),
                  MainTextBody.gradientText(
                    context,
                    'You received the title',
                    alignment: Alignment.center,
                    height: 1.1,
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 12.h),
                  MainTextBody.gradientText(
                    context,
                    achievement.title,
                    size: TextSize.m,
                    alignment: Alignment.center,
                    height: 1.1,
                    fontSize: 30.sp,
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
