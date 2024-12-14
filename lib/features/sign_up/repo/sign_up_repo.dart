

import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo{
  static Future<UserCredential>firebaseSignUn(String email, String password) async {   //static -> truy cap = classname
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}