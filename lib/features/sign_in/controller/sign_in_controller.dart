import 'dart:convert';

import 'package:b2004772/common/global_loader/global_loader.dart';

import 'package:b2004772/common/utils/constants.dart';
import 'package:b2004772/features/sign_in/repo/sign_in_repo.dart';
import 'package:b2004772/global.dart';

import 'package:b2004772/features/sign_in/provider/sign_in_notifier.dart';
import 'package:b2004772/main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/models/user.dart';
import '../../../common/widgets/popup_messages.dart';

class SignInController {
  //BuildContext context;
  //WidgetRef ref;
  // SignInController({ required this.ref}); --> day la tham số tuỳ chọn được đặt tên
  SignInController(); //ko co ngoac nhon la tham so truyen theo vi tri (phải tuân thủ đúng vị trí đã đặt ra, sai ko thực thi)

  TextEditingController emaiConTroller =
      TextEditingController(); //luu giu email sau khi nhan login
  TextEditingController passwordController =
      TextEditingController(); ////luu giu pass sau khi login

  Future<void> handleSignIn(WidgetRef ref) async {
    FirebaseAuth.instance.setLanguageCode('en');
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emaiConTroller.text = email;
    passwordController.text = password;

    // print("My email is $email");
    // print("My pass is $password");

    if (state.email.isEmpty || email.isEmpty) {
      toastInFo("Nhập vào email của bạn");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInFo("Bạn chua nhap mat khau");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    print("0");

    //TRY CATCH

    try {
      final credential = await SignInRepo.firebaseSignIn(
          email, password); //-> TRA VE kieu future => await moi exist user

      if (credential.user == null) {
        toastInFo("User not found");
        return;
      }

      if (!credential.user!.emailVerified) {
        toastInFo("You must verify your email address first !");
        return;
      }
      var user = credential.user; //tra ve tu firebase

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;

        asyncPostAllData(loginRequestEntity);
        if (kDebugMode) {
          print("user logged in");
        }
      } else {
        toastInFo("login error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInFo("User not found");
      } else if (e.code == 'wrong-password') {
        toastInFo("Your password is wrong");
      } else if (e.code == 'invalid-credential') {
        toastInFo("Invalid credential");
      } else if (e.code == 'invalid-email') {
        toastInFo("Your email is invalid");
      } else if (e.code == 'user-disabled') {
        toastInFo("This user account has been disabled");
      } else if (e.code == 'network-request-failed') {
        toastInFo("Network error, please check your connection and try again.");
      } else {
        toastInFo("Authentication failed: ${e.code}");
        toastInFo(
            "Authentication error on FirebaseAuthException: ${e.message}");
      }
      print(e.code); // Log the error code for further analysis
    } catch (e) {
      toastInFo(
          "Đã xảy ra lỗi khi đăng nhập. Vui lòng thử lại sau: ${e.toString()}");
      if (kDebugMode) {
        print(e.toString());
      }
    }finally {
      // Tắt loader
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  //gửi tất cả dữ liệu đồng bộ
  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    //talk to server
    var result = await SignInRepo.login(
        params: loginRequestEntity); //thuc hien LOGIN voi my server

    if (result.code == 200) {
      //have local storage
      try {
        //ghi nho thong tin ng dung (logged) vào SharedPreferences
        Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY,
            jsonEncode(result.data)); //key for signIn type setString
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);

        navKey.currentState?.pushNamedAndRemoveUntil(
            "/application",
            (route) =>
                false); //dua tren trang thai hien tai cua navKey (context toan cuc)
        //navigator.push(MaterialPageRoute(builder: (BuildContext context)=>Scaffold(appBar: AppBar(),body: const Application(),)));
        //navigator.pushNamed("/application");
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      //redirect to new page
    } else {
      toastInFo("Login error");
    }
  }
}
