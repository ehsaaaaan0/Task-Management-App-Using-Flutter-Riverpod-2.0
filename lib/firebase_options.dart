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
    apiKey: 'AIzaSyB01zdnwZos1LPujWjTxaCqd-8jUJ51-E4',
    appId: '1:763380014722:web:28bb05bfd0fb3ae91cde9b',
    messagingSenderId: '763380014722',
    projectId: 'task-managemnt-flutter',
    authDomain: 'task-managemnt-flutter.firebaseapp.com',
    storageBucket: 'task-managemnt-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPhGooOJ6gc-M1X6GoVgFOYR7ewi5kus0',
    appId: '1:763380014722:android:287d1da3f44457571cde9b',
    messagingSenderId: '763380014722',
    projectId: 'task-managemnt-flutter',
    storageBucket: 'task-managemnt-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD27t6C3REGxY6r6-7D1JqbinP5jw0JlAQ',
    appId: '1:763380014722:ios:bd8a5058c8d903c71cde9b',
    messagingSenderId: '763380014722',
    projectId: 'task-managemnt-flutter',
    storageBucket: 'task-managemnt-flutter.appspot.com',
    iosBundleId: 'com.example.taskManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD27t6C3REGxY6r6-7D1JqbinP5jw0JlAQ',
    appId: '1:763380014722:ios:bd8a5058c8d903c71cde9b',
    messagingSenderId: '763380014722',
    projectId: 'task-managemnt-flutter',
    storageBucket: 'task-managemnt-flutter.appspot.com',
    iosBundleId: 'com.example.taskManagement',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB01zdnwZos1LPujWjTxaCqd-8jUJ51-E4',
    appId: '1:763380014722:web:30842be25d2094cc1cde9b',
    messagingSenderId: '763380014722',
    projectId: 'task-managemnt-flutter',
    authDomain: 'task-managemnt-flutter.firebaseapp.com',
    storageBucket: 'task-managemnt-flutter.appspot.com',
  );
}
