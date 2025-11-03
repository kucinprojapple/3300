import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/styles.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../profile_data_cubit/profile_data_state.dart';

class ProfileFavoriteExerciseCardWidget extends StatelessWidget {
  final ProfileDataState state;

  const ProfileFavoriteExerciseCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerWidget(
      width: 354.w,
      height: 54.h,
      backgroundGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF389A07), Color(0xFF020500)],
      ),
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
      ),
      borderWidth: 1.5,
      borderRadius: 12.r,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainTextBody.gradientText(
              context,
              'FAVORITE EXERCISE',
              size: TextSize.xs,
              alignment: Alignment.centerLeft,
              useGradient: false,
              useShadow: false,
              height: 1.0,
            ),
            MainTextBody.gradientText(
              context,
              state.favoriteExercise,
              alignment: Alignment.centerLeft,
              useGradient: false,
              useShadow: false,
              height: 1.0,
              fontSize: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
