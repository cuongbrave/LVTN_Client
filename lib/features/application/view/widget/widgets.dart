import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/features/home/view/home.dart';
import 'package:b2004772/features/profile/view/profile.dart';
import 'package:b2004772/features/qrcode/view/qrcode.dart';
import 'package:b2004772/features/search/view/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//list item at bottom bar
var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon: _bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.search),
    activeIcon: _bottomContainer(imagePath: ImageRes.search, color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Search",
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.QRcode),
    activeIcon: _bottomContainer(imagePath: ImageRes.QRcode, color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Play",
  ),

  // BottomNavigationBarItem(
  //   icon: _bottomContainer(imagePath: ImageRes.message),
  //   activeIcon: _bottomContainer(imagePath: ImageRes.message, color: AppColors.primaryElement),
  //   backgroundColor: AppColors.primaryBackground,
  //   label: "Message",
  // ),

  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.profile),
    activeIcon: _bottomContainer(imagePath: ImageRes.profile, color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Profile",
  ),

];


//bottom with image
Widget _bottomContainer({   //private ->chi dung trong tep tin nay
  double width = 15,
  double height = 15,
  String imagePath = ImageRes.home,
  Color color = AppColors.primaryFourElementText,
}){
  return SizedBox(
    width: 15.w,
    height: 15.h,
    child: appImageWithColor(
      immagePath: imagePath,
      color: color,
    ),
  );
}

//sceen of application -> ruturn muc luc va danh sach --> body application
Widget appScreens({int index = 0}){
  List <Widget> screens = [
    const Home(), //giao dien home tren class application()
    const Search(),
    const Qrcode(),
    // Center(child: appImage(immagePath: ImageRes.message, width: 250, height: 250),),
    const Profile(),

  ];
  return screens[index];
}
