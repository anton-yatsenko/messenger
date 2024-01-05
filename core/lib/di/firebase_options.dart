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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDqdUqgcnuu9_65DuRBdrER7D0YJpv6Xbk',
    appId: '1:544223824194:android:832027a3cb9fb1b31fe0db',
    messagingSenderId: '544223824194',
    projectId: 'messenger-21ca5',
    databaseURL: 'https://messenger-21ca5-default-rtdb.firebaseio.com',
    storageBucket: 'messenger-21ca5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjVSTOowh7hzi8KWVL1CnMRBHil6dwsGo',
    appId: '1:544223824194:ios:53510fcf060264e91fe0db',
    messagingSenderId: '544223824194',
    projectId: 'messenger-21ca5',
    databaseURL: 'https://messenger-21ca5-default-rtdb.firebaseio.com',
    storageBucket: 'messenger-21ca5.appspot.com',
    iosClientId: '544223824194-idu4iiv6qhm3rj212nl0qvejojv6jku9.apps.googleusercontent.com',
    iosBundleId: 'com.example.messenger',
  );
}
