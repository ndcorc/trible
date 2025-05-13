import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/utils/router.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(useMaterial3: true),
      ),
    ),
  );
}
