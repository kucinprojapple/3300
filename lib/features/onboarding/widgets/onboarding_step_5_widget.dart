import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../achievements/model/achievement_model.dart';
import '../../achievements/widgets/achievement_item_widget.dart';

class OnboardingStep5Widget extends StatelessWidget {
  const OnboardingStep5Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        ...List.generate(
          5,
          (index) => AchievementItem(
            achievement: achievementsForOnboarding[index],
            scale: 0.55,
          ),
        ),
      ],
    );
  }
}

final List<Achievement> achievementsForOnboarding = [
  Achievement(
    title: "First step",
    description: "Performed 1 exercise of any type.",
    progress: 1.0,
    iconType: AchievementIconType.cup,
  ),
  Achievement(
    title: "Ten reps",
    description: "Did a total of 10 reps of any exercise.",
    progress: 1.0,
    iconType: AchievementIconType.medal,
  ),
  Achievement(
    title: "Beginner",
    description: "Completed 3 different exercises \nfrom the list.",
    progress: 1.0,
    iconType: AchievementIconType.cup,
  ),
  Achievement(
    title: "Five-minute workout",
    description: "I practiced for at least 5 minutes a day.",
    progress: 0.8,
    iconType: AchievementIconType.medal,
  ),
  Achievement(
    title: "Loyal user",
    description: "Worked out 3 days in a row.",
    progress: 1.0,
    iconType: AchievementIconType.cup,
  ),
];
