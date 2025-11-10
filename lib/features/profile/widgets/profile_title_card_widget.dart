import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../profile_data_cubit/profile_data_state.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';

class ProfileTitleCardWidget extends StatelessWidget {
  final ProfileDataState state;

  const ProfileTitleCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerWidget(
      width: 332.w,
      height: 48.h,
      backgroundGradient: AppColors.gradientColors.containerGradientBrightGreen,
      borderGradient: AppColors.gradientColors.borderGradientBrightGreen,
      borderWidth: 2.w,
      borderRadius: 12.r,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainTextBody.gradientText(
              context,
              AppTexts.title,
              fontSize: 25.sp,
              alignment: Alignment.centerLeft,
              useShadow: false,
              height: 1.0,
            ),
            Expanded(
              child: MainTextBody.gradientText(
                context,
                state.title,
                fontSize: 18.sp,
                alignment: Alignment.center,
                useShadow: false,
                height: 1.0,
              ),
            ),
            GestureDetector(
              onTap:
                  () => context.read<ProfileOverlayBloc>().add(
                    ShowTitleSelectOverlayEvent(),
                  ),
              child: Image.asset(AppAssets.iconEdit, width: 30.w, height: 30.h),
            ),
          ],
        ),
      ),
    );
  }
}
