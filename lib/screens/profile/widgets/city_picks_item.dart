import 'package:flutter/material.dart';
import 'package:trible/widgets/business_image.dart';

class CityPicksItem extends StatelessWidget {
  const CityPicksItem({
    super.key,
    required this.cityPicks,
    required this.onTap,
  });

  final dynamic cityPicks; // CityPicks type
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300],
        ),
        child: BusinessImage(
          imageUrl: cityPicks.cityImageUrl,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        cityPicks.cityName,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '${cityPicks.businessIds.length} places',
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.zero,
    );
  }
}
