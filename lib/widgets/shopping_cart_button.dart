import 'package:flutter/material.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Shopping bag with plus button
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(Icons.shopping_bag_outlined, color: Colors.teal.shade800),
        onPressed: () {
          // Add shopping functionality
        },
      ),
    );
  }
}
