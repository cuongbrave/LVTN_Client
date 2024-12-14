import 'package:b2004772/common/widgets/popup_messages.dart';
import 'package:b2004772/features/forget/provider/forget_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgetLogic{
  final WidgetRef ref;

  ForgetLogic({
    required this.ref,
  });

  //logic reset password
  handleEmailForgot() async{
    final state = ref.read(ForgetProvider);
    String emailAddress = state.email;
    if(emailAddress.isEmpty){
      toastInFo("Email not empty!");
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      toastInFo("An email has been sent to your registered email. To activate your account, please open the link from the email.");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        toastInFo("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        toastInFo("The account already exists for that email.");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }


  }
}
