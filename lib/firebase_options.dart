// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC8pGK1nhmXOX9NEMcDrs2TVEnOqtqfPns',
    appId: '1:1019993706665:web:92fc648140876a364799b8',
    messagingSenderId: '1019993706665',
    projectId: 'secrtaria-app',
    authDomain: 'secrtaria-app.firebaseapp.com',
    storageBucket: 'secrtaria-app.appspot.com',
    measurementId: 'G-8ER0N90DT8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBncT9PEvDj117k-uBiyOHo5WVyIAmZXhw',
    appId: '1:1019993706665:android:0e54bdb68aca436a4799b8',
    messagingSenderId: '1019993706665',
    projectId: 'secrtaria-app',
    storageBucket: 'secrtaria-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZiNwBPtzvlt8KqCjdesTpGAcydtek9sI',
    appId: '1:1019993706665:ios:1cdc579b0cd10f594799b8',
    messagingSenderId: '1019993706665',
    projectId: 'secrtaria-app',
    storageBucket: 'secrtaria-app.appspot.com',
    iosClientId: '1019993706665-usjl66c7qhobc02iq9klspu4326pssbm.apps.googleusercontent.com',
    iosBundleId: 'com.example.secrtaria',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZiNwBPtzvlt8KqCjdesTpGAcydtek9sI',
    appId: '1:1019993706665:ios:1cdc579b0cd10f594799b8',
    messagingSenderId: '1019993706665',
    projectId: 'secrtaria-app',
    storageBucket: 'secrtaria-app.appspot.com',
    iosClientId: '1019993706665-usjl66c7qhobc02iq9klspu4326pssbm.apps.googleusercontent.com',
    iosBundleId: 'com.example.secrtaria',
  );
}