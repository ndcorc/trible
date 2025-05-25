import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trible/providers/business_categories.dart';
import 'package:trible/widgets/business_image.dart';

class DiscoverLocalSection extends HookConsumerWidget {
  const DiscoverLocalSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategories = ref.watch(businessCategoriesProvider);
    final categories = asyncCategories.asData?.value ?? [];
    final isLoading = categories.isEmpty || asyncCategories.isLoading;
    final error = asyncCategories.asError;

    if (error != null) {
      return Center(child: Text('Error: $error'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Text(
                'Discover Local ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7BA7B1),
                ),
              ),
              Icon(Icons.star, color: Color(0xFF7BA7B1)),
            ],
          ),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: isLoading ? 9 : categories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              final category = categories.isEmpty ? null : categories[index];
              return CategoryCard(
                title: category?.name,
                //distance: category.distance,
                imagePath: category?.imageUrl,
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'There will be more to explore soon!',
              style: TextStyle(
                color: Color(0xFF7BA7B1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Center(
          child: Text(
            '© Trible 2025',
            style: TextStyle(color: Color(0xFF7BA7B1), fontSize: 12),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.title,
    //required this.distance,
    required this.imagePath,
  });

  final String? title;
  //final String distance;
  final String? imagePath;

  final loadingTile = const ListTile(title: Text('Promotional Title'));

  @override
  Widget build(BuildContext context) {
    final isLoading = title == null || imagePath == null;

    return Card(
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                // Use BusinessImage widget to handle both network and asset images
                child: BusinessImage(
                  imageUrl: imagePath ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          isLoading
              ? loadingTile
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
