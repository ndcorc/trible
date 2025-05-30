import 'package:trible/router/router.dart';
import 'package:trible/screens/bulletin/bulletin_screen.dart';
import 'package:trible/screens/business/business_details_screen.dart';
import 'package:trible/screens/explore/explore_screen.dart';
import 'package:trible/screens/rewards/cart_screen.dart';
import 'package:trible/screens/home/home_screen.dart';
import 'package:trible/screens/home/widgets/category_tabs.dart';
import 'package:trible/screens/promotion/promotion_details_screen.dart';
import 'package:trible/screens/profile/city_picks_screen.dart';
import 'package:trible/screens/profile/personal_qr_screen.dart';
import 'package:trible/screens/profile/profile_screen.dart';
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
    path: '/explore',
    name: 'explore',
    showAppBar: false,
    builder: (context, state) => const ExploreScreen(),
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
    path: '/profile',
    name: 'profile',
    builder: (context, state) => const ProfileScreen(),
  ),
  AppRoute(
    path: '/personal-qr',
    name: 'personalQR',
    showAppBar: true,
    builder: (context, state) => const PersonalQRScreen(),
  ),
  AppRoute(
    path: '/city-picks/:id',
    name: 'cityPicks',
    showAppBar: true,
    builder:
        (context, state) =>
            CityPicksScreen(cityPicksId: state.pathParameters['id'] ?? ''),
  ),
];
