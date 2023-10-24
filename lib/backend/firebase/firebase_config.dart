import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyABUKTXfjT-FxYnS0HrDobdCgd0fofh_NM",
            authDomain: "kaminapp-fcbab.firebaseapp.com",
            projectId: "kaminapp-fcbab",
            storageBucket: "kaminapp-fcbab.appspot.com",
            messagingSenderId: "825460394136",
            appId: "1:825460394136:web:246ad2183e492cdc4168ed",
            measurementId: "G-J6ER9Y1032"));
  } else {
    await Firebase.initializeApp();
  }
}
