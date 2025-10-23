import 'package:auto_route/auto_route.dart';

import '../view/loading_screen.dart';
import '../view/menu_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, path: '/', initial: true),
    AutoRoute(page: MenuRoute.page, path: '/menu'),
  ];
}
