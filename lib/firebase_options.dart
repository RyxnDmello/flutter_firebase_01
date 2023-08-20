import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAjAfiYgtBX4kjGO17QbOHXEwbeUQXcOnc',
    appId: '1:447502592209:android:3daf320acc81afba2a7df0',
    messagingSenderId: '447502592209',
    projectId: 'taskflow-19b8c',
    storageBucket: 'taskflow-19b8c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAptNLye2R8c2BqFZc7FKo2l5NFwOMMt-E',
    appId: '1:447502592209:ios:e7cbd0fd0f4583f42a7df0',
    messagingSenderId: '447502592209',
    projectId: 'taskflow-19b8c',
    storageBucket: 'taskflow-19b8c.appspot.com',
    iosClientId:
        '447502592209-k8lpgcvogbrim88bgk3lfcm2hpoc2c93.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebase01',
  );
}
