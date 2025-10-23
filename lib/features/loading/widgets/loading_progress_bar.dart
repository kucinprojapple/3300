import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              child: Stack(
                children: [
                  Text(
                    '$progressPercent%',
                    style: TextStyle(
                      fontFamily: 'OtomanopeeOne',
                      fontWeight: FontWeight.w400,
                      fontSize: 25.sp,
                      foreground:
                          Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.59
                            ..color = const Color(0x8C000000),
                    ),
                  ),

                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color(0xFFFFFFFF), Color(0xFFFFE2AA)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Text(
                      '$progressPercent%',
                      style: TextStyle(
                        fontFamily: 'OtomanopeeOne',
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        shadows: const [
                          Shadow(
                            offset: Offset(0, 1.59),
                            blurRadius: 1.59,
                            color: Color(0x8C000000),
                          ),
                        ],
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
