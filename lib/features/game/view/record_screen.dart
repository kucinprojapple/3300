import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:green_gym_club/features/game/widgets/custom_gradient_container_widget.dart';
import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../settings/widgets/custom_snack_bar_widget.dart';
import '../../exercises/data/exercise_list.dart';
import '../../exercises/model/exercise_entity.dart';

@RoutePage()
class RecordScreen extends StatelessWidget {
  final int index;
  final int lastResult;
  final void Function(int) onSave;

  const RecordScreen({super.key, required this.index, required this.lastResult, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final ExerciseEntity exercise =
        exercisesData[index.clamp(0, exercisesData.length - 1)];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),
          Positioned(
            top: 48.h,
            left: 30.w,
            child: IconButtonWidget(
              iconAsset: AppAssets.iconBack,
              onPressed: () {
                context.router.maybePop();
              },
            ),
          ),

          Positioned(
            left: 20.w,
            top: 200.h,
            right: 20.w,
            child: Column(
              children: [
                Container(
                  width: 332.w,
                  height: 248.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1D5401), Color(0xFF020500)],
                    ),
                    border: GradientBoxBorder(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
                      ),
                      width: 2.w,
                    ),
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 4.h),
                      NumbersTextBody.gradientNumbers(
                        context,
                        exercise.name,
                        size: TextSize.l,
                        alignment: Alignment.bottomCenter,
                        useShadow: false,
                        height: 1.1,
                      ),

                      SizedBox(height: 12.h),
                      Image.asset(exercise.image, height: 152.h),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                CustomGradientContainerWidget(
                  width: 332.w,
                  height: 60.h,
                  backgroundGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1D5401), Color(0xFF020500)],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
                  ),
                  borderWidth: 2.w,
                  borderRadius: 20.r,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumbersTextBody.gradientNumbers(
                          context,
                          'Time:',
                          size: TextSize.m,
                          alignment: Alignment.centerLeft,
                          // useGradient: false,
                          useShadow: false,
                          height: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomGradientContainerWidget(
                  width: 332.w,
                  height: 60.h,
                  backgroundGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1D5401), Color(0xFF020500)],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
                  ),
                  borderWidth: 2.w,
                  borderRadius: 20.r,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumbersTextBody.gradientNumbers(
                          context,
                          'Reps:',
                          size: TextSize.m,
                          alignment: Alignment.centerLeft,
                          // useGradient: false,
                          useShadow: false,
                          height: 1.0,

                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            AppAssets.iconEdit,
                            width: 44.w,
                            height: 44.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0.w,
            bottom: 100.h,
            right: 0.w,
            child: Center(
              child: ActionButtonWidget(
                width: 227.w,
                height: 89.h,
                text: 'Save',
                fontSize: 30.sp,
                onPressed: () {
                  CustomSnackBar.show(context, 'Record saved');
                  onSave(10);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
