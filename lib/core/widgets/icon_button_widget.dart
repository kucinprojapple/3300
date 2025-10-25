import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonWidget extends StatelessWidget {
  final String iconAsset;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const IconButtonWidget({
    super.key,
    required this.iconAsset,
    this.height,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? 62.w;
    final buttonHeight = height ?? 62.h;
    return GestureDetector(
      onTap: onPressed ?? () => context.router.maybePop(),
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              iconAsset,
              width: buttonWidth,
              height: buttonHeight,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
