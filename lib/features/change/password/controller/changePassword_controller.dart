import 'package:b2004772/common/widgets/popup_messages.dart';
import 'package:b2004772/features/change/password/provider/changePassword_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordController {
  final WidgetRef ref;
  ChangePasswordController({
    required this.ref,
  });

  handleChangePassword() async {
    var state =
        ref.read(changePasswordNotifierProvider); // Chuyển từ watch sang read
    String currentPassword = state.currentPassword;
    print("Value of currentPassword in handleChangePassword: $currentPassword");
    String newPassword = state.newPassword;
    String reNewPassword = state.reNewPassword;
    if (currentPassword.isEmpty) {
      toastInFo("Nhap lai password ban dang su dung, di");
      print("gia tri: $currentPassword");
      return;
    }
    if (newPassword.isEmpty) {
      toastInFo("Nhap vao mat password moi");
      return;
    }
    if (newPassword != reNewPassword) {
      toastInFo("Mat khau ban nhap khau khop, nhap lai");
      return;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        //xac thuc lai ng dung voi nhap lai currenPassword
        AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!, password: currentPassword);

        await user.reauthenticateWithCredential(credential);
        toastInFo("Password has been updated successfully.");

        //Cap nhap newPassword
        await user.updatePassword(newPassword);
      } else {
        toastInFo("Xac thuc khong thanh cong, cap nhap mat khau that bai.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInFo("Mật khẩu mới quá yếu. Vui lòng thử lại.");
      } else if (e.code == 'requires-recent-login') {
        toastInFo("Người dùng cần đăng nhập lại để thực hiện thao tác này.");
      } else if (e.code == 'wrong-password') {
        toastInFo("Mật khẩu hiện tại không chính xác. Vui lòng thử lại.");
      } else {
        toastInFo("Có lỗi xảy ra: ${e.message}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Unexpected error: $e");
      }
    }
  }
}
