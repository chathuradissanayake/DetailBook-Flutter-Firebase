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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAOKemd2wFCfBqQOLyg328SguC1xFNPawU',
    appId: '1:749652166266:web:6c4cd67a2b68fc9e3c5dc3',
    messagingSenderId: '749652166266',
    projectId: 'myapp05-firebase',
    authDomain: 'myapp05-firebase.firebaseapp.com',
    storageBucket: 'myapp05-firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9piqkvfYiXhnmY30jvzrE33ZZIHZSSzQ',
    appId: '1:749652166266:android:9cac0d975e888d713c5dc3',
    messagingSenderId: '749652166266',
    projectId: 'myapp05-firebase',
    storageBucket: 'myapp05-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyC6QBH_qnslLgcrhcLNygYnl4PwxSN58',
    appId: '1:749652166266:ios:3a369a6ead6b3f783c5dc3',
    messagingSenderId: '749652166266',
    projectId: 'myapp05-firebase',
    storageBucket: 'myapp05-firebase.appspot.com',
    iosBundleId: 'com.example.myapp05Firebase',
  );
}
