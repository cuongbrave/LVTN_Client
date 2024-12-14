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
    apiKey: 'AIzaSyDWz8bVFsqmmWDjpKAtGa24AGDiLWq_wn8',
    appId: '1:1001272516989:web:7a0a07eb5817590ab56c14',
    messagingSenderId: '1001272516989',
    projectId: 'ctuhoot-app',
    authDomain: 'ctuhoot-app.firebaseapp.com',
    storageBucket: 'ctuhoot-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACIn_l1SD7OoBnRXJO6TfXs6KZFd3RFEI',
    appId: '1:1001272516989:android:e479e1acbd345e73b56c14',
    messagingSenderId: '1001272516989',
    projectId: 'ctuhoot-app',
    storageBucket: 'ctuhoot-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOUoIBbyojPZQpMa0cf52hUJsxymUksfk',
    appId: '1:1001272516989:ios:5d1c1b43c561746cb56c14',
    messagingSenderId: '1001272516989',
    projectId: 'ctuhoot-app',
    storageBucket: 'ctuhoot-app.appspot.com',
    iosBundleId: 'com.example.b2004772',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOUoIBbyojPZQpMa0cf52hUJsxymUksfk',
    appId: '1:1001272516989:ios:5d1c1b43c561746cb56c14',
    messagingSenderId: '1001272516989',
    projectId: 'ctuhoot-app',
    storageBucket: 'ctuhoot-app.appspot.com',
    iosBundleId: 'com.example.b2004772',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDWz8bVFsqmmWDjpKAtGa24AGDiLWq_wn8',
    appId: '1:1001272516989:web:a8cbc27e72f96cd5b56c14',
    messagingSenderId: '1001272516989',
    projectId: 'ctuhoot-app',
    authDomain: 'ctuhoot-app.firebaseapp.com',
    storageBucket: 'ctuhoot-app.appspot.com',
  );

}