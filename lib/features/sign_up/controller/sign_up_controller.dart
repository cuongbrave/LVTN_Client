import 'package:b2004772/common/global_loader/global_loader.dart';
import 'package:b2004772/common/widgets/popup_messages.dart';
import 'package:b2004772/features/sign_up/provider/register_notifier.dart';
import 'package:b2004772/features/sign_up/repo/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController(
      {required this.ref}); //ham xay dung yeu cau ref (ref tuong tu voi context)

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String pass = state.password;
    String repass = state.rePassword;
    if (state.userName.isEmpty || name.isEmpty) {
      toastInFo("Nhập vào tên của bạn");
      return; //ko thực hiện các việc tiếp theo nữa
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInFo("Tên đăng nhập dài hơn 6 kí tự");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInFo("Nhập vào email của bạn");
      return;
    }

    if (state.password.isEmpty ||
        state.rePassword.isEmpty ||
        pass.isEmpty ||
        repass.isEmpty) {
      toastInFo("Bạn chua nhap mat khau hoặc chưa nhập xac thuc mat khau");
      return;
    }

    if (state.password != state.rePassword || pass != repass) {
      toastInFo("your password dont match");
      return;
    }
    //pass hết xác thực chuyển qua thanh load tròn (CircularProgressIndicator)
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    //lấy ngữ cảnh (context hiện tai)
    var context = Navigator.of(ref
        .context); // đối tượng ref tương tự context được định nghĩa trong consumer.dart

    try {
      //xac thuc voi email voi pass
      final credential = await SignUpRepo.firebaseSignUn(email, pass);
      
      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user
            ?.sendEmailVerification(); //gui email xac thuc neu ton tai ng dung
        await credential.user?.updateDisplayName(name); //
        String photoUrl = "uploads/default.png";                    //luu trong server (set cứng)
        await credential.user?.updatePhotoURL(photoUrl);
        //get server user url
        //set user photo url

        toastInFo("Một email đã gửi tới bạn, hãy mở nó đễ xác nhận danh tính!");

        context.pop(); //back tu context now về trước đó
      }
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        toastInFo("Mật khẩu quá yếu");
      }

      if(e.code == 'email-already-in-use'){
        toastInFo("Email đã được sử dụng");
      }
      if(e.code == 'user-not-found'){
        toastInFo("Không tìm thấy người dùng");
      }
      print("lỗi của bạn là: " + e.code);


    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
