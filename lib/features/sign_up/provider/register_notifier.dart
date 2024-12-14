import 'package:b2004772/features/sign_up/provider/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onUserNameChange(String name){
      state = state.copyWith(userName: name);
  }

  void onUserEmailChange(String mail){
    state = state.copyWith(email: mail);
  }

  void onUserPasswordChange(String pass){
    state = state.copyWith(password: pass);
  }

  void onUserRePasswordChange(String repass){
    state = state.copyWith(rePassword: repass);
  }

}

