import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_core_design/assets.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  const ActionButtonWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.height,
    this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? 228.w;
    final buttonHeight = height ?? 88.h;

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAssets.buttonMain,
              fit: BoxFit.fill,
              height: buttonHeight,
              width: buttonWidth,
            ),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback:
                  (bounds) => const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFFFFE2AA), Color(0xFFFFFFFF)],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OtomanopeeOne',
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.w400,
                  shadows: [
                    Shadow(
                      offset: Offset(0.w, 1.59.h),
                      blurRadius: 1.59.r,
                      color: Color(0x8C000000),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
