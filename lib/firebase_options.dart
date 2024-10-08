// File generated by FlutterFire CLI.
// gnore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBdKvd1rIeopKfIw3BbvqU2Lt9cZ0t_Cgg',
    appId: '1:919016974306:web:e3b0a589fc56d5c3bdfbbb',
    messagingSenderId: '919016974306',
    projectId: 'hostel-8e4fa',
    authDomain: 'hostel-8e4fa.firebaseapp.com',
    storageBucket: 'hostel-8e4fa.appspot.com',
    measurementId: 'G-4N4VHX3TR1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlzZ00lcNTA3ZfIx5AoVMWuCUlipkQjMY',
    appId: '1:919016974306:android:a8ac397f8859cf43bdfbbb',
    messagingSenderId: '919016974306',
    projectId: 'hostel-8e4fa',
    storageBucket: 'hostel-8e4fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBAN0_1xb2P7UIza70qE8axG-bRpI8VQo',
    appId: '1:919016974306:ios:493310002b1f1410bdfbbb',
    messagingSenderId: '919016974306',
    projectId: 'hostel-8e4fa',
    storageBucket: 'hostel-8e4fa.appspot.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBAN0_1xb2P7UIza70qE8axG-bRpI8VQo',
    appId: '1:919016974306:ios:b3c0be32a1ac7820bdfbbb',
    messagingSenderId: '919016974306',
    projectId: 'hostel-8e4fa',
    storageBucket: 'hostel-8e4fa.appspot.com',
    iosBundleId: 'com.example.project.RunnerTests',
  );
}
