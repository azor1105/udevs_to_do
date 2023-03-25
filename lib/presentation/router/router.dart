import 'package:flutter/material.dart';
import 'package:udevs_todo/presentation/utils/constants/route_names.dart';
import 'package:udevs_todo/presentation/views/tab/tab_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.tab:
        return MaterialPageRoute(
          builder: (ctx) => const TabScreen(),
        );
      default:
        return null;
    }
  }
}
