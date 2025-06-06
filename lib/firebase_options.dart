// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBPJbZb-SS_jFxyaP0TIbhmCyuz5d78wZQ',
    appId: '1:544256515378:web:cdf4aecea93110103dcb2b',
    messagingSenderId: '544256515378',
    projectId: 'trible-bfeaf',
    authDomain: 'trible-bfeaf.firebaseapp.com',
    storageBucket: 'trible-bfeaf.firebasestorage.app',
    measurementId: 'G-JEJV9VPVVS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCguo74jesv3DhVAD9GS31xkVVhytbl2mA',
    appId: '1:544256515378:android:23d21224550dbaef3dcb2b',
    messagingSenderId: '544256515378',
    projectId: 'trible-bfeaf',
    storageBucket: 'trible-bfeaf.firebasestorage.app',
    measurementId: 'G-JEJV9VPVVS',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdzmzsM96HSPYpunWKMYPe9uMzvPTteKo',
    appId: '1:544256515378:ios:320ab513fae130773dcb2b',
    messagingSenderId: '544256515378',
    projectId: 'trible-bfeaf',
    storageBucket: 'trible-bfeaf.firebasestorage.app',
    iosBundleId: 'com.app.trible',
    measurementId: 'G-JEJV9VPVVS',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdzmzsM96HSPYpunWKMYPe9uMzvPTteKo',
    appId: '1:544256515378:ios:b970014b5d98bda33dcb2b',
    messagingSenderId: '544256515378',
    projectId: 'trible-bfeaf',
    storageBucket: 'trible-bfeaf.firebasestorage.app',
    iosBundleId: 'com.example.trible',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBPJbZb-SS_jFxyaP0TIbhmCyuz5d78wZQ',
    appId: '1:544256515378:web:037d0517323e86c13dcb2b',
    messagingSenderId: '544256515378',
    projectId: 'trible-bfeaf',
    authDomain: 'trible-bfeaf.firebaseapp.com',
    storageBucket: 'trible-bfeaf.firebasestorage.app',
    measurementId: 'G-26KT92HMMZ',
  );
}
