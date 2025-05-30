// lib/screens/explore/widgets/business_bottom_card.dart
import 'package:flutter/material.dart';
import 'package:trible/models/business.dart';
import 'package:trible/widgets/business_image.dart';

class BusinessBottomCard extends StatelessWidget {
  const BusinessBottomCard({
    super.key,
    required this.business,
    required this.onTap,
    required this.onClose,
  });

  final Business business;
  final VoidCallback onTap;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 100, // Above the bottom navigation
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Business Image
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BusinessImage(
                      imageUrl: business.logoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Business Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        business.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        business.address,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${business.city}, ${business.state}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            'Trible Rating: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7BA7B1),
                            ),
                          ),
                          Text(
                            '4.4', // Mock rating for now
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7BA7B1),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${business.waitlistInterestScore} Ratings',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Close button
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onClose,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
