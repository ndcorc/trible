import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trible/router/router.dart';
import 'package:trible/screens/home/widgets/category_tabs.dart';
import 'package:trible/widgets/app_search_bar.dart';

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
  const AppBar({super.key, required this.appRoute});

  final AppRoute appRoute;

  @override
  Size get preferredSize {
    double additionalHeight = appRoute.showSearchBar ? 70.0 : 0;
    additionalHeight += appRoute.extra != null ? 70.0 : 0;
    return Size.fromHeight(kToolbarHeight + additionalHeight);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
            if (appRoute.showSearchBar)
              AppSearchBar(zipCodeEnabled: appRoute.showZipCode),
            if (appRoute.extra != null) appRoute.extra!,
          ],
        ),
      ),
    );
  }
}
