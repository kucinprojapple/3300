import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/text_styles.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

class OnboardingStepCircleWidget extends StatelessWidget {
  final int stepIndex;

  const OnboardingStepCircleWidget({super.key, required this.stepIndex});

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerWidget(
      width: 44.w,
      height: 44.w,
      borderRadius: 22.r,
      borderWidth: 0.25.r,
      backgroundGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2F8703), Color(0xFF4BCB0B)],
      ),
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFAAA7A6), Color(0xFFFFFFFF)],
      ),
      child: Center(
        child: MainTextBody.gradientText(
          context,
          '$stepIndex',
          alignment: Alignment.center,
          // useShadow: false,
          height: 1.1,
          fontSize: 30.sp,
        ),
      ),
    );
  }
}
