import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../achievements_overlay_bloc/achievements_overlay_bloc.dart';
import '../data/achievements_data.dart';
import '../model/achievement_model.dart';
import '../widgets/achievement_item_widget.dart';
import '../widgets/achievements_overlays.dart';
import '../widgets/achievements_page_indicator_widget.dart';

@RoutePage()
class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('AchievementsOverlays context: ${BlocProvider.of<AchievementsOverlayBloc>(context, listen: false)}');
    final List<Achievement> achievements = AchievementsData.achievements;
    final pageCount = (achievements.length / 5).ceil();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),

          Positioned(
            left: 30.w,
            top: 48.h,
            child: Column(
              children: [
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
            left: 0.w,
            top: 120.h,
            right: 0.w,
            child: MainTextBody.gradientText(
              context,
              'Achievements',
              size: TextSize.m,
              alignment: Alignment.center,
              useShadow: false,
              height: 1.1,
            ),
          ),
          Positioned(
            left: 0.w,
            top: 200.h,
            right: 0.w,
            child: SizedBox(
              width: double.infinity,
              height: 500.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: 4,
                      onPageChanged:
                          (index) => setState(() => _currentPage = index),
                      itemBuilder: (context, pageIndex) {
                        final pageAchievements =
                        achievements.skip(pageIndex * 5).take(5).toList();
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            5,
                                (i) =>
                                AchievementItem(
                                  achievement: pageAchievements[i],
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                  // SizedBox(height: 20.h),
                  AchievementsPageIndicatorWidget(
                    pageCount: pageCount,
                    currentPage: _currentPage,
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(child: AchievementsOverlays()),
        ],
      ),
    );
  }
}
