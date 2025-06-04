// lib/screens/explore/widgets/map_controls.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trible/screens/explore/widgets/zoom_control.dart';

class MapControls extends StatelessWidget {
  const MapControls({super.key, required this.mapController});

  final GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Search/Find Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.search, color: Color(0xFF7BA7B1)),
                onPressed: () {
                  // TODO: Implement search functionality
                  _showSearchDialog(context);
                },
              ),
            ),

            const Spacer(),

            // Right side controls (Filter and Zoom)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Filter Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Color(0xFF7BA7B1)),
                    onPressed: () => _showFilterDialog(context),
                  ),
                ),

                const SizedBox(height: 12),

                // Zoom Controls
                ZoomControls(mapController: mapController),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Search Businesses'),
            content: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter business name or category...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                // TODO: Implement search logic
                Navigator.pop(context);
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement search logic
                  Navigator.pop(context);
                },
                child: const Text('Search'),
              ),
            ],
          ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Filter Businesses'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckboxListTile(
                  title: const Text('Open Now'),
                  value: false,
                  onChanged: (value) {
                    // TODO: Implement filter logic
                  },
                ),
                CheckboxListTile(
                  title: const Text('Restaurants'),
                  value: false,
                  onChanged: (value) {
                    // TODO: Implement filter logic
                  },
                ),
                CheckboxListTile(
                  title: const Text('Services'),
                  value: false,
                  onChanged: (value) {
                    // TODO: Implement filter logic
                  },
                ),
                CheckboxListTile(
                  title: const Text('Shopping'),
                  value: false,
                  onChanged: (value) {
                    // TODO: Implement filter logic
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Apply filters
                  Navigator.pop(context);
                },
                child: const Text('Apply'),
              ),
            ],
          ),
    );
  }
}
