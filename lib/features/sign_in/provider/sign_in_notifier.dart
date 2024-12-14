
import 'package:b2004772/features/sign_in/provider/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SignInNotifier mở rộng của StateNotifier với kiểu data SignInState và trả về 1 constructor
// mặc định của SignInState ==> Đây gọi là gọi hàm tạo (Constructor) và truyền dữ liệu


//* StateNotifier là 1 abstract: lớp mở rộng (tức là 1 bản thiết kế) -> phần thân phụ thuộc vào lớp con (SignInNotifier)
//*extends StateNotifier<SignInState> với SignInState được truyền vào, sau khi pass qua thì là 1 'state'
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

  void onUserEmailChange(String mail){
    state = state.copyWith(email: mail);
  }

  void onUserPasswordChange(String pass){
    state = state.copyWith(password: pass);
  }

}

final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>(
        (ref)=>SignInNotifier()
);