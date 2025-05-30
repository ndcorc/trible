// lib/screens/profile/widgets/contribution_item.dart
import 'package:flutter/material.dart';

class ContributionItem extends StatelessWidget {
  const ContributionItem({
    super.key,
    required this.contribution,
    required this.onTap,
  });

  final dynamic contribution; // UserContribution type
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          children: [
            const TextSpan(text: 'Submitted: "'),
            TextSpan(
              text: contribution.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const TextSpan(text: '"\n'),
            TextSpan(
              text: contribution.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.zero,
    );
  }
}
