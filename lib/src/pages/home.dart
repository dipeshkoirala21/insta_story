import 'package:flutter/material.dart'
    show BuildContext, Key, Scaffold, StatelessWidget, Widget;
import 'package:flutter/services.dart' show SystemChrome, SystemUiMode;
import 'package:provider/provider.dart' show ChangeNotifierProvider;

// import '../providers/area_provider.dart';
import '../providers/home_nav_back_provider.dart';
import '../widgets/molecules/header.dart';
// import '../widgets/organisms/app_drawer.dart';
import '../widgets/organisms/app_drawer.dart';
import 'home_pages/home_navigator.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  HomePage({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNavBackProvider(),
      child: Scaffold(
        appBar: const Header(),
        endDrawer: const AppDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: ChangeNotifierProvider(
          // create: (_) => AreaProvider(),
          create: (BuildContext context) {},
          child: const HomeNavigator(),
        ),
      ),
    );
  }
}
