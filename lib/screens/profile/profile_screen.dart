// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/providers/city_picks.dart';
import 'package:trible/providers/loyalty_programs.dart';
import 'package:trible/providers/saved_events.dart';
import 'package:trible/providers/user_contributions.dart';
import 'package:trible/providers/user_profile.dart';
import 'package:trible/screens/profile/widgets/city_picks_item.dart';
import 'package:trible/screens/profile/widgets/contribution_item.dart';
import 'package:trible/screens/profile/widgets/dark_mode_toggle_item.dart';
import 'package:trible/screens/profile/widgets/loyalty_program_item.dart';
import 'package:trible/screens/profile/widgets/profile_section.dart';
import 'package:trible/screens/profile/widgets/saved_event_item.dart';
import 'package:trible/screens/profile/widgets/settings_item.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserProfile = ref.watch(userProfileNotifierProvider);
    final asyncCityPicks = ref.watch(cityPicksNotifierProvider);
    final asyncLoyaltyPrograms = ref.watch(loyaltyProgramsNotifierProvider);
    final asyncSavedEvents = ref.watch(savedEventsNotifierProvider);
    final asyncUserContributions = ref.watch(userContributionsNotifierProvider);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: asyncUserProfile.when(
                        data:
                            (userProfile) => ProfileSection(
                              userProfile: userProfile,
                              onQRTap: () => context.push('/personal-qr'),
                            ),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (error, stack) =>
                                Center(child: Text('Error: $error')),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // City Picks Section
                    const Text(
                      'City Picks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    asyncCityPicks.when(
                      data:
                          (cityPicksList) => Column(
                            children: [
                              ...cityPicksList.map(
                                (cityPicks) => CityPicksItem(
                                  cityPicks: cityPicks,
                                  onTap:
                                      () => context.push(
                                        '/city-picks/${cityPicks.id}',
                                      ),
                                ),
                              ),
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  fixedSize: const Size(double.infinity, 40),
                                ),
                                onPressed: () {
                                  // Handle create new city picks
                                },
                                icon: const Icon(Icons.add, color: Colors.blue),
                                label: const Text(
                                  'Create New City Picks',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, stack) =>
                              Center(child: Text('Error: $error')),
                    ),
                    const Divider(),
                    const SizedBox(height: 12),

                    // My Rewards & Loyalty Section
                    const Text(
                      'My Rewards & Loyalty',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    asyncLoyaltyPrograms.when(
                      data:
                          (loyaltyPrograms) => Column(
                            children: [
                              ...loyaltyPrograms.map(
                                (program) => LoyaltyProgramItem(
                                  program: program,
                                  onTap: () {
                                    // Handle loyalty program tap
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle view all cards
                                  },
                                  child: const Text(
                                    'View All Cards',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, stack) =>
                              Center(child: Text('Error: $error')),
                    ),

                    const Divider(),
                    const SizedBox(height: 12),

                    // Saved Events Section
                    const Text(
                      'Saved Events',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    asyncSavedEvents.when(
                      data:
                          (savedEvents) => Column(
                            children: [
                              ...savedEvents.map(
                                (savedEvent) => SavedEventItem(
                                  savedEvent: savedEvent,
                                  onTap: () {
                                    // Handle saved event tap
                                  },
                                ),
                              ),
                              if (savedEvents.isNotEmpty) ...[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle view activity feed
                                    },
                                    child: const Text(
                                      'View My Activity Feed',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, stack) =>
                              Center(child: Text('Error: $error')),
                    ),

                    const Divider(),
                    const SizedBox(height: 12),

                    // My Contributions Section
                    const Text(
                      'My Contributions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    asyncUserContributions.when(
                      data:
                          (contributions) => Column(
                            children: [
                              ...contributions.map(
                                (contribution) => ContributionItem(
                                  contribution: contribution,
                                  onTap: () {
                                    // Handle contribution tap
                                  },
                                ),
                              ),
                              if (contributions.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle view all contributions
                                    },
                                    child: const Text(
                                      'View All Contributions',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, stack) =>
                              Center(child: Text('Error: $error')),
                    ),

                    const Divider(),
                    const SizedBox(height: 12),

                    // Settings Section
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    SettingsItem(
                      title: 'Account',
                      onTap: () {
                        // Handle account settings
                      },
                    ),
                    SettingsItem(
                      title: 'Notifications',
                      onTap: () {
                        // Handle notification settings
                      },
                    ),
                    SettingsItem(
                      title: 'Privacy',
                      onTap: () {
                        // Handle privacy settings
                      },
                    ),
                    SettingsItem(
                      title: 'Help',
                      onTap: () {
                        // Handle help
                      },
                    ),
                    const DarkModeToggleItem(),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
