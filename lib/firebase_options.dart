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
    apiKey: 'AIzaSyC0Qo-0WMZqQWZpVLYPDUMHJKIgdbzKBQQ',
    appId: '1:945226954515:web:7e9c0827d742d1cc260ce6',
    messagingSenderId: '945226954515',
    projectId: 'movie-night-a',
    authDomain: 'movie-night-a.firebaseapp.com',
    storageBucket: 'movie-night-a.appspot.com',
    measurementId: 'G-9DD2R2L8D4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXUrqJrz2sNaEtFORCW5ofYGWnrmlqSvk',
    appId: '1:945226954515:android:ea52b95dbc313ba9260ce6',
    messagingSenderId: '945226954515',
    projectId: 'movie-night-a',
    storageBucket: 'movie-night-a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4T9cNnVKoHJU2ma5_W0TVFa7Zwnq60TI',
    appId: '1:945226954515:ios:b8490d5d635a30c4260ce6',
    messagingSenderId: '945226954515',
    projectId: 'movie-night-a',
    storageBucket: 'movie-night-a.appspot.com',
    iosClientId: '945226954515-gfv07q63mfbfk99g8ej9mo5fu2nd3q07.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieNight',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4T9cNnVKoHJU2ma5_W0TVFa7Zwnq60TI',
    appId: '1:945226954515:ios:418e17d2f8a3fe79260ce6',
    messagingSenderId: '945226954515',
    projectId: 'movie-night-a',
    storageBucket: 'movie-night-a.appspot.com',
    iosClientId: '945226954515-5rnhflpfg220kd8osstk0qj102telg0l.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieNight.RunnerTests',
  );
}
