import 'dart:convert';

import 'package:b2004772/common/models/entities.dart';
import 'package:b2004772/common/services/http_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo{
  static Future<UserCredential>firebaseSignIn(String email, String password) async {   //static -> truy cap = classname
    final credential = await FirebaseAuth.instance    //tao obj credential tu FirebaseAuth voi method signInWithEmailAndPassword
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  static Future<UserLoginResponseEntity> login({LoginRequestEntity? params}) async {
    print("given info ${jsonEncode(params)}");
   var response = await HttpUtil().post(
     "api/login",
     queryParameters: params?.toJson(),

   );
   return UserLoginResponseEntity.fromJson(response);   //tra ve 1 obj UserLoginResponseEntity
  }
}