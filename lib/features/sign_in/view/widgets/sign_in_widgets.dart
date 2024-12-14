import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/widgets/app_shadow.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// REMOVE TO APP_BAR.DART
/*
*  PreferredSize widget give you a height from the appbar downwords and we can put child in the
* given space
* */
// AppBar buildAppbar() {
//   return AppBar(
//     bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(1),
//         child: Container(
//           color: Colors.grey.withOpacity(0.5),
//           height: 1,
//         )),
//     title: text16Normal(text: "Login", color: AppColors.primaryText),
//     centerTitle: true,
//     // backgroundColor: Colors.black,
//   );
// }

Widget thirdPartyLogin() {
  return Container(
    // color: Colors.red,
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/ctu1.png"),
        //_loginButton("assets/icons/apple.png"),
        //_loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 50.h,
        height: 50.h,
        child: Image.asset(imagePath),
      ));
}


// REMOVE TO APP_BAR.DART
// Widget appTextField(
//     {String text = "",
//     String iconName = "",
//     String hintText = "Nhap vao thong tin cua ban",
//     bool obscureText = false,
//     }) {
//   return Container(
//     // color: Colors.red,
//     // height: 50.h,
//     // width: 50.w,
//     padding: EdgeInsets.only(left: 25.w, right: 25.w),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         text14Normal(text: text),
//         SizedBox(height: 5.h,),
//         Container(
//           width: 325.w,
//           height: 50.h,
//           //  show box textField cho email va passwd
//           decoration: appBoxDecorationTextField(),
//           //cung hang voi appBoxDecorationTextField -> icon ben trong box
//           child: Row(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(left: 17.w),
//                 child: appImage(immagePath: iconName),
//               ),
//               Container(
//                 width: 270.w,
//                 height: 50.h,
//                 // color: Colors.red,
//                 child: TextField(
//                   keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     border: const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color:  Colors.transparent,
//                       )
//                     ),
//
//                     //border mac dinh neu ko chon vao input
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color:  Colors.transparent,
//                         )
//                     ),
//
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color:  Colors.transparent,
//                         )
//                     ),
//
//
//                     disabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color:  Colors.transparent,
//                         )
//                     ),
//
//
//
//                   ),
//                   onChanged: (value){
//
//                   },
//                   maxLines: 1,
//                   autocorrect: false,
//                   obscureText: obscureText,
//                 ),
//               ),
//
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

//check 123
