import 'package:flutter/material.dart';
import 'package:trible/screens/profile/widgets/membership_status.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.userProfile,
    required this.onQRTap,
  });

  final dynamic userProfile; // UserProfile type
  final VoidCallback onQRTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Profile Avatar
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        userProfile.avatarUrl != null
                            ? NetworkImage(userProfile.avatarUrl)
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
                  const SizedBox(height: 12),

                  // Name
                  Text(
                    '${userProfile.firstName} ${userProfile.lastName}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Edit Profile Button
                  TextButton(
                    onPressed: () {
                      // Handle edit profile
                    },
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // QR Code Icon
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onQRTap,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7BA7B1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.qr_code,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        // Membership Status
        MembershipStatus(membershipLevel: userProfile.membershipLevel),
      ],
    );
  }
}
