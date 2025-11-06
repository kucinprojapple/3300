import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/green_gym_club.dart';
import '../../../app_core_design/assets.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/router/router.dart';
import '../../../core/services/music_service.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    MusicService.stopMenuMusic();
    super.dispose();
  }

  @override
  void didPush() {
    MusicService.playMenuMusic();
  }

  @override
  void didPopNext() {
    MusicService.playMenuMusic();
  }

  @override
  void didPushNext() {
    MusicService.stopMenuMusic();
  }

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
            top: 160.h,
            right: 30.w,
            child: Image.asset(
              AppAssets.shirt,
              width: 332.w,
              height: 388.h,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Positioned(
            left: 30.w,
            top: 48.h,
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
            top: 380.h,
            right: 0.w,
            child: Column(
              children: [
                IconButtonWidget(
                  iconAsset: AppAssets.iconPlay,
                  width: 140.w,
                  height: 140.h,
                  onPressed: () {
                    context.router.push(const GameRoute());
                  },
                ),
                SizedBox(height: 12.h),
                Center(
                  child: ActionButtonWidget(
                    width: 224.w,
                    height: 88.h,
                    text: AppTexts.exercises,
                    fontSize: 30.sp,
                    onPressed: () {
                      context.router.push(const ExercisesRoute());
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: ActionButtonWidget(
                    width: 224.w,
                    height: 88.h,
                    text: AppTexts.achievementsScreen,
                    fontSize: 25.sp,
                    onPressed: () {
                      context.router.push(const AchievementsRoute());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
