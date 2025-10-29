import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import '../../../app_core_design/styles.dart';
import '../../game/widgets/custom_gradient_container_widget.dart';
import '../model/achievement_model.dart';

class AchievementItem extends StatelessWidget {
  final Achievement achievement;

  const AchievementItem({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerWidget(
      width: 332.w,
      height: 82.h,
      borderRadius: 12.r,
      borderWidth: 2.w,
      backgroundGradient: LinearGradient(
        colors: [Color(0xFF389A07), Color(0xFF020500)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderGradient: LinearGradient(
        colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NumbersTextBody.gradientNumbers(
                    context,
                    achievement.title,
                    alignment: Alignment.centerLeft,
                    height: 1.1,
                    fontSize: 18.sp,
                  ),

                  SizedBox(height: 4.h),
                  NumbersTextBody.gradientNumbers(
                    context,
                    achievement.description,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.left,
                    height: 1.1,
                    fontSize: 9.sp,
                    useGradient: false,
                  ),

                  SizedBox(height: 8.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: LinearProgressIndicator(
                      value: achievement.progress,
                      minHeight: 12.h,
                      backgroundColor: Colors.white,
                      color: Color(0xFF389A07),
                    ),
                  ),
                ],
              ),
            ),
          ),

          CustomGradientContainerWidget(
            width: 68.w,
            height: 68.w,
            borderRadius: 12.r,
            borderWidth: 2.w,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF0E2801), Color(0xFF020500)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderGradient: LinearGradient(
              colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            padding: EdgeInsets.all(8.w),
            child: Image.asset(
              AppAssets.achievementCupGold,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
