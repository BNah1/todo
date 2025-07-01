import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/feature/home/view/home_view.dart';





class AppRoutes {

  ///Route name
  static const String home = '/home';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _cupertinoRoute(
          const HomeView(),
        );

      default:
        return _cupertinoRoute(Scaffold(
          body: Center(
            child: Text(
              'Wrong Route provided ${settings.name}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
    builder: (_) => view,
  );

  AppRoutes._();
}