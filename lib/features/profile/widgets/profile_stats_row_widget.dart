import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../profile_data_cubit/profile_data_state.dart';

class ProfileStatsRowWidget extends StatelessWidget {
  final ProfileDataState state;

  const ProfileStatsRowWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Expanded(
            child: CustomGradientContainerWidget(
              width: 114.w,
              height: 132.h,
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
              child: _buildStatItem(
                context,
                title: AppTexts.numberOfExercisesPerformed,
                value: state.totalExercises.toString(),
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: CustomGradientContainerWidget(
              width: 114.w,
              height: 132.h,
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
              child: _buildStatItem(
                context,
                title: AppTexts.amountOfTimeForExercise,
                value: _formatTime(state.totalTime),
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: CustomGradientContainerWidget(
              width: 114.w,
              height: 132.h,
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
              child: _buildStatItem(
                context,
                title: AppTexts.numberOfRepetitions,
                value: state.totalReps.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainTextBody.gradientText(
            context,
            title,
            size: TextSize.xs,
            alignment: Alignment.topCenter,
            useGradient: false,
            useShadow: false,
            height: 1.1,
            fontSize: 12.sp,
          ),
          const Spacer(),
          MainTextBody.gradientText(
            context,
            value,
            alignment: Alignment.topCenter,
            useGradient: false,
            useShadow: false,
            height: 1.0,
            fontSize: 30.sp,
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }
}
