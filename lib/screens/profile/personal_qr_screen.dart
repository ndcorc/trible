// lib/screens/profile/personal_qr_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/providers/user_profile.dart';

class PersonalQRScreen extends HookConsumerWidget {
  const PersonalQRScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserProfile = ref.watch(userProfileNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: asyncUserProfile.when(
          data:
              (userProfile) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Profile Section
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  // Profile Avatar
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        userProfile.avatarUrl != null
                                            ? NetworkImage(
                                              userProfile.avatarUrl!,
                                            )
                                            : null,
                                    backgroundColor: Colors.grey[300],
                                    child:
                                        userProfile.avatarUrl == null
                                            ? Text(
                                              '${userProfile.firstName[0]}${userProfile.lastName[0]}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                            : null,
                                  ),
                                  const SizedBox(height: 16),

                                  // Name
                                  Text(
                                    '${userProfile.firstName} ${userProfile.lastName}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // QR Code Section
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // QR Code
                                    Container(
                                      width: 175,
                                      height: 175,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.qr_code,
                                          size: 150,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20),

                                    // Instructions
                                    const Text(
                                      'Scan at checkout to\nearn rewards',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // City Skyline and User Info
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xFF7BA7B1),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // City Skyline
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Image.asset(
                                      'assets/images/city_skyline.png',
                                      fit: BoxFit.fitWidth,
                                      width: double.infinity,
                                    ),
                                  ),

                                  // User Info
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${userProfile.firstName} ${userProfile.lastName}',
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          userProfile.membershipLevel,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}

class _CitySkylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(
            0xFF5A8A96,
          ) // Slightly darker shade for buildings
          ..style = PaintingStyle.fill;

    final buildings = [
      // Building 1
      Rect.fromLTWH(0, size.height * 0.3, size.width * 0.08, size.height * 0.7),
      // Building 2
      Rect.fromLTWH(
        size.width * 0.12,
        size.height * 0.4,
        size.width * 0.06,
        size.height * 0.6,
      ),
      // Building 3
      Rect.fromLTWH(
        size.width * 0.22,
        size.height * 0.2,
        size.width * 0.08,
        size.height * 0.8,
      ),
      // Building 4
      Rect.fromLTWH(
        size.width * 0.34,
        size.height * 0.35,
        size.width * 0.07,
        size.height * 0.65,
      ),
      // Building 5 (tallest)
      Rect.fromLTWH(
        size.width * 0.45,
        size.height * 0.1,
        size.width * 0.1,
        size.height * 0.9,
      ),
      // Building 6
      Rect.fromLTWH(
        size.width * 0.58,
        size.height * 0.25,
        size.width * 0.08,
        size.height * 0.75,
      ),
      // Building 7
      Rect.fromLTWH(
        size.width * 0.7,
        size.height * 0.4,
        size.width * 0.06,
        size.height * 0.6,
      ),
      // Building 8
      Rect.fromLTWH(
        size.width * 0.8,
        size.height * 0.2,
        size.width * 0.08,
        size.height * 0.8,
      ),
      // Building 9
      Rect.fromLTWH(
        size.width * 0.92,
        size.height * 0.35,
        size.width * 0.08,
        size.height * 0.65,
      ),
    ];

    // Draw buildings
    for (final building in buildings) {
      canvas.drawRect(building, paint);

      // Add windows to some buildings
      final windowPaint =
          Paint()
            ..color = const Color(0xFF7BA7B1) // Original color for windows
            ..style = PaintingStyle.fill;

      // Add a few windows to each building
      final windowWidth = building.width * 0.15;
      final windowHeight = building.height * 0.08;

      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 2; j++) {
          final windowX =
              building.left + (j + 1) * building.width / 3 - windowWidth / 2;
          final windowY =
              building.top + (i + 1) * building.height / 4 - windowHeight / 2;

          canvas.drawRect(
            Rect.fromLTWH(windowX, windowY, windowWidth, windowHeight),
            windowPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
