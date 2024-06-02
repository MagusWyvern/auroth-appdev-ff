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
    apiKey: 'AIzaSyD7vnkBhhn-7Gb7gw9Sl6t4v567EIjgZ4M',
    appId: '1:620190800033:web:97a1faf96ec8894ae078e0',
    messagingSenderId: '620190800033',
    projectId: 'auroth-notes',
    authDomain: 'auroth-notes.firebaseapp.com',
    storageBucket: 'auroth-notes.appspot.com',
    measurementId: 'G-GVBBNTFPK3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmnyMecKCCMOIcazW65RL0lF7YA2h3wZc',
    appId: '1:620190800033:android:e96261a0440bfe82e078e0',
    messagingSenderId: '620190800033',
    projectId: 'auroth-notes',
    storageBucket: 'auroth-notes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAmylyTS57d7g2enpdVHUmgiR5ONrI1ao',
    appId: '1:620190800033:ios:8e42a790164e5d27e078e0',
    messagingSenderId: '620190800033',
    projectId: 'auroth-notes',
    storageBucket: 'auroth-notes.appspot.com',
    iosBundleId: 'com.example.aurothNotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAmylyTS57d7g2enpdVHUmgiR5ONrI1ao',
    appId: '1:620190800033:ios:8e42a790164e5d27e078e0',
    messagingSenderId: '620190800033',
    projectId: 'auroth-notes',
    storageBucket: 'auroth-notes.appspot.com',
    iosBundleId: 'com.example.aurothNotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7vnkBhhn-7Gb7gw9Sl6t4v567EIjgZ4M',
    appId: '1:620190800033:web:526c5f72dfe3c05ee078e0',
    messagingSenderId: '620190800033',
    projectId: 'auroth-notes',
    authDomain: 'auroth-notes.firebaseapp.com',
    storageBucket: 'auroth-notes.appspot.com',
    measurementId: 'G-XQ0BQ8CV0P',
  );
}