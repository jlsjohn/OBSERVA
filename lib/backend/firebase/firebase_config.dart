import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDMuybNPREEhErRfeVKYtggKLzI-9c88QE",
            authDomain: "teste2-84cf0.firebaseapp.com",
            projectId: "teste2-84cf0",
            storageBucket: "teste2-84cf0.appspot.com",
            messagingSenderId: "829136445246",
            appId: "1:829136445246:web:dcf222910828d426a6166f",
            measurementId: "G-EG9E2ZW7K4"));
  } else {
    await Firebase.initializeApp();
  }
}
