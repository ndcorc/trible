import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:trible/models/todo.dart';
import 'package:trible/screens/bulletin_screen.dart';
import 'package:trible/screens/cart_screen.dart';
import 'package:trible/screens/home/promotion_screen.dart';
import 'package:trible/screens/search_screen.dart';
import 'package:trible/screens/settings_screen.dart';
import 'package:trible/utils/app_bar.dart' as app_bar;
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
        final currentLocation = GoRouter.of(context).state.fullPath;
        final hide = currentLocation?.startsWith('/promotion') ?? false;
        print("hideAppBar ${hide}");
        return Scaffold(
          appBar: hide ? null : const app_bar.AppBar(),
          body: child,
          /* body: AppDrawer(child: child), */
          bottomNavigationBar: hide ? null : const AppTabBar(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'promotion/:id',
              builder:
                  (context, state) => app_bar.HideAppBarWrapper(
                    hideAppBar: true, // Hides the app bar for this child route
                    child: PromotionScreen(
                      id: state.pathParameters['id'] ?? '',
                    ), // Replace with your actual child widget
                  ),
            ),
          ],
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/bulletin',
          builder: (context, state) => const BulletinScreen(),
        ),
        GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
