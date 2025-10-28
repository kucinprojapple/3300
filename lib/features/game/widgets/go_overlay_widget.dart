import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import 'game_general_overlay_widget.dart';

class GoOverlayWidget extends StatelessWidget {
  const GoOverlayWidget({super.key, });
  @override
  Widget build(BuildContext context) {
    return GameGeneralOverlayWidget(
      child: Center(
        child: SizedBox(
          width: 332.w,
          height: 176.h,
          child:
           Image.asset(AppAssets.timerGo),

        ),
      ),
    );
  }
}
