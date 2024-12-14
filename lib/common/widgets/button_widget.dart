import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/widgets/app_shadow.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';

import 'package:b2004772/features/sign_up/view/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_bar.dart';

Widget appButton({
  String buttonName = "",
  double width = 325,
  double height = 50,
  bool isLogin = true,
  BuildContext? context,
  void Function()? func,

}){
  return GestureDetector(
    onTap: (){
      if(func == null){
        print("Day la null option");
      }else{
        func();
      }
    },
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
          color: isLogin
              ?AppColors.primaryElement
              :Colors.white,
          boxBorder: Border.all(color: AppColors.primaryFourElementText)
      ),
      child: Center(child: text16Normal(text: buttonName,
          color: isLogin
              ?AppColors.primaryBackground
              :AppColors.primaryText,
      )
      ),
    ),
  )
  ;
}


//mainButton -- back button

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;

  const MainButton({super.key,
    this.title="",
    required this.onTap,
    this.enabled = true,    //kich hoat hien thi button hay khong?
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled==false?null:onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color??AppColors.primaryElementBg,

            ),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child??Center(
                child: Text(title, style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryElementText,

                ),

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//AppCircle Button
class AppCircleButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;
  const AppCircleButton({super.key,
    required this.child,
    this.color,
    this.onTap,
    this.width = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        child: child ,
      ),

    );
  }
}

