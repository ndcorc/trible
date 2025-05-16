import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/providers/business_categories.dart';

class DiscoverLocalSection extends HookConsumerWidget {
  const DiscoverLocalSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategories = ref.watch(businessCategoriesProvider);

    return asyncCategories.when(
      data:
          (categories) => Column(
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
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                children:
                    categories
                        .map(
                          (category) => CategoryCard(
                            title: category.title,
                            distance: category.distance,
                            imagePath: category.imageUrl,
                          ),
                        )
                        .toList(),
              ),
              const Padding(
                padding: const EdgeInsets.all(16.0),
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
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.distance,
    required this.imagePath,
  });

  final String title;
  final String distance;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  distance,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
