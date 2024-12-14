import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/app_shadow.dart';
import 'package:b2004772/common/widgets/app_textfields.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchBar extends StatelessWidget {
  final VoidCallback? func;
  final Function(String value)? searchFunc;

  const AppSearchBar({super.key,  this.func, this.searchFunc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //search text box
        Container(
          width: 280.w,   //tong rong search bar 280
          height: 40.h,
          decoration: appBoxShadow(
              color: AppColors.primaryBackground,
              boxBorder: Border.all(color: AppColors.primaryFourElementText)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(immagePath: ImageRes.searchIcon),
              ),
              Container(
                width: 240.w,
                height: 40.h,
                child: appTextFildOnly(
                  width: 240,
                  height: 40,
                  hintText: "Tìm kiếm",
                  func: searchFunc,
                ),
              )
            ],
          ),
          //color: AppColors.primaryElement,
        ),

        //search button
        GestureDetector(
          onTap: func,
          child: Container(
            //padding: EdgeInsets.all(5.w),
            width: 40.w,
            height: 40.h,
            decoration: appBoxShadow(
                boxBorder: Border.all(color: AppColors.primaryElement)

            ),
            child: appImage(immagePath: ImageRes.searchButton),

          ),
        )

      ],
    );
  }
}
