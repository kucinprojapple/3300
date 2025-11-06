import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../achievements_bloc/achievements_bloc.dart';
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
  void initState() {
    super.initState();
    context.read<AchievementsBloc>().add(const LoadAchievementsEvent());
  }

  @override
  Widget build(BuildContext context) {
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
              AppTexts.achievementsScreen,
              fontSize: 25.sp,
              alignment: Alignment.center,
              useShadow: false,
              height: 1.1,
            ),
          ),
          Positioned(
            left: 0.w,
            top: 200.h,
            right: 0.w,
            child: BlocBuilder<AchievementsBloc, AchievementsState>(
              builder: (context, state) {
                if (state is AchievementsLoaded) {
                  final achievements = state.achievements;
                  final pageCount = (achievements.length / 5).ceil();

                  return SizedBox(
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
                                  achievements
                                      .skip(pageIndex * 5)
                                      .take(5)
                                      .toList();
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  5,
                                  (i) => AchievementItem(
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
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Positioned.fill(child: AchievementsOverlays()),
        ],
      ),
    );
  }
}
