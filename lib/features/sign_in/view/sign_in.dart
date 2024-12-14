import 'package:b2004772/common/global_loader/global_loader.dart';
import 'package:b2004772/common/routes/app_routes_name.dart';
import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/widgets/button_widget.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:b2004772/features/sign_in/provider/sign_in_notifier.dart';
// import 'package:b2004772/features/sign_in/notifier/sign_in_notifier.dart';
import 'package:b2004772/features/sign_in/controller/sign_in_controller.dart';
import 'package:b2004772/features/sign_in/view/widgets/sign_in_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    // rebuild ?
    // TODO: implement didChangeDependencies
    _controller = SignInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    //loader
    final loader = ref.watch(appLoaderProvider); //value mac đinh là false
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(title: "Đăng nhập"),
            backgroundColor: Colors.white,
            body: loader == false
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //top login buttons
                        thirdPartyLogin(),
                        //more login option message
                        Center(
                            child: text14Normal(
                                text: "Sử dụng tài khoản Email đã đăng kí để đăng nhập")),
                        SizedBox(
                          height: 50.h,
                        ),
                        //email text box
                        appTextField(
                          textController: _controller.emaiConTroller,
                          text: "Email",
                          iconName: "assets/icons/user.png",
                          hintText: "Nhâp vào email của bạn",
                          obscureText: false,
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserEmailChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //passwd text box
                        appTextField(
                          textController: _controller.passwordController,
                          text: "Password",
                          iconName: "assets/icons/lock.png",
                          hintText: "Nhập vào password của bạn",
                          obscureText: true,
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserPasswordChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //quen mật khẩu
                        Container(
                          width: 260.w,
                          height: 44.h,
                          padding: EdgeInsets.only(left: 28.w),
                          child: GestureDetector(
                              child: Text(
                                "Quên mật khẩu?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(AppRoutesNames.FORGET);
                              }),
                        ),

                        SizedBox(
                          height: 100.h,
                          child: Container(
                              // color: Colors.red,
                              ),
                        ),

                        //app login button
                        Center(
                            child: appButton(
                                buttonName: "Đăng nhập",
                                context: context,
                                func: () {
                                  _controller.handleSignIn(ref);
                                })),
                        SizedBox(
                          height: 20.h,
                          child: Container(
                              // color: AppColors.primaryFourElementText,
                              ),
                        ),

                        //app register button
                        Center(
                            child: appButton(
                                buttonName: "Đăng kí",
                                isLogin: false,
                                context: context,
                                func: () {
                                  //print("hello");
                                  Navigator.pushNamed(context, "/register");
                                })),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      color: AppColors.primaryText,
                    ),
                  )),
      ),
    );

  }
}
