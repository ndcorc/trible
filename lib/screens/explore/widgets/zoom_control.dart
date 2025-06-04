import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ZoomControls extends StatelessWidget {
  const ZoomControls({super.key, required this.mapController});

  final GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Zoom In Button
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(Icons.add, color: Color(0xFF7BA7B1)),
              onPressed: _zoomIn,
              padding: EdgeInsets.zero,
            ),
          ),

          // Divider
          Container(width: 24, height: 1, color: Colors.grey[300]),

          // Zoom Out Button
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(Icons.remove, color: Color(0xFF7BA7B1)),
              onPressed: _zoomOut,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  void _zoomIn() async {
    if (mapController != null) {
      final currentZoom = await mapController!.getZoomLevel();
      await mapController!.animateCamera(CameraUpdate.zoomTo(currentZoom + 1));
    }
  }

  void _zoomOut() async {
    if (mapController != null) {
      final currentZoom = await mapController!.getZoomLevel();
      await mapController!.animateCamera(CameraUpdate.zoomTo(currentZoom - 1));
    }
  }
}
