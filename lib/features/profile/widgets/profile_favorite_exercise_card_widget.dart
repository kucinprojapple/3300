import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../profile_data_cubit/profile_data_state.dart';

class ProfileFavoriteExerciseCardWidget extends StatelessWidget {
  final ProfileDataState state;

  const ProfileFavoriteExerciseCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerWidget(
      width: double.infinity,
      height: 52.h,
      backgroundGradient: AppColors.gradientColors.containerGradientBrightGreen,
      borderGradient: AppColors.gradientColors.borderGradientBrightGreen,
      borderWidth: 2.w,
      borderRadius: 12.r,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: MainTextBody.gradientText(
                context,
                AppTexts.favoriteExercise,
                fontSize: 15.sp,
                alignment: Alignment.centerLeft,
                useGradient: false,
                useShadow: false,
                height: 1.0,
              ),
            ),

            Expanded(
              child: MainTextBody.gradientText(
                context,
                state.favoriteExercise,
                fontSize: 20.sp,
                alignment: Alignment.centerRight,
                useGradient: false,
                useShadow: false,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
