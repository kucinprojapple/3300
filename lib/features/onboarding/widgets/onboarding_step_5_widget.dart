import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../achievements/model/achievement_model.dart';


class OnboardingStep5Widget extends StatelessWidget {
  const OnboardingStep5Widget({super.key});

  @override
  Widget build(BuildContext context) {
    const double kScale = 0.55;

    return Column(
      children: [
        SizedBox(height: 20.h * kScale),
        ...List.generate(
          achievementsForOnboarding.length,
              (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h * kScale),
            child: _AchievementCard(
              achievement: achievementsForOnboarding[index],
              scale: kScale,
            ),
          ),
        ),
      ],
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final Achievement achievement;
  final double scale;

  const _AchievementCard({
    required this.achievement,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerWidget(
      width: 332.w * scale,
      height: 82.h * scale,
      borderRadius: 12.r * scale,
      borderWidth: 2.w * scale,
      backgroundGradient: const LinearGradient(
        colors: [Color(0xFF389A07), Color(0xFF020500)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderGradient: const LinearGradient(
        colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8.w * scale,
        vertical: 6.h * scale,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(right: 12.w * scale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainTextBody.gradientText(
                    context,
                    achievement.title,
                    alignment: Alignment.centerLeft,
                    height: 1.1,
                    fontSize: 16.sp * scale,
                  ),
                  SizedBox(height: 4.h * scale),
                  MainTextBody.gradientText(
                    context,
                    achievement.description,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.left,
                    height: 1.1,
                    fontSize: 9.sp * scale,
                    useGradient: false,
                  ),
                  SizedBox(height: 8.h * scale),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r * scale),
                    child: LinearProgressIndicator(
                      value: achievement.progress,
                      minHeight: 10.h * scale,
                      backgroundColor: Colors.white,
                      color: const Color(0xFF389A07),
                    ),
                  ),
                ],
              ),
            ),
          ),


          CustomGradientContainerWidget(
            width: 56.w * scale,
            height: 56.w * scale,
            borderRadius: 12.r * scale,
            borderWidth: 2.w * scale,
            backgroundGradient: const LinearGradient(
              colors: [Color(0xFF0E2801), Color(0xFF020500)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderGradient: const LinearGradient(
              colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            padding: EdgeInsets.all(8.w * scale),
            child: Image.asset(
              achievement.iconPath ?? AppAssets.achievementMedal_1,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

final List<Achievement> achievementsForOnboarding = [
  Achievement(
    title: AppTexts.achievementFirstStepTitle,
    description: AppTexts.achievementFirstStepDesc,
    progress: 1.0,
    iconPath: AppAssets.achievementCupGold,
  ),
  Achievement(
    title: AppTexts.achievementTenReps,
    description: AppTexts.achievementTenRepsDesc,
    progress: 0.8,
    iconPath: AppAssets.achievementMedal_1,
  ),
  Achievement(
    title: AppTexts.achievementBeginner,
    description: AppTexts.achievementBeginnerDesc,
    progress: 0.67,
    iconPath: AppAssets.achievementMedal_2,
  ),
  Achievement(
    title: AppTexts.achievementFiveMinutes,
    description: AppTexts.achievementFiveMinutesDesc,
    progress: 0.4,
    iconPath: AppAssets.achievementMedal_3,
  ),
  Achievement(
    title: AppTexts.achievementLoyalUser,
    description: AppTexts.achievementLoyalUserDesc,
    progress: 0.33,
    iconPath: AppAssets.achievementMedal_4,
  ),
];