import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import 'game_general_overlay_widget.dart';

class CountdownOverlayWidget extends StatelessWidget {
  final int value;

  const CountdownOverlayWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final assets = {
      3: AppAssets.timer_3,
      2: AppAssets.timer_2,
      1: AppAssets.timer_1,
    };

    final assetImage = assets[value];
    return GameGeneralOverlayWidget(
      child: Center(
        child: SizedBox(
          width: 246.w,
          height: 268.h,
          child:
              assetImage != null
                  ? Image.asset(assetImage, fit: BoxFit.contain)
                  : SizedBox.shrink(),
        ),
      ),
    );
  }
}
