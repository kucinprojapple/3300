import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../app_core_design/styles.dart';


class TimerOptionCircleWidget extends StatelessWidget {
  final int seconds;
  final bool isSelected;
  final VoidCallback onTap;

  const TimerOptionCircleWidget({
    super.key,
    required this.seconds,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        width: 38.w,
        height: 38.h,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1AC000),
              Color(0xFF116803),
            ],
          )
              : LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF073001),
              Color(0xFF116803),
            ],
          ),
          borderRadius: BorderRadius.circular(19.r),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF9C9A98),
                Color(0xFF7C7B78),
              ],
            ),
            width: 1.w,
          ),
        ),
        child: Center(
          child: NumbersTextBody.gradientNumbers(
            context,
            '${seconds}s',
            size: TextSize.m,
            alignment: Alignment.center,
            height: 1.0,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
