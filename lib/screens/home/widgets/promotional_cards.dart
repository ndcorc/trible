import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/providers/promotions.dart';
import 'package:trible/widgets/business_image.dart';

class PromotionalCards extends HookConsumerWidget {
  const PromotionalCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPromotions = ref.watch(promotionsProvider);

    return asyncPromotions.when(
      data: (promotions) {
        return Container(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children:
                promotions.map((promotion) {
                  return GestureDetector(
                    onTap: () => context.push('/promotion/${promotion.id}'),
                    child: PromotionalCard(
                      businessName: promotion.business?.name ?? '',
                      title: promotion.title,
                      imagePath: promotion.business?.coverImageUrl ?? "",
                    ),
                  );
                }).toList(),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}

class PromotionalCard extends StatelessWidget {
  const PromotionalCard({
    super.key,
    required this.businessName,
    required this.title,
    required this.imagePath,
  });

  final String businessName;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: BusinessImage(imageUrl: imagePath, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  businessName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
