import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trible/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
          extensions: const [SkeletonizerConfigData()],
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
          extensions: const [SkeletonizerConfigData.dark()],
        ),
      ),
    ),
  );
}
