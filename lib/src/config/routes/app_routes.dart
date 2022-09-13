import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/pages/demo.dart';

import '../../pages/home.dart';
import '../../pages/home_pages/audience.dart';
import '../../pages/home_pages/audience_view_page.dart';
import '../../pages/home_pages/feed.dart';
import '../../pages/home_pages/profile.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(
      RouteSettings settings, bool isLoggedIn) {
    if (!isLoggedIn) {
      switch (settings.name) {
        case 'login':
          return _materialRoute(const Demo(title: "Login"));
        case 'register':
          return _materialRoute(const Demo(title: 'Register'));
      }
    }

    if (isLoggedIn) {
      switch (settings.name) {
        case 'update_profile':
          return _materialRoute(const Demo(title: 'Update Profile'));
      }
    }

    switch (settings.name) {
      case HomePage.routeName:
        return _materialRoute(HomePage());
      case AudiencePage.routeName:
        // final AudienceViewArguments args =
        //     settings.arguments as AudienceViewArguments;
        return _materialRoute(const AudiencePage());
      case "onboarding":
        return _materialRoute(const Demo(title: "Onboarding"));
      case 'about':
        final DemoScreenArguments args =
            settings.arguments as DemoScreenArguments;
        return _materialRoute(Demo(title: "About", args: args));
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static PageRouteBuilder<dynamic>? onGenerateBottomNavRoutes(
      RouteSettings settings, PageController tabController) {
    switch (settings.name) {
      case HomePage.routeName:
        return _homeRoute(
          PageView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                FeedScreen(),
                AudienceScreen(),
                ProfileScreen(),
              ]),
          settings,
        );

      default:
        throw const FormatException('Route not found');
    }
  }

  static PageRouteBuilder<dynamic> _homeRoute(
      Widget view, RouteSettings settings) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container(
            color: Colors.white,
            child: view,
          );
        },
        settings: settings);
  }
}
