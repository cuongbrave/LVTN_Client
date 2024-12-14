import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/utils/constants.dart';
import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:b2004772/features/profile/controller/profile_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidgets extends StatelessWidget {
  const ProfileImageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var profileImage = ref.watch(profileControllerProvider);
        // print("${AppConstants.SERVER_API_URL}${profileImage.avatar}");
        return Container(
          alignment: Alignment.bottomRight,
          width: 80.w,
          height: 80.h,
          decoration: profileImage == null
              ? BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.w),
                  image: const DecorationImage(
                      image: AssetImage(ImageRes.headPic)),
                )
              : BoxDecoration(
                  color: AppColors.primaryFourElementText
            ,
                  borderRadius: BorderRadius.circular(20.w),
                  image: DecorationImage(
                      image: NetworkImage(
                          "${AppConstants.SERVER_API_URL}${profileImage.avatar}")),
                ),
          child: AppImage(
            imagePath: ImageRes.editImage,
            width: 25.w,
            height: 25.h,
          ),
        );
      },
    );
  }
}

class ProfileNameWidgets extends StatelessWidget {
  const ProfileNameWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var profileName = ref.read(profileControllerProvider);
        return Container(
          margin: EdgeInsets.only(top: 12.h),
          child: text14Normal(text: profileName.name != null ? "${profileName.name}" : ""),
        );
      },);
  }
}


class ProfileDescriptionWidget extends StatelessWidget {
  const ProfileDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var profileDescription = ref.read(profileControllerProvider);

      return Container(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          margin: EdgeInsets.only(top: 5.h, bottom: 10),
          child: Text13Normal(
            text: profileDescription.description != null
                ? "${profileDescription.description}"
                : "I am awesome. I have been working as Flutter developer for the last five years. I fell in Love with Flutter. I feel like Flutter is going to take over the tech world and integrate awesome features in it.",
            color: AppColors.primarySecondaryElementText,),
        );
    },);
  }
}



