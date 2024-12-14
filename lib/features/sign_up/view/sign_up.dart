import 'package:b2004772/common/global_loader/global_loader.dart';
import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/widgets/button_widget.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:b2004772/features/sign_up/provider/register_notifier.dart';
import 'package:b2004772/features/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';

class SignUp extends ConsumerStatefulWidget {   //covert StatefulWidget -> ConsumerStatefulWidget
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();  //State -> ConsumerState
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;


  @override
    void initState() {
      _controller = SignUpController(ref: ref);
      // TODO: implement initState
      super.initState();
    }


  @override
  Widget build(BuildContext context) {    //ConsumerStateWidget -> ko can ref object
    final regProvider = ref.watch(registerNotifierProvider);
    //regProvider.copyWith();

    final loader = ref.watch(appLoaderProvider);    //truy cap vao provider của appLoaderProvider
    return Container(
      color: Colors.white,
      child:  SafeArea(
        child: Scaffold(

          appBar: buildAppbar(title: "Đăng kí tài khoản"),
          backgroundColor: Colors.white,

          // body kiểm tra loader, false -> SingleChildScrollView (false -> CircularProgressIndicator)
          body: loader==false?SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h,),
                //more login option message
                Center(child: text14Normal(text: "Nhập vào thông tin của bạn để đăng kí")),
                SizedBox(height: 50.h,),

                //username text box
                appTextField(text: "Username", iconName: "assets/icons/user.png", hintText: "Nhâp vào tên đăng nhập của bạn", obscureText: false,
                    func: (value){
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onUserNameChange(value);
                    }
                ),
                SizedBox(height: 20.h,),

                //email text box
                appTextField(text: "Email", iconName: "assets/icons/user.png", hintText: "Nhâp vào email của bạn", obscureText: false,
                    func: (value){
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onUserEmailChange(value);
                    }
                ),
                SizedBox(height: 20.h,),

                //passwd text box
                appTextField(text: "Password", iconName: "assets/icons/lock.png", hintText: "Nhập vào password của bạn", obscureText: true,
                    func: (value){
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onUserPasswordChange(value);
                    }
                ),
                SizedBox(height: 20.h,),
                //confirm passwd text box
                appTextField(text: "Confirm Password", iconName: "assets/icons/lock.png", hintText: "Nhập lại password của bạn", obscureText: true,
                    func: (value){
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onUserRePasswordChange(value);
                    }

                ),
                SizedBox(height: 20.h,),

                //quen mật khẩu
                Container(
                    margin: EdgeInsets.only(top: 5.h, left: 25.w, right: 25.w),
                    child: text14Normal(text: "Mỗi Email chỉ được đăng kí duy nhất một lần và mật khẩu cho tài khoản phải chứa ít nhất 6 kí tự."),
                ),

                SizedBox(height: 100.h,
                  child: Container(
                    // color: Colors.red,
                  ),),



                //app register button
                Center(child: appButton(
                  buttonName: "Đăng kí",
                  isLogin: true,
                  context: context,
                  func: (){
                    // Navigator.pushNamed(
                    //     context,
                    //     "/signIn",
                    // );
                    _controller.handleSignUp();
                  }
                )),







              ],
                    ),
          )
              :const Center(child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                color: AppColors.primaryText,
          ),)
        ),
      ),
    );
  }
}
