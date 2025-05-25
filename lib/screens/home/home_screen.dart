import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/router/router.dart';
import 'package:trible/screens/home/widgets/category_tabs.dart';
import 'package:trible/screens/home/widgets/discover_local_section.dart';
import 'package:trible/screens/home/widgets/home_search_bar.dart';
import 'package:trible/screens/home/widgets/promotional_cards.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(enabledProvider); // reference the value here

    return const Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              HomeSearchBar(),

              // Category Tabs (Recents, Favorites, etc.)
              CategoryTabs(),

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
