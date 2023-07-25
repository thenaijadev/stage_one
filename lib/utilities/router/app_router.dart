import 'package:flutter/material.dart';

import 'package:nethive/app/presentation/screens/error.dart';
import 'package:nethive/app/presentation/screens/new/lanch.dart';
import 'package:nethive/app/presentation/screens/new/log_record.dart';
import 'package:nethive/app/presentation/screens/new/no_internet.dart';

import 'package:nethive/app/presentation/screens/new/open_stock_screen.dart';
import 'package:nethive/app/presentation/screens/new/options.dart';

import 'package:nethive/app/presentation/screens/new/register_new_outet.dart';
import 'package:nethive/app/presentation/screens/new/sales_view.dart';
import 'package:nethive/app/presentation/screens/new/today_details.dart';
import 'package:nethive/utilities/router/routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const WebViewApp(),
        );
      case Routes.noInternet:
        return MaterialPageRoute(
          builder: (_) => const NoInternet(),
        );
      case Routes.viewSales:
        return MaterialPageRoute(
          builder: (_) => const SalesView(),
        );
      // case Routes.products:
      //   return MaterialPageRoute(
      //     builder: (_) => ProductsScreen(),
      //   );
      case Routes.todayDetails:
        return MaterialPageRoute(
          builder: (_) => const TodayDetails(),
        );
      case Routes.logs:
        return MaterialPageRoute(
          builder: (_) => const LogRecord(),
        );
      case Routes.options:
        return MaterialPageRoute(
          builder: (_) => const Options(),
        );
      // case Routes.details:
      //   var data = routeSettings.arguments as Map;

      //   // return MaterialPageRoute(
      //   //   builder: (_) => DetailScreen(
      //   //     data: data,
      //   //   ),
      //   // );

      case Routes.registerNewOutlet:
        return MaterialPageRoute(
          builder: (_) => const RegisterNewOutlet(),
        );
      case Routes.openStock:
        return MaterialPageRoute(
          builder: (_) => const OpenStock(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
