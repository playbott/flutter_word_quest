import 'package:cword/global.dart';
import 'package:logman/logman.dart';

class MainAppRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logman.instance.navigation(
      NavigationLogmanRecord(
        route: route,
        action: NavigationAction.push,
        previousRoute: previousRoute,
      ),
    );
  }
}
