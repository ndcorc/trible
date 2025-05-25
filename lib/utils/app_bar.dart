import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HideAppBarWrapper extends InheritedWidget {
  final bool hideAppBar;

  const HideAppBarWrapper({
    super.key,
    required this.hideAppBar,
    required super.child,
  });

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
                        const Icon(
                          Icons.people,
                          color: Color(0xFFF3C154),
                          size: 38,
                        ),
                        Text(
                          'Trible',
                          style: GoogleFonts.gabriela(
                            textStyle: const TextStyle(
                              color: Color(0xFF7BA7B1),
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
