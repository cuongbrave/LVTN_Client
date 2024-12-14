import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/image_res.dart';

Widget appImage(
    {String immagePath =ImageRes.defaultImg,
      double width = 16,
      double height = 16,


}){
  return Image.asset(immagePath.isEmpty ? ImageRes.defaultImg : immagePath, width: width.w, height: height.h,);
}


Widget appImageWithColor(
    {String immagePath = ImageRes.defaultImg,
      double width = 16,
      double height = 16,
      Color color = AppColors.primaryElement,

    }){

  return Image.asset(immagePath.isEmpty ? ImageRes.defaultImg : immagePath, width: width.w, height: height.h, color: color,);
}



//class AppImage
class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const AppImage({super.key,
    this.imagePath = ImageRes.defaultImg,
    this.width = 16,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath.isEmpty? ImageRes.defaultImg : imagePath,
      width: width.w,
      height: height.h,
    );
  }
}
