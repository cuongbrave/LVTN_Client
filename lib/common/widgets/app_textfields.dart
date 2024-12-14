import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';


//Co ca text field va co ca iconImage
Widget appTextField(
    {
      TextEditingController? textController, //truyen vao textController de quan li các văn bản đã nhập
      String text = "",
      String iconName = "",
      String hintText = "Nhap vao thong tin cua ban",
      bool obscureText = false, //truong che ki tu cua password
      void Function(String value)? func,
    }) {
  return Container(
    // color: Colors.red,
    // height: 50.h,
    // width: 50.w,
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(height: 5.h,),
        Container(
          width: 325.w,
          height: 50.h,
          //  show box textField cho email va passwd
          decoration: appBoxDecorationTextField(),
          //cung hang voi appBoxDecorationTextField -> icon ben trong box
          child: Row(
            children: [
              //show iconImage text field
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(immagePath: iconName),
              ),

              //text field
              appTextFildOnly(textController: textController, hintText: hintText, func: func, obscureText: obscureText),

            ],
          ),
        )
      ],
    ),
  );
}


//chi cho text field, ko co iconImage
Widget appTextFildOnly(
{
  TextEditingController? textController,
  String hintText ="Nhap vao thong tin cua ban",
  double width =270,
  double height = 50,
  bool obscureText = false,
  void Function(String value)? func,

}
    ){
  return Container(
    width: width.w,
    height: height.h,
    // color: Colors.red,
    child: TextField(
      controller: textController,
      onChanged: (value)=>func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.transparent,
            )
        ),

        //border mac dinh neu ko chon vao input
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.transparent,
            )
        ),

        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.transparent,
            )
        ),


        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.transparent,
            )
        ),



      ),

      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
    ),
  );
}