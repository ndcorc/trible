import 'package:flutter/material.dart';
import 'package:trible/router/router.dart';
import 'package:trible/screens/bulletin/bulletin_screen.dart';
import 'package:trible/screens/business/business_details_screen.dart';
import 'package:trible/screens/rewards/cart_screen.dart';
import 'package:trible/screens/home/home_screen.dart';
import 'package:trible/screens/home/widgets/category_tabs.dart';
import 'package:trible/screens/promotion/promotion_details_screen.dart';
import 'package:trible/screens/search_screen.dart';
import 'package:trible/screens/settings_screen.dart';
import 'package:trible/widgets/app_bar.dart' as app_bar;
import 'package:trible/widgets/bulletin_screen_header.dart';

final routes = <AppRoute>[
  AppRoute(
    path: '/',
    name: 'home',
    showAppBar: true,
    showSearchBar: true,
    showZipCode: true,
    showFavorites: true,
    builder: (context, state) => const HomeScreen(),
    extra: const CategoryTabs(),
  ),
  AppRoute(
    path: '/promotion/:id',
    name: 'promotionDetails',
    showAppBar: true,
    showSearchBar: true,
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
    showSearchBar: true,
    showZipCode: true,
    builder: (context, state) => const BulletinScreen(),
    extra: const BulletinScreenHeader(),
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
