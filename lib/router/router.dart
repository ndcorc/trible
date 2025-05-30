import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/router/routes.dart';
import 'package:trible/screens/bulletin/bulletin_screen.dart';
import 'package:trible/screens/business/business_details_screen.dart';
import 'package:trible/screens/rewards/cart_screen.dart';
import 'package:trible/screens/promotion/promotion_details_screen.dart';
import 'package:trible/screens/search_screen.dart';
import 'package:trible/screens/profile/city_picks_screen.dart';
import 'package:trible/screens/profile/personal_qr_screen.dart';
import 'package:trible/screens/profile/profile_screen.dart';
import 'package:trible/widgets/app_bar.dart' as app_bar;
import 'package:trible/screens/home/home_screen.dart';
import 'package:trible/widgets/app_tab_bar.dart';

class AppRoute extends GoRoute {
  final bool showAppBar;
  final bool showSearchBar;
  final bool showZipCode;
  final bool showFavorites;
  final Widget? extra;

  AppRoute({
    required super.path,
    required super.builder,
    required super.name,
    List<AppRoute> routes = const [],
    this.showAppBar = true,
    this.showSearchBar = false,
    this.showZipCode = false,
    this.showFavorites = false,
    this.extra,
  }) : super(routes: routes);
}

AppRoute getRoute(String path) =>
    routes.firstWhere((route) => route.path == path);

// Define a Riverpod provider for the shared enabled state.
final darkModeProvider = StateProvider<bool>((ref) => false);

// Create a widget that holds the shared state.
class ShellScaffold extends HookConsumerWidget {
  final Widget child;

  ShellScaffold({super.key, required this.child});

  final hideAppBarRoutes = ['/promotion', '/business'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouter.of(context).state.fullPath;
    final appRoute = getRoute(currentLocation ?? '');
    final hide = !appRoute.showAppBar;
    final appBarWidget = app_bar.AppBar(appRoute: appRoute);

    return Scaffold(
      appBar: hide ? null : appBarWidget,
      body: child,
      bottomNavigationBar: hide ? null : const AppTabBar(),
    );
  }
}

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
        return ShellScaffold(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'promotion/:id',
              builder:
                  (context, state) => PromotionDetailsScreen(
                    id: state.pathParameters['id'] ?? '',
                  ),
            ),
            GoRoute(
              path: 'business/:id',
              builder:
                  (context, state) => BusinessDetailScreen(
                    businessId: state.pathParameters['id'] ?? '',
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
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/personal-qr',
          builder: (context, state) => const PersonalQRScreen(),
        ),
        GoRoute(
          path: '/city-picks/:id',
          builder:
              (context, state) => CityPicksScreen(
                cityPicksId: state.pathParameters['id'] ?? '',
              ),
        ),
      ],
    ),
  ],
);
