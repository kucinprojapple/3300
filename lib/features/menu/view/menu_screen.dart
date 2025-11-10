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
              height: 380.h,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
          ),

          Column(
            children: [
              SizedBox(height: MediaQuery.viewPaddingOf(context).top + 12.h),
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomIconButtonWidget(
                        iconAsset: AppAssets.iconSettings,
                        onPressed: () {
                          context.router.push(const SettingsRoute());
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomIconButtonWidget(
                        iconAsset: AppAssets.iconProfile,
                        onPressed: () {
                          context.router.push(const ProfileRoute());
                        },
                      ),
                      SizedBox(height: 12.h),
                      CustomIconButtonWidget(
                        iconAsset: AppAssets.iconInfo,
                        onPressed: () {
                          context.router.push(const InfoRoute());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 116.h),
              CustomIconButtonWidget(
                iconAsset: AppAssets.iconPlay,
                width: 140.w,
                height: 140.h,
                onPressed: () {
                  context.router.push(const GameRoute());
                },
              ),
              SizedBox(height: 44.h),
              Center(
                child: ActionButtonWidget(
                  width: 200.w,
                  height: 80.h,
                  text: AppTexts.exercises,
                  fontSize: 24.sp,
                  onPressed: () {
                    context.router.push(const ExercisesRoute());
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: ActionButtonWidget(
                  width: 200.w,
                  height: 80.h,
                  text: AppTexts.achievementsScreen,
                  fontSize: 22.sp,
                  onPressed: () {
                    context.router.push(const AchievementsRoute());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
