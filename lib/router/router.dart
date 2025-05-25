import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/screens/bulletin_screen.dart';
import 'package:trible/screens/business/business_details_screen.dart';
import 'package:trible/screens/cart_screen.dart';
import 'package:trible/screens/promotion/promotion_details_screen.dart';
import 'package:trible/screens/search_screen.dart';
import 'package:trible/screens/settings_screen.dart';
import 'package:trible/widgets/app_bar.dart' as app_bar;
import 'package:trible/screens/home/home_screen.dart';
import 'package:trible/widgets/app_tab_bar.dart';

// Define a Riverpod provider for the shared enabled state.
final enabledProvider = StateProvider<bool>((ref) => true);

// Create a widget that holds the shared state.
class ShellScaffold extends HookConsumerWidget {
  final Widget child;

  ShellScaffold({super.key, required this.child});

  final hideAppBarRoutes = ['/promotion', '/business'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(enabledProvider);
    final currentLocation = GoRouter.of(context).state.fullPath;
    final hide = hideAppBarRoutes.any(
      (route) => currentLocation?.startsWith(route) ?? false,
    );

    return Scaffold(
      appBar: hide ? null : const app_bar.AppBar(),
      body: child,
      bottomNavigationBar: hide ? null : const AppTabBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0, right: 4),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FloatingActionButton(
            child: Icon(
              enabled
                  ? Icons.hourglass_bottom_rounded
                  : Icons.hourglass_disabled_outlined,
            ),
            onPressed: () {
              ref.read(enabledProvider.notifier).state = !enabled;
            },
          ),
        ),
      ),
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
                  (context, state) => app_bar.HideAppBarWrapper(
                    hideAppBar: true, // Hides the app bar for this child route
                    child: PromotionDetailsScreen(
                      id: state.pathParameters['id'] ?? '',
                    ), // Replace with your actual child widget
                  ),
            ),
            GoRoute(
              path: 'business/:id',
              builder:
                  (context, state) => app_bar.HideAppBarWrapper(
                    hideAppBar: true,
                    child: BusinessDetailScreen(
                      businessId: state.pathParameters['id'] ?? '',
                    ),
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
