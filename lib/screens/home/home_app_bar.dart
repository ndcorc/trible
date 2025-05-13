import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
                child: Image.asset(
                  'assets/trible_logo.png',
                  // If you don't have this asset, replace with a placeholder icon or text
                  errorBuilder:
                      (context, error, stackTrace) => const Row(
                        children: [
                          Icon(Icons.pets, color: Color(0xFF7BA7B1), size: 20),
                          Text(
                            'Trible',
                            style: TextStyle(
                              color: Color(0xFF7BA7B1),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.location_on, color: Color(0xFF7BA7B1), size: 15),
              Text(
                'Georgetown',
                style: TextStyle(
                  color: Color(0xFF7BA7B1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF7BA7B1),
                size: 15,
              ),
              Text('78626', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
