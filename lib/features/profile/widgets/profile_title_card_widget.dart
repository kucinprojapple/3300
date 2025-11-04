import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
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
              AppTexts.title,
              size: TextSize.m,
              alignment: Alignment.centerLeft,
              useGradient: false,
              useShadow: false,
              height: 1.0,
            ),
            Expanded(
              child: MainTextBody.gradientText(
                context,
                state.title,
                alignment: Alignment.center,
                useGradient: false,
                useShadow: false,
                height: 1.0,
                fontSize: 20.sp,
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
