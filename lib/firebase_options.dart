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
    apiKey: 'AIzaSyDE8Co-wik3QM5JSF34N38UxS0JAQgBWPc',
    appId: '1:583785388532:web:13a413a83832b779ea41a1',
    messagingSenderId: '583785388532',
    projectId: 'colors-72c00',
    authDomain: 'colors-72c00.firebaseapp.com',
    storageBucket: 'colors-72c00.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXXepHax61UDhHD6OkIY_d9jyxg1wzDcM',
    appId: '1:583785388532:android:abcfebf9a566ceabea41a1',
    messagingSenderId: '583785388532',
    projectId: 'colors-72c00',
    storageBucket: 'colors-72c00.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDt_FZs4PUMCsPvfcPcTB1MZDKg3UpJhOM',
    appId: '1:583785388532:ios:df80d2f052214f7bea41a1',
    messagingSenderId: '583785388532',
    projectId: 'colors-72c00',
    storageBucket: 'colors-72c00.appspot.com',
    iosClientId: '583785388532-2dfo4256noamlk6l0curoque1es0nsvr.apps.googleusercontent.com',
    iosBundleId: 'com.example.colors',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDt_FZs4PUMCsPvfcPcTB1MZDKg3UpJhOM',
    appId: '1:583785388532:ios:df80d2f052214f7bea41a1',
    messagingSenderId: '583785388532',
    projectId: 'colors-72c00',
    storageBucket: 'colors-72c00.appspot.com',
    iosClientId: '583785388532-2dfo4256noamlk6l0curoque1es0nsvr.apps.googleusercontent.com',
    iosBundleId: 'com.example.colors',
  );
}
