
import 'package:flutter/material.dart'
    show
        BuildContext,
        GlobalKey,
        Key,
        Navigator,
        NavigatorState,
        PageController,
        PageRoute,
        Route,
        RouteObserver,
        Scaffold,
        State,
        StatefulWidget,
        Widget;
import 'package:provider/provider.dart';

import '../../config/routes/app_routes.dart';
// import '../../models/facility/lat_lng.dart';
// import '../../providers/home_nav_back_provider.dart';
// import '../../widgets/molecules/bottom_nav_bar.dart';
import '../../providers/home_nav_back_provider.dart';
import '../../widgets/molecules/bottom_nav_bar.dart';
import '../../widgets/organisms/double_back_to_close.dart';
import '../home.dart';

final homeNavigator = GlobalKey<NavigatorState>();

bool goBack() {
  bool? canGoBack = homeNavigator.currentState?.canPop();
  if (canGoBack!) {
    homeNavigator.currentState?.pop();
    return false;
  }
  return true;
}

class HomeRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (!route.isFirst && homeNavigator.currentContext != null) {
      Provider.of<HomeNavBackProvider>(homeNavigator.currentContext!,
              listen: false)
          .setBack(true);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    super.didPop(route, previousRoute);
    if (homeNavigator.currentContext != null) {
      Provider.of<HomeNavBackProvider>(homeNavigator.currentContext!,
              listen: false)
          .setBack(false);
    }
  }
}

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  final PageController _tabController = PageController();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackToClose(
      onBackPress: () async {
        return goBack();
      },
      child: Scaffold(
        extendBody: true,
        body: Navigator(
            key: homeNavigator,
            observers: [HomeRouteObserver()],
            initialRoute: HomePage.routeName,
            onGenerateRoute: (settings) {
              return AppRouter.onGenerateBottomNavRoutes(
                settings,
                _tabController,
              );
            }),
        bottomNavigationBar: BottomNavBar(
          tabController: _tabController,
        ),
      ),
    );
  }
}
