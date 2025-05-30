// lib/screens/settings/widgets/dark_mode_toggle_item.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/router/router.dart';

class DarkModeToggleItem extends HookConsumerWidget {
  const DarkModeToggleItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: const Text(
          'Dark Mode',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Switch(
          value: isDarkMode,
          onChanged: (value) {
            ref.read(darkModeProvider.notifier).state = value;
          },
          activeColor: const Color(0xFF7BA7B1),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
