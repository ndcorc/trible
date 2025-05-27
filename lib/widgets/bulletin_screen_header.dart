import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletinScreenHeader extends StatelessWidget {
  const BulletinScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          decoration: const BoxDecoration(color: Color(0xFF7BA7B1)),
          child: Center(
            child: Text(
              'Local Spotlights',
              style: GoogleFonts.notoSerif(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
