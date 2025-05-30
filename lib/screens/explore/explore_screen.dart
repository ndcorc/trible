// lib/screens/explore/explore_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:trible/models/business.dart';
import 'package:trible/providers/businesses.dart';
import 'package:trible/screens/explore/widgets/business_bottom_card.dart';
import 'package:trible/screens/explore/widgets/map_controls.dart';

class ExploreScreen extends HookConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState<GoogleMapController?>(null);
    final selectedBusiness = useState<Business?>(null);
    final asyncBusinesses = ref.watch(businessesProvider);

    // Georgetown, TX coordinates
    const initialPosition = LatLng(30.6332, -97.6779);

    return Scaffold(
      body: asyncBusinesses.when(
        data:
            (businesses) => Stack(
              children: [
                // Google Map
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: initialPosition,
                    zoom: 14.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController.value = controller;
                  },
                  markers: _createMarkersFromBusinesses(
                    businesses,
                    selectedBusiness,
                  ),
                  style: _mapStyle,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                ),

                // Map Controls (Search and Filter buttons)
                const MapControls(),

                // Bottom Business Card
                if (selectedBusiness.value != null)
                  BusinessBottomCard(
                    business: selectedBusiness.value!,
                    onTap:
                        () => context.push(
                          '/business/${selectedBusiness.value!.id}',
                        ),
                    onClose: () => selectedBusiness.value = null,
                  ),
              ],
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Set<Marker> _createMarkersFromBusinesses(
    List<Business> businesses,
    ValueNotifier<Business?> selectedBusiness,
  ) {
    return businesses.map((business) {
      // Convert GeoPoint to LatLng
      final position = LatLng(
        business.location.latitude,
        business.location.longitude,
      );

      return Marker(
        markerId: MarkerId(business.id),
        position: position,
        onTap: () => selectedBusiness.value = business,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
    }).toSet();
  }

  // Optional: Custom map style to match the design
  static const String _mapStyle = '''
  [
    {
      "featureType": "poi",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    }
  ]
  ''';
}
