import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/text_styles.dart';

class LoadingProgressBar extends StatelessWidget {
  final double progress;

  const LoadingProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final progressPercent = (progress * 100).toInt();

    return CustomPaint(
      child: Container(
        height: 38.h,
        width: 190.w,
        decoration: BoxDecoration(
          color: Color(0xFF081900),
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Stack(
          children: [
            LayoutBuilder(
              builder:
                  (context, constraints) => Container(
                    width: constraints.maxWidth * progress,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4BCB0B), Color(0xFF2F8703)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(35.r),
                    ),
                  ),
            ),

            Center(
              child: MainTextBody.gradientText(
                context,
                '$progressPercent%',
                fontSize: 25.sp,
                alignment: Alignment.center,
                useShadow: false,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
