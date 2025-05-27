import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/screens/bulletin/widgets/local_spotlight_section.dart';
import 'package:trible/screens/bulletin/widgets/upcoming_events_tab.dart';
import 'package:trible/screens/bulletin/widgets/announcements_tab.dart';

class BulletinScreen extends HookConsumerWidget {
  const BulletinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTabIndex = useState(0);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Local Spotlights Section
              const LocalSpotlightsSection(),
              const SizedBox(height: 24),
              // Tab Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _TabButton(
                        title: 'Upcoming events',
                        isSelected: selectedTabIndex.value == 0,
                        onTap: () => selectedTabIndex.value = 0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _TabButton(
                        title: 'Announcements',
                        isSelected: selectedTabIndex.value == 1,
                        onTap: () => selectedTabIndex.value = 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Tab Content
              selectedTabIndex.value == 0
                  ? const UpcomingEventsTab()
                  : const AnnouncementsTab(),

              const SizedBox(height: 100), // Space for bottom navigation
            ],
          ),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFF7BA7B1)
                  : Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
