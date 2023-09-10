import 'package:flutter/material.dart';

import 'package:nethive/app/presentation/screens/error.dart';
import 'package:nethive/app/presentation/screens/home.dart';
import 'package:nethive/app/presentation/screens/new/lanch.dart';

import 'package:nethive/app/presentation/screens/new/no_internet.dart';

import 'package:nethive/utilities/router/routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.webView:
        return MaterialPageRoute(
          builder: (_) => const WebViewApp(),
        );

      case Routes.noInternet:
        return MaterialPageRoute(
          builder: (_) => const NoInternet(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
