import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

import '../profile_bloc/profile_bloc.dart';

class FavoriteExercisesOverlay extends StatelessWidget {
  const FavoriteExercisesOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: double.infinity,
        height: 500.h,

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Expanded(
                    child: CustomGradientContainerWidget(
                      width: 114.w,
                      height: 132.h,
                      backgroundGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF389A07), Color(0xFF020500)],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
                      ),
                      borderWidth: 1.5,
                      borderRadius: 12.r,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssets.achievementMedal_1,
                              width: 72.w,
                              height: 72.h,
                            ),
                            SizedBox(height: 8.h),
                            ActionButtonWidget(
                              width: 84.w,
                              height: 32.h,
                              text: 'Selected',
                              fontSize: 12.sp,
                              onPressed: () {
                                // todo: add action
                                // CustomSnackBar.show(context, 'Achievements saved');
                                final bloc = context.read<ProfileOverlayBloc>();
                                Future.delayed(const Duration(seconds: 2), () {
                                  if (context.mounted) {
                                    bloc.add(HideOverlayEvent());
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CustomGradientContainerWidget(
                      width: 114.w,
                      height: 132.h,
                      backgroundGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF389A07), Color(0xFF020500)],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
                      ),
                      borderWidth: 1.5,
                      borderRadius: 12.r,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssets.achievementMedal_2,
                              width: 72.w,
                              height: 72.h,
                            ),
                            SizedBox(height: 8.h),
                            ActionButtonWidget(
                              width: 84.w,
                              height: 32.h,
                              text: 'Selected',
                              fontSize: 12.sp,
                              onPressed: () {
                                // todo: add action
                                // CustomSnackBar.show(context, 'Achievements saved');
                                final bloc = context.read<ProfileOverlayBloc>();
                                Future.delayed(const Duration(seconds: 2), () {
                                  if (context.mounted) {
                                    bloc.add(HideOverlayEvent());
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CustomGradientContainerWidget(
                      width: 114.w,
                      height: 132.h,
                      backgroundGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF389A07), Color(0xFF020500)],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
                      ),
                      borderWidth: 1.5,
                      borderRadius: 12.r,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssets.achievementMedal_3,
                              width: 72.w,
                              height: 72.h,
                            ),
                            SizedBox(height: 8.h),
                            ActionButtonWidget(
                              width: 84.w,
                              height: 32.h,
                              text: 'Selected',
                              fontSize: 12.sp,
                              onPressed: () {
                                // todo: add action
                                // CustomSnackBar.show(context, 'Achievements saved');
                                final bloc = context.read<ProfileOverlayBloc>();
                                Future.delayed(const Duration(seconds: 2), () {
                                  if (context.mounted) {
                                    bloc.add(HideOverlayEvent());
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
