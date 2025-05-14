import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<SliderDrawerState> _tabBarKey = GlobalKey<SliderDrawerState>();

class AppTabBar extends HookConsumerWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = useState(0);

    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: NavigationBar(
          elevation: 2,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: currentPageIndex.value,
          height: 80,
          onDestinationSelected: (int index) {
            currentPageIndex.value = index;
            switch (index) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go('/todo');
                break;
              case 2:
                context.go('/details');
                break;
              case 3:
                context.go('/notifications');
                break;
              case 4:
                context.go('/settings');
                break;
            }
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.add), label: 'Add'),
            NavigationDestination(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
