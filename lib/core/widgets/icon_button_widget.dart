import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final String iconAsset;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const CustomIconButtonWidget({
    super.key,
    required this.iconAsset,
    this.height,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? 60.w;
    final buttonHeight = height ?? 60.h;
    return GestureDetector(
      onTap: onPressed ?? () => context.router.maybePop(),
      child: Image.asset(
        iconAsset,
        width: buttonWidth,
        height: buttonHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}
