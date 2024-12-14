


import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/common/routes/app_routes_name.dart';
import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/utils/constants.dart';
import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestTileWidgets extends StatelessWidget {
  final List<TestItem> value;
  const TestTileWidgets({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for(final val in value)
          Container(
            width: 325.w,
            height: 80.h,
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.symmetric(
                vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: const Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 1))
                ]),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                  AppRoutesNames.TEST_DETAIL,
                  arguments: {"id": val.id}),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: Image.asset(ImageRes.defaultImg).image,
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6.w),
                            width: 180.w,
                            child: Text13Normal(
                              maxLines: 1,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                              text: val
                                  .name
                                  .toString(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 6.w),
                            width: 180.w,
                            child: Text10Normal(
                              color:
                              AppColors.primaryThreeElementText,
                              text:
                              "${val.description} Lesson",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 55.w,
                    child: Text13Normal(
                      text: "${val.time} phút",
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}