import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HideAppBarWrapper extends InheritedWidget {
  final bool hideAppBar;

  const HideAppBarWrapper({
    Key? key,
    required this.hideAppBar,
    required Widget child,
  }) : super(key: key, child: child);

  static bool shouldHideAppBar(BuildContext context) {
    final wrapper =
        context.dependOnInheritedWidgetOfExactType<HideAppBarWrapper>();
    return wrapper?.hideAppBar ?? false;
  }

  @override
  bool updateShouldNotify(covariant HideAppBarWrapper oldWidget) {
    return hideAppBar != oldWidget.hideAppBar;
  }
}

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 36,
              child: Image.asset(
                'assets/trible_logo.png',
                // If you don't have this asset, replace with a placeholder icon or text
                errorBuilder:
                    (context, error, stackTrace) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.people, color: Color(0xFFF3C154), size: 38),
                        Text(
                          'Trible',
                          style: GoogleFonts.gabriela(
                            textStyle: TextStyle(
                              color: Color(0xFF7BA7B1),
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              ),
            ),
            /* const Row(
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
            ), */
          ],
        ),
      ),
    );
  }
}
