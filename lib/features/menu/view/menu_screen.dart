import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../router/router.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
            child: Column(
              children: [
                IconButtonWidget(
                  iconAsset: AppAssets.iconSettings,
                  onPressed: () {
                    context.router.push(const SettingsRoute());
                  },
                ),
                SizedBox(height: 20.h),
                IconButtonWidget(
                  iconAsset: AppAssets.iconProfile,
                  onPressed: () {
                    context.router.push(const ProfileRoute());
                  },
                ),
                SizedBox(height: 12.h),
                IconButtonWidget(
                  iconAsset: AppAssets.iconInfo,
                  onPressed: () {
                    context.router.push(const InfoRoute());
                  },
                ),
              ],
            ),
          ),

          Positioned(
            left: 0.w,
            top: 384.h,
            right: 0.w,
            child: IconButtonWidget(
              iconAsset: AppAssets.iconPlay,
              width: 140.w,
              height: 140.h,
              onPressed: () {
                context.router.push(const GameRoute());
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
                text: 'Exercises',
                fontSize: 30.sp,
                onPressed: () {
                  context.router.push(const ExercisesRoute());
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 84.h,
            right: 0,
            child: Center(
              child: ActionButtonWidget(
                width: 227.w,
                height: 89.h,
                text: 'Achievements',
                fontSize: 25.sp,
                onPressed: () {
                  context.router.push(const AchievementsRoute());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
