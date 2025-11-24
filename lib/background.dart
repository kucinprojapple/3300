import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

class AppMainBackground extends StatelessWidget {
  const AppMainBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double fullScreenHeight = ScreenUtil().screenHeight;
    final double fullScreenWidth = ScreenUtil().screenWidth;
    return Container(
      height: fullScreenHeight,
      width: fullScreenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundMain),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
