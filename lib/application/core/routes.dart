import 'package:base_project/application/pages/home/home_page.dart';
import 'package:base_project/application/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/profile/profile_page.dart';

class Routes {
  static const String kLoginPage = "kLoginPage";
  static const String kHomePage = "kHomePage";
  static const String kProfilePage = "kProfilePage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kLoginPage:
        return PageTransition(
          child: const LoginPage(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kLoginPage),
        );
      case Routes.kHomePage:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kHomePage),
        );
      case Routes.kProfilePage:
        return PageTransition(
          child: const ProfilePage(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kHomePage),
        );
      default:
        return PageTransition(
          child: const LoginPage(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kLoginPage),
        );
    }
  }
}
