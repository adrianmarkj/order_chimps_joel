import 'package:base_project/application/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppConstants.routeSplash,
  observers: [GoRouterObserver()],
  routes: [
    // GoRoute(
    //     path: AppConstants.routeSplash,
    //     name: "Splash",
    //     builder: (context, state) {
    //       return const SplashPageWrapperProvider();
    //     }),
    // GoRoute(
    //     path: AppConstants.routeWebPage,
    //     name: "Web View",
    //     builder: (context, state) {
    //       return WebPageWrapperProvider(
    //         title: state.pathParameters["title"]!,
    //         url: state.pathParameters["url"]!,
    //       );
    //     }),
  ],
);
