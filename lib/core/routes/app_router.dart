import 'package:auto_route/auto_route.dart';
import 'package:flutter_app_template/features/welcome/presentation/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomePageRoute.page, path: '/'),
      ];
}
