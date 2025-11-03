import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import 'game_general_overlay_widget.dart';

class GoodJobOverlayWidget extends StatelessWidget {
  const GoodJobOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final assets = [
      AppAssets.timerGoodJob,
      AppAssets.timerWellDone,
      AppAssets.timerExcellent,
      AppAssets.timerAmazing,
    ];
    final assetImage = assets[random.nextInt(assets.length)];

    return GameGeneralOverlayWidget(
      child: Center(
        child: SizedBox(
          width: 332.w,
          height: 176.h,
          child: Image.asset(assetImage),
        ),
      ),
    );
  }
}
