import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/achievements/view/achievements_screen.dart';
import '../features/game/view/game_screen.dart';

import '../features/game/widgets/exercise_details_screen.dart';
import '../features/info/view/info_screen.dart';
import '../features/onboarding/view/onboarding_screen.dart';
import '../features/profile/view/profile_screen.dart';
import '../features/settings/view/settings_screen.dart';
import '../view/home_screen.dart';
import '../view/loading_screen.dart';
import '../view/menu_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, path: '/', initial: true),
    AutoRoute(
      page: OnboardingWrapperRoute.page,
      path: '/onboarding_wrapper',
      children: [
        AutoRoute(
          page: OnboardingRoute.page,
          path: 'onboarding',
          initial: true,
        ),
      ],
    ),
    // AutoRoute(page: OnboardingRoute.page, path: '/   onboarding'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: MenuRoute.page, path: '/menu'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: InfoRoute.page, path: '/info'),
    AutoRoute(page: GameRoute.page, path: '/game'),
    AutoRoute(page: ExerciseDetailsRoute.page, path: '/exercise_details'),
    AutoRoute(page: AchievementsRoute.page, path: '/achievements'),

  ];
}
