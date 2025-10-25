import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core._design/assets.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../widgets/exercise_grid_widget.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),
          Positioned(
            left: 30.w,
            top: 162.h,
            right: 28.w,
            child: Image.asset(
              AppAssets.shirt,
              width: 332.w,
              height: 389.h,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Positioned(
            left: 30.w,
            top: 49.h,
            child:
                Column(
                  children: [
                    IconButtonWidget(
                      iconAsset: AppAssets.iconPause,
                      onPressed: () {
                       // todo: add action
                      },
                    ),
                    SizedBox(height: 20.h),
                    IconButtonWidget(
                      iconAsset: AppAssets.iconBack,
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                  ],



          ),
          ),

          Positioned(
            top: 240.h,
            left: 32.w,
            right: 32.w,
            child: ExerciseGridWidget(
              onLevelSelected: (level) {

              },
            ),
          ),

          Positioned(
            left: 0,
            bottom: 181.h,
            right: 0,
            child: Center(
              child: ActionButtonWidget(
                width: 227.w,
                height: 89.h,
                text: 'Play',
                fontSize: 30.sp,
                onPressed: () {},
              ),
            ),
          ),

        ],
      ),
    );
  }
}
