import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/achievements/view/achievements_screen.dart';
import '../../features/exercises/view/exercise_details_screen.dart';
import '../../features/exercises/view/exercises_screen.dart';
import '../../features/game/view/game_screen.dart';
import '../../features/game/view/record_screen.dart';
import '../../features/game/view/timer_screen.dart';
import '../../features/info/view/info_screen.dart';
import '../../features/loading/view/loading_screen.dart';
import '../../features/lost_network/view/lost_network_screen.dart';
import '../../features/menu/view/menu_screen.dart';
import '../../features/onboarding/view/onboarding_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/settings/view/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, path: '/', initial: true),
    AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
    AutoRoute(page: MenuRoute.page, path: '/menu'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: InfoRoute.page, path: '/info'),
    AutoRoute(page: GameRoute.page, path: '/game'),
    AutoRoute(page: ExercisesRoute.page, path: '/exercises'),
    AutoRoute(page: ExerciseDetailsRoute.page, path: '/exercise_details'),
    AutoRoute(page: AchievementsRoute.page, path: '/achievements'),
    AutoRoute(page: RecordRoute.page, path: '/record'),
    AutoRoute(page: LostNetworkRoute.page, path: '/lost_network'),
  ];
}
