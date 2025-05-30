// lib/screens/profile/city_picks_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/providers/city_picks.dart';
import 'package:trible/providers/user_profile.dart';
import 'package:trible/providers/businesses.dart';
import 'package:trible/widgets/business_image.dart';

class CityPicksScreen extends HookConsumerWidget {
  const CityPicksScreen({super.key, required this.cityPicksId});

  final String cityPicksId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCityPicks = ref.watch(cityPicksNotifierProvider);
    final asyncUserProfile = ref.watch(userProfileNotifierProvider);
    final asyncBusinesses = ref.watch(businessesProvider);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: asyncCityPicks.when(
          data: (cityPicksList) {
            final cityPicks = cityPicksList.firstWhere(
              (cp) => cp.id == cityPicksId,
              orElse: () => throw Exception('City Picks not found'),
            );

            return asyncUserProfile.when(
              data:
                  (userProfile) => asyncBusinesses.when(
                    data: (businesses) {
                      // Filter businesses that are in this city's picks
                      final favoriteBusinesses =
                          businesses
                              .where(
                                (business) =>
                                    cityPicks.businessIds.contains(business.id),
                              )
                              .toList();

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // Header Card
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  // Header with star icon and menu
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF7BA7B1),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            // Handle menu options
                                          },
                                          icon: const Icon(Icons.more_horiz),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Star placeholder area
                                  Container(
                                    width: double.infinity,
                                    height: 260,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 48,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.star,
                                        size: 60,
                                        color: Color(0xFF7BA7B1),
                                      ),
                                    ),
                                  ),

                                  // Title and user info
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${userProfile.firstName}'s ${cityPicks.cityName} Favs",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // Handle share
                                              },
                                              icon: const Icon(Icons.ios_share),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${userProfile.firstName} ${userProfile.lastName}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Business List
                            Expanded(
                              child:
                                  favoriteBusinesses.isEmpty
                                      ? const Center(
                                        child: Text(
                                          'No favorite businesses yet',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                      : ListView.builder(
                                        itemCount: favoriteBusinesses.length,
                                        itemBuilder: (context, index) {
                                          final business =
                                              favoriteBusinesses[index];
                                          return _FavoriteBusinessItem(
                                            business: business,
                                            onTap: () {
                                              // Handle business tap
                                            },
                                          );
                                        },
                                      ),
                            ),
                          ],
                        ),
                      );
                    },
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    error:
                        (error, stack) => Center(child: Text('Error: $error')),
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}

class _FavoriteBusinessItem extends StatelessWidget {
  const _FavoriteBusinessItem({required this.business, required this.onTap});

  final dynamic business; // Business type
  final VoidCallback onTap;

  String _getBusinessCategory(String businessName) {
    // Mock category mapping based on business names
    if (businessName.toLowerCase().contains('brew') ||
        businessName.toLowerCase().contains('coffee')) {
      return 'Coffee';
    } else if (businessName.toLowerCase().contains('pub') ||
        businessName.toLowerCase().contains('restaurant')) {
      return 'Restaurant';
    } else if (businessName.toLowerCase().contains('delivery') ||
        businessName.toLowerCase().contains('wood')) {
      return 'Home';
    } else if (businessName.toLowerCase().contains('bakery')) {
      return 'Bakery';
    }
    return 'Business';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BusinessImage(imageUrl: business.logoUrl, fit: BoxFit.cover),
          ),
        ),
        title: Text(
          business.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          _getBusinessCategory(business.name),
          style: const TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            // Handle menu options for this business
          },
          icon: const Icon(Icons.more_horiz, color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}
