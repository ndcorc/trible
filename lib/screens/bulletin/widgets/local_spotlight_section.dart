import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trible/models/business.dart';
import 'package:trible/providers/businesses.dart';
import 'package:trible/widgets/business_image.dart';
import 'package:trible/services/analytics_service.dart';

class LocalSpotlightsSection extends HookConsumerWidget {
  const LocalSpotlightsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBusinesses = ref.watch(businessesProvider);
    final businesses = asyncBusinesses.asData?.value ?? [];
    final isLoading = businesses.isEmpty || asyncBusinesses.isLoading;
    final error = asyncBusinesses.asError;

    if (error != null) {
      return Center(child: Text('Error: $error'));
    }

    final business = businesses.isEmpty ? null : (businesses..shuffle()).first;

    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _BusinessOfTheWeekCard(
              business: business,
              businessId: 'business-id', // Mock ID for analytics
              businessName: 'Business Name', // Mock name for analytics
            ),
          ],
        ),
      ),
    );
  }
}

class _BusinessOfTheWeekCard extends StatelessWidget {
  const _BusinessOfTheWeekCard({
    required this.business,
    required this.businessId,
    required this.businessName,
  });
  final Business? business;

  // Mock business data for analytics tracking
  final String? businessId;
  final String? businessName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Business of the week',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Business image
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BusinessImage(
                imageUrl: business?.coverImageUrl ?? '',
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      business?.name ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            size: 16,
                            color: Colors.blue.shade700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Hot',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fresh sourdough daily and \$1 drip coffee with in-app offer',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Track visit business interaction
                          AnalyticsService.trackVisitBusiness(
                            businessId: businessId ?? '',
                            businessName: businessName ?? '',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7BA7B1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Visit business'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Track add to favorites (City Picks) interaction
                          AnalyticsService.trackAddToCityPicks(
                            businessId: businessId ?? '',
                            businessName: businessName ?? '',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7BA7B1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Add to Favorites'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Sponsored label
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.info_outline, size: 12, color: Colors.grey.shade400),
                const SizedBox(width: 4),
                Text(
                  'Sponsored',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
