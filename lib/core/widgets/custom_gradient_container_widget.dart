import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CustomGradientContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Gradient backgroundGradient;
  final Gradient borderGradient;
  final double? borderRadius;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  const CustomGradientContainerWidget({
    super.key,
    this.width,
    this.height,
    required this.backgroundGradient,
    required this.borderGradient,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.margin,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
        border: GradientBoxBorder(
          gradient: borderGradient,
          width: borderWidth ?? 2.r,
        ),
      ),
      child:
          child != null
              ? Padding(padding: padding ?? EdgeInsets.zero, child: child)
              : null,
    );
  }
}
