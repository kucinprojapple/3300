import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CustomGradientContainerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final double? borderWidth;
  final Gradient backgroundGradient;
  final Gradient borderGradient;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomGradientContainerWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.borderWidth,
    required this.backgroundGradient,
    required this.borderGradient,
    this.child,
    this.padding,
    this.margin,
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
