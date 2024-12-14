import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/features/forget/controller/forget_logic.dart';
import 'package:b2004772/features/forget/provider/forget_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Forget extends ConsumerStatefulWidget {
  const Forget({super.key});

  @override
  ConsumerState<Forget> createState() => _ForgetState();
}

class _ForgetState extends ConsumerState<Forget> {
  late ForgetLogic forgetLogic;

  @override
  void initState() {
    super.initState();
    forgetLogic = ForgetLogic(ref: ref);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
              appBar: _buildAppBar(),
              backgroundColor: Colors.white,
              body: CustomScrollView(slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.w,
                    horizontal: 15.w,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 0.h,top: 0.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildEmailInput(ref),
                          _buildLoginBtn(forgetLogic),
                        ],),),
                  ),
                ),
              ]),
            )));
  }
}

AppBar _buildAppBar() {
  return AppBar(
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: AppColors.primarySecondaryBackground,
            height: 1.0,
          )),
      title: Text(
        "Quên mật khẩu",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ));
}

Widget _buildEmailInput(WidgetRef ref) { //tham so ref
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 0.h, top: 100.h),
    padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
    decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          padding: EdgeInsets.only(left: 0.w, top: 0.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset("assets/icons/user.png"),
        ),
        Container(
          width: 280.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: "Nhập vào Email của bạn",
              contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
            onChanged: (value) {
              ref.read(ForgetProvider.notifier).onEmailChanged(EmailChanged(value));
            },
            maxLines: 1,
            autocorrect: false, //
            obscureText: false, //
          ),
        )
      ],
    ),
  );
}

Widget _buildLoginBtn(ForgetLogic forgetLogic) {
  return GestureDetector(
      child: Container(
          width: 325.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 60.h, left: 0.w, right: 0.w),
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Center(
              child: Text(
                "Chấp nhận",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryBackground,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.sp,
                ),
              ))),
      onTap: () {
        forgetLogic.handleEmailForgot();
      });
}


