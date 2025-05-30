import 'package:flutter/material.dart';
import 'package:trible/screens/profile/widgets/membership_arc_painter.dart';

class MembershipStatus extends StatelessWidget {
  const MembershipStatus({super.key, required this.membershipLevel});

  final String membershipLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Arc
        SizedBox(
          width: 120,
          height: 60,
          child: CustomPaint(
            painter: MembershipArcPainter(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  membershipLevel,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7BA7B1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
