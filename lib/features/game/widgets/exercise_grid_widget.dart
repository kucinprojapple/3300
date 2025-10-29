import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../exercises/data/exercise_list.dart';

class ExerciseGridWidget extends StatelessWidget {
  final ValueChanged<int> onExerciseSelected;

  ExerciseGridWidget({super.key, required this.onExerciseSelected});

  final List<String> exerciseImages = [
    AppAssets.exerciseSquats,
    AppAssets.exerciseLunges,
    AppAssets.exercisePushUps,
    AppAssets.exerciseTricepDips,
    AppAssets.exerciseBurpees,
    AppAssets.exerciseCrunches,
    AppAssets.exerciseJumpingJacks,
    AppAssets.exerciseLegRaises,
    AppAssets.exerciseBicycleCrunches,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 32.w,
          mainAxisSpacing: 4.h,
          childAspectRatio: 0.88,
        ),
        itemCount: exercisesData.length,
        itemBuilder: (context, index) {
          final exercise = exercisesData[index];
          return GestureDetector(
            onTap: () => onExerciseSelected(index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(exerciseImages[index], fit: BoxFit.contain),
              ),
            ),
          );
        },
      ),
    );
  }
}
