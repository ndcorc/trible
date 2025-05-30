// lib/screens/profile/widgets/loyalty_program_item.dart
import 'package:flutter/material.dart';

class LoyaltyProgramItem extends StatelessWidget {
  const LoyaltyProgramItem({
    super.key,
    required this.program,
    required this.onTap,
  });

  final dynamic program; // LoyaltyProgram type
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
        child: const Icon(Icons.local_offer, color: Color(0xFF7BA7B1)),
      ),
      title: Text(
        program.businessName,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        program.description,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.zero,
    );
  }
}
