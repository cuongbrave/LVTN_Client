


import 'package:b2004772/common/routes/app_routes_name.dart';
import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListItem(
              imagePath: ImageRes.settings, text: "Cài đặt",
              func:()=>Navigator.of(context).pushNamed(AppRoutesNames.SETTINGS)
          ),
          // ListItem(imagePath: ImageRes.creditCard, text: "Payment detail"),
          // ListItem(imagePath: ImageRes.award, text: "Achievement"),
          // ListItem(imagePath: ImageRes.love, text: "Love"),
          // ListItem(imagePath: ImageRes.reminder, text: "Reminder")
        ],
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? func;
  const ListItem({super.key, required this.imagePath, required this.text, this.func});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: func,
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(7.w),
            margin: EdgeInsets.only(bottom: 15.h),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryElement),

            ),
            child:  AppImage(
              imagePath: imagePath,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, bottom: 15.h),
            child: Text13Normal(
              textAlign: TextAlign.center,
              text: text,
            ),
          )
        ],
      ),
    );
  }
}

