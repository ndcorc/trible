import 'package:trible/router/router.dart';
import 'package:trible/screens/bulletin_screen.dart';
import 'package:trible/screens/business/business_details_screen.dart';
import 'package:trible/screens/cart_screen.dart';
import 'package:trible/screens/home/home_screen.dart';
import 'package:trible/screens/promotion/promotion_details_screen.dart';
import 'package:trible/screens/search_screen.dart';
import 'package:trible/screens/settings_screen.dart';
import 'package:trible/widgets/app_bar.dart' as app_bar;

final routes = <AppRoute>[
  AppRoute(
    path: '/',
    name: 'home',
    showAppBar: true,
    showSearchBar: true,
    showZipCode: true,
    showFavorites: true,
    builder: (context, state) => const HomeScreen(),
  ),
  AppRoute(
    path: '/promotion/:id',
    name: 'promotionDetails',
    showAppBar: false,
    builder:
        (context, state) =>
            PromotionDetailsScreen(id: state.pathParameters['id'] ?? ''),
  ),
  AppRoute(
    path: '/business/:id',
    name: 'businessDetails',
    showAppBar: false,
    builder:
        (context, state) =>
            BusinessDetailScreen(businessId: state.pathParameters['id'] ?? ''),
  ),
  AppRoute(
    path: '/search',
    name: 'search',
    showAppBar: true,
    builder: (context, state) => const SearchScreen(),
  ),
  AppRoute(
    path: '/bulletin',
    name: 'bulletin',
    showAppBar: true,
    builder: (context, state) => const BulletinScreen(),
  ),
  AppRoute(
    path: '/cart',
    name: 'cart',
    showAppBar: true,
    builder: (context, state) => const CartScreen(),
  ),
  AppRoute(
    path: '/settings',
    name: 'settings',
    builder: (context, state) => const SettingsScreen(),
  ),
];
