import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trible/providers/promotions.dart';
import 'package:trible/router/router.dart';
import 'package:trible/widgets/business_image.dart';

class PromotionalCards extends HookConsumerWidget {
  const PromotionalCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPromotions = ref.watch(promotionsProvider);
    final promotions = asyncPromotions.asData?.value ?? [];
    final isLoading = promotions.isEmpty || asyncPromotions.isLoading;
    final error = asyncPromotions.asError;

    if (error != null) {
      return Center(child: Text('Error: $error'));
    }

    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          itemCount: isLoading ? 4 : promotions.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder: (context, index) {
            final promotion = promotions.isEmpty ? null : promotions[index];
            return GestureDetector(
              onTap: () => context.push('/promotion/${promotion?.id ?? ''}'),
              child: PromotionalCard(
                businessName: promotion?.business?.name,
                title: promotion?.title,
                imagePath: promotion?.business?.coverImageUrl,
              ),
            );
          },
        ),
      ),
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

  final String? businessName;
  final String? title;
  final String? imagePath;

  final loadingTile = const ListTile(
    title: Text('Promotional Title'),
    subtitle: Text('Promotional Subtitle'),
  );

  @override
  Widget build(BuildContext context) {
    final isLoading =
        businessName == null || title == null || imagePath == null;

    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
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
              child: BusinessImage(
                imageUrl: imagePath ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          isLoading
              ? loadingTile
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      businessName ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(title ?? '', style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
