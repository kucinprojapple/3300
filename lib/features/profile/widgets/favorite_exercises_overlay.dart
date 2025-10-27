import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/styles.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../game/widgets/custom_gradient_container_widget.dart';
import '../../settings/widgets/custom_snack_bar_widget.dart';
import '../profile_bloc/profile_bloc.dart';

class FavoriteExercisesOverlay extends StatelessWidget {
  const FavoriteExercisesOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 400.h,
        decoration: const BoxDecoration(color: Color(0xFF000000)),
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
                        child: NumbersTextBody.gradientNumbers(
                          context,
                          'NUMBER OF \nEXERCISES \nPERFORMED',
                          size: TextSize.xs,
                          alignment: Alignment.topCenter,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 12.sp,
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
                        child: NumbersTextBody.gradientNumbers(
                          context,
                          'AMOUNT OF \nTIMER FOR \nEXERCISE',
                          size: TextSize.xs,
                          alignment: Alignment.topCenter,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 12.sp,
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
                      borderRadius: 12.r,
                      borderWidth: 1.5,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: NumbersTextBody.gradientNumbers(
                          context,
                          'NUMBER OF \nREPETITION',
                          size: TextSize.xs,
                          alignment: Alignment.topCenter,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            ActionButtonWidget(
              width: 227.w,
              height: 89.h,
              text: 'Save',
              fontSize: 30.sp,
              onPressed: () {
                CustomSnackBar.show(context, 'Achievements saved');
                final bloc = context.read<ProfileOverlayBloc>();
                Future.delayed(const Duration(seconds: 3), () {
                  if (context.mounted) {
                    bloc.add(HideOverlayEvent());
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
