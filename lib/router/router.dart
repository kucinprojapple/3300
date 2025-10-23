import 'package:auto_route/auto_route.dart';

import '../features/onboarding/view/onboarding_screen.dart';
import '../view/home_screen.dart';
import '../view/loading_screen.dart';
import '../view/menu_screen.dart';






part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, path: '/', initial: true),
    AutoRoute(page: OnboardingWrapperRoute.page, path: '/onboarding_wrapper',
    children: [
      AutoRoute(
        page: OnboardingRoute.page,
        path: 'onboarding',
        initial: true,
      ),
      // AutoRoute(
      //   page: ProfileSecurityRoute.page,
      //   path: 'profile_security',
      // ),
    ]),
    // AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: MenuRoute.page, path: '/menu'),
  ];
}
