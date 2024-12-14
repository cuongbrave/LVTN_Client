// import 'package:b2004772/features/change/password/provider/changePassword_state.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'changePassword_notifier.g.dart';

// @riverpod
// class ChangePasswordNotifier extends _$ChangePasswordNotifier{
//   @override
//   ChangePasswordState build(){
//     return ChangePasswordState();
//   }
//   void onCurrentPasswordChange(String currentPass) {
//     print("Updating currentPassword: $currentPass");
//     state = state.copyWith(currentPassword: currentPass);
//   }

//   void onNewPasswordChange(String newPass){
//     state = state.copyWith(newPassword: newPass);
//   }
//   void onReNewPasswordChange(String reNewPass){
//     state = state.copyWith(reNewPassword: reNewPass);
//   }

// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordState {
  final String currentPassword;
  final String newPassword;
  final String reNewPassword;

  ChangePasswordState({
    this.currentPassword = '',
    this.newPassword = '',
    this.reNewPassword = '',
  });

  ChangePasswordState copyWith({
    String? currentPassword,
    String? newPassword,
    String? reNewPassword,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      reNewPassword: reNewPassword ?? this.reNewPassword,
    );
  }
}

class ChangePasswordNotifier extends StateNotifier<ChangePasswordState> {
  ChangePasswordNotifier() : super(ChangePasswordState());

  void updateCurrentPassword(String currentPassword) {
    state = state.copyWith(currentPassword: currentPassword);
    print("Updating currentPassword: $currentPassword");
  }

  void updateNewPassword(String newPassword) {
    state = state.copyWith(newPassword: newPassword);
  }

  void updateReNewPassword(String reNewPassword) {
    state = state.copyWith(reNewPassword: reNewPassword);
  }
}

final changePasswordNotifierProvider =
    StateNotifierProvider<ChangePasswordNotifier, ChangePasswordState>(
        (ref) => ChangePasswordNotifier());
