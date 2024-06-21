import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

///

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
    apiKey: 'AIzaSyByo5tXixCGXelsCc3cnITj6q3CSPTlK44',
    appId: '1:657745091009:web:7cca86d7b10aa749af7740',
    messagingSenderId: '657745091009',
    projectId: 'data-timeco-12',
    authDomain: 'data-timeco-12.firebaseapp.com',
    storageBucket: 'data-timeco-12.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD61gDO3mS5HIxu15_k06TJbgTCvD9QkvE',
    appId: '1:657745091009:android:3a9b1b370a96559daf7740',
    messagingSenderId: '657745091009',
    projectId: 'data-timeco-12',
    storageBucket: 'data-timeco-12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoeaiXOaB00Go_U_GmD_IoA9hA0cagFkE',
    appId: '1:657745091009:ios:c6d184934b00a6d8af7740',
    messagingSenderId: '657745091009',
    projectId: 'data-timeco-12',
    storageBucket: 'data-timeco-12.appspot.com',
    iosBundleId: 'com.timaco.projeto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBoeaiXOaB00Go_U_GmD_IoA9hA0cagFkE',
    appId: '1:657745091009:ios:c6d184934b00a6d8af7740',
    messagingSenderId: '657745091009',
    projectId: 'data-timeco-12',
    storageBucket: 'data-timeco-12.appspot.com',
    iosBundleId: 'com.timaco.projeto',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyByo5tXixCGXelsCc3cnITj6q3CSPTlK44',
    appId: '1:657745091009:web:29daba2cbb0612deaf7740',
    messagingSenderId: '657745091009',
    projectId: 'data-timeco-12',
    authDomain: 'data-timeco-12.firebaseapp.com',
    storageBucket: 'data-timeco-12.appspot.com',
  );
}
