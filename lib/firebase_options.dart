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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5ZAu5Jd2mgqaahu5uwX5diRHVSWsi7EQ',
    appId: '1:76984451698:android:193d3b87d301203f3c78eb',
    messagingSenderId: '76984451698',
    projectId: 'dietappandroid-ec549',
    databaseURL: 'https://dietappandroid-ec549-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'dietappandroid-ec549.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCibQDxJRDPVju7BJYpw5BzF7b9UvL6Es',
    appId: '1:76984451698:ios:d4c7781a79b515133c78eb',
    messagingSenderId: '76984451698',
    projectId: 'dietappandroid-ec549',
    databaseURL: 'https://dietappandroid-ec549-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'dietappandroid-ec549.appspot.com',
    iosClientId: '76984451698-98ejeln5hcgu8j6fh0hsd59is32d00c7.apps.googleusercontent.com',
    iosBundleId: 'com.example.dietapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCibQDxJRDPVju7BJYpw5BzF7b9UvL6Es',
    appId: '1:76984451698:ios:d4c7781a79b515133c78eb',
    messagingSenderId: '76984451698',
    projectId: 'dietappandroid-ec549',
    databaseURL: 'https://dietappandroid-ec549-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'dietappandroid-ec549.appspot.com',
    iosClientId: '76984451698-98ejeln5hcgu8j6fh0hsd59is32d00c7.apps.googleusercontent.com',
    iosBundleId: 'com.example.dietapp',
  );
}
