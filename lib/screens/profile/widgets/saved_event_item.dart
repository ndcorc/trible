// lib/screens/profile/widgets/saved_event_item.dart
import 'package:flutter/material.dart';

class SavedEventItem extends StatelessWidget {
  const SavedEventItem({
    super.key,
    required this.savedEvent,
    required this.onTap,
  });

  final dynamic savedEvent; // SavedEvent type
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
        child: Icon(
          savedEvent.status == 'saved'
              ? Icons.calendar_today
              : Icons.person_outline,
          color: const Color(0xFF7BA7B1),
        ),
      ),
      title: Text(
        savedEvent.eventTitle,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        savedEvent.status == 'saved' ? 'Saved' : 'Added to Calendar',
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.zero,
    );
  }
}
