import 'package:b2004772/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:b2004772/features/change/password/provider/changePassword_notifier.dart';
import 'package:b2004772/features/change/password/controller/changePassword_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({super.key});

  @override
  ConsumerState<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  late ChangePasswordController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ChangePasswordController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Change Password")),
          backgroundColor: Colors.white,

          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.w,
                  horizontal: 15.w,
                ),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildCurrentPassInput(ref,
                            hintText: "Nhap vao mat khau hien tai"),
                        _buildNewPassInput(ref,
                            hintText: "Nhap vao mat khau moi"),
                        _buildReNewPassInput(ref,
                            hintText: "Nhap lai mat khau moi cua ban"),
                        ElevatedButton(
                          onPressed: () {
                            _controller.handleChangePassword();
                          },
                          child: const Text("Change Password"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPassInput(WidgetRef ref, {required String hintText}) {
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
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            padding: EdgeInsets.only(left: 0.w, top: 0.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/lock.png"),
          ),
          Container(
            width: 280.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) {
                ref
                    .read(changePasswordNotifierProvider.notifier)
                    .updateCurrentPassword(value);
                print("onChanged called with value: $value");
              },
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),

              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
              maxLines: 1,
              autocorrect: false, //
              obscureText: false, //chi PASSWORD


            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewPassInput(WidgetRef ref, {required String hintText}) {
    return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 0.h, top: 20.h),
      padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            padding: EdgeInsets.only(left: 0.w, top: 0.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/lock.png"),
          ),
          Container(
            width: 280.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) {
                ref
                    .read(changePasswordNotifierProvider.notifier)
                    .updateNewPassword(value);
              },
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),

              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
              maxLines: 1,
              autocorrect: false, //
              obscureText: true, //chi PASSWORD


            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReNewPassInput(WidgetRef ref, {required String hintText}) {
    return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
      padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            padding: EdgeInsets.only(left: 0.w, top: 0.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/lock.png"),
          ),
          Container(
            width: 280.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) {
                ref
                    .read(changePasswordNotifierProvider.notifier)
                    .updateReNewPassword(value);
              },
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),

              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
              maxLines: 1,
              autocorrect: false, //
              obscureText: true, //chi PASSWORD


            ),
          ),
        ],
      ),
    );
  }


}
