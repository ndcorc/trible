import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:trible/models/todo.dart';
import 'package:trible/screens/home/home_screen.dart';
import 'package:trible/utils/app_drawer.dart';
import 'package:trible/screens/details.dart';
import 'package:trible/screens/simple_todo.dart';
import 'package:trible/utils/app_tab_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          body: AppDrawer(child: child),
          bottomNavigationBar: const AppTabBar(),
        );
      },
      routes: <RouteBase>[
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/todo', builder: (context, state) => const SimpleTodo()),
        GoRoute(
          path: '/details',
          builder: (context, state) => const Details(label: 'A'),
        ),
      ],
    ),
  ],
);
