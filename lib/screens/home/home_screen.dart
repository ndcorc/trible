import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/screens/home/widgets/category_tabs.dart';
import 'package:trible/screens/home/widgets/discover_local_section.dart';
import 'package:trible/widgets/app_search_bar.dart';
import 'package:trible/screens/home/widgets/promotional_cards.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              /* AppSearchBar(), */

              // Category Tabs (Recents, Favorites, etc.)
              /* CategoryTabs(), */

              // Promotional Cards
              PromotionalCards(),

              // Discover Local Section
              DiscoverLocalSection(),
            ],
          ),
        ),
      ),
    );
  }
}
