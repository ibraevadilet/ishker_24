import 'package:auto_route/auto_route.dart';
import 'package:ishker_24/routes/mobile_auto_router.dart';
import 'package:ishker_24/server/service_locator.dart';

class AppRouting {
  static pushFunction(PageRouteInfo<dynamic> route) {
    sl<AppRouter>().push(route);
  }

  static replaceFunction(PageRouteInfo<dynamic> route) {
    sl<AppRouter>().replace(route);
  }

  static popUntilFunction(String routeName) {
    sl<AppRouter>().popUntilRouteWithName(routeName);
  }

  static popUntilRootFunction() {
    sl<AppRouter>().popUntilRoot();
  }

  static pushAndPopUntilFunction(PageRouteInfo<dynamic> route) {
    sl<AppRouter>().pushAndPopUntil(
      route,
      predicate: (route) => false,
    );
  }
}
