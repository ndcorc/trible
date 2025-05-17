import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/models/promotion.dart';
import 'package:trible/providers/businesses.dart';
import 'package:trible/providers/promotions.dart';

class PromotionScreen extends HookConsumerWidget {
  const PromotionScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPromotion = ref.watch(promotionProvider(id));

    return asyncPromotion.when(
      data:
          (Promotion promotion) => Scaffold(
            body: Stack(
              children: [
                // Background image (full height)
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child:
                      promotion.business?.coverImageUrl != null
                          ? CachedNetworkImage(
                            imageUrl: promotion.business?.coverImageUrl ?? "",
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) => Container(
                                  color: Colors.grey[300],
                                  child: Icon(Icons.error),
                                ),
                          )
                          : Container(color: Colors.grey[300]),
                ),

                // Top navigation buttons
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black54,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),

                        // Shopping bag with plus button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.teal,
                            ),
                            onPressed: () {
                              // Add shopping functionality
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Draggable bottom sheet for promotion details
                DraggableScrollableSheet(
                  initialChildSize: 0.55, // Start at half the screen
                  minChildSize: 0.55, // Minimum height (40% of screen)
                  maxChildSize: 0.9, // Maximum height (90% of screen)
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Handle indicator
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          // Scrollable content
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                controller: scrollController,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                children: [
                                  // Business section with logo
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        // Business logo
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              promotion.business?.logoUrl !=
                                                      null
                                                  ? NetworkImage(
                                                    promotion
                                                            .business
                                                            ?.logoUrl ??
                                                        "",
                                                  )
                                                  : null,
                                          backgroundColor: Colors.grey[200],
                                          child:
                                              promotion.business?.logoUrl ==
                                                      null
                                                  ? Text(
                                                    promotion.business?.name
                                                            ?.substring(0, 1) ??
                                                        'B',
                                                  )
                                                  : null,
                                        ),
                                        const SizedBox(width: 16),

                                        // Business name and tagline
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                promotion.business?.name ??
                                                    'Business Name',
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                promotion.business?.tagline ??
                                                    'The wood is good.',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Divider(height: 40),

                                  // Promotion title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          promotion.title,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        // Promotion description
                                        Text(
                                          promotion.description ??
                                              'Now until May 1st, you can use this offer via the Woodchuck Delivery site.',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(height: 16),

                                        const Text(
                                          'Redeem to receive the code!',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        const SizedBox(height: 60),
                                      ],
                                    ),
                                  ), // Space for button
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // Fixed redeem button at the bottom
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 48,
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle redemption
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Redeem offer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error:
          (error, stack) =>
              Scaffold(body: Center(child: Text('Error: $error'))),
    );
  }
}
