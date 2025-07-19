import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/home/views/home_page.dart';

import 'landing_page.dart';


final GoRouter router = GoRouter(
  initialLocation: '/landing-page',
  routes: <RouteBase>[
    GoRoute(
      path: '/landing-page',
      name: 'landing-page',
      builder: (BuildContext context, GoRouterState state) {
        return const LandingPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);
