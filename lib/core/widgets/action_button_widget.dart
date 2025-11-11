import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_core_design/assets.dart';
import '../../app_core_design/text_styles.dart';

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
    final buttonWidth = width ?? 200.w;
    final buttonHeight = height ?? 80.h;

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: buttonWidth.w,
        height: buttonHeight.h,

        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              width: buttonWidth.w,
              height: buttonHeight.h,
              AppAssets.buttonMain,
              fit: BoxFit.fill,
            ),
            MainTextBody.gradientText(
              context,
              text,
              alignment: Alignment.center,
              textAlign: TextAlign.left,
              height: 1.1,
              fontSize: fontSize.sp,
            ),
          ],
        ),
      ),
    );
  }
}
