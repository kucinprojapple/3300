import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/colors.dart';
import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
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
      backgroundGradient: AppColors.gradientColors.containerGradientBrightGreen,
      borderGradient: AppColors.gradientColors.borderGradientBrightGreen,
      borderWidth: 1.5,
      borderRadius: 12.r,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainTextBody.gradientText(
              context,
              AppTexts.favoriteExercise,
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
