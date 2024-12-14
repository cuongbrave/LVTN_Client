import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../common/utlis/app_colors.dart';
import 'package:b2004772/common/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget text24Normal({required String text, Color color = AppColors.primaryText, FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:  TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: fontWeight,
    ),
  );
}

Widget text16Normal({required String text, Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget text14Normal({required String text, Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  );
}


//class Text9
class Text9Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text9Normal(
      {super.key,
        this.text = "",
        this.color = AppColors.primaryThreeElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color, fontSize: 9.sp, fontWeight: FontWeight.normal),
    );
  }
}

//class Text 10
class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text10Normal({super.key, this.text="", this.color = AppColors.primaryThreeElementText, this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
      ),
    );
  }
}


//class Text 11
class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text11Normal({super.key, this.text="", this.color = AppColors.primaryElementText, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 11.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}


// Widget text10Normal({required String text, Color color = AppColors.primaryThreeElementText}) {
//   return Text(
//     text,
//     textAlign: TextAlign.start,
//     style: TextStyle(
//       color: color,
//       fontSize: 14,
//       fontWeight: FontWeight.bold,
//     ),
//   );
// }

class Text13Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;

  const Text13Normal(
      {super.key,
        this.text = "",
        this.color = AppColors.primaryText,
        this.fontWeight = FontWeight.bold,
        this.textAlign = TextAlign.start,
        this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text!,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: 13.sp, fontWeight: fontWeight),
    );
  }
}

class Text16Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  const Text16Normal({super.key,
    this.text = "",
    this.color = AppColors.primarySecondaryElementText,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      ),
    );
  }
}


Widget textUnderline({String text = "my text"}){
  return GestureDetector(
    onTap: (){

    },
    child:  Text(text,
      style: TextStyle(
        fontWeight: FontWeight.normal ,
        fontSize: 12.sp,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,

      ),

    ),

  );
}
