import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/button_widget.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:b2004772/features/question/view/question_widget/UI_parameters.dart';



/*
*  PreferredSize widget give you a height from the appbar downwords and we can put child in the
* given space
* */

AppBar buildAppbar({String title =""}) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey.withOpacity(0.5),
          height: 1,
        )),
    title: text16Normal(text: title, color: AppColors.primaryText),
    centerTitle: true,
    // backgroundColor: Colors.black,
  );
}

AppBar buildGlobalAppbar({String tilte=""}){
  return AppBar(
    title:  Text16Normal(text: tilte, color: AppColors.primaryText, fontWeight: FontWeight.bold,),
  );
}




//custom AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  const CustomAppBar({
    super.key,
    this.title = "",
    this.showActionIcon = true,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.primaryElementBg,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobileScreenPadding,
            vertical: mobileScreenPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Leading widget (back button or custom leading widget)
              leading ??
                  Transform.translate(
                    offset: const Offset(-14, 0),
                    child: const BackButton(),
                  ),
              // Title widget
              Expanded(
                child: Center(
                  child: titleWidget ??
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primaryText,
                        ),
                      ),
                ),
              ),
              // Action icon (if showActionIcon is true)
              if (showActionIcon)
                Transform.translate(
                  offset: const Offset(10, 0),
                  child: AppCircleButton(
                    child: appImage(immagePath: ImageRes.back),
                    onTap: onMenuActionTap ?? null,
                  ),
                )
              else
                const SizedBox(width: 40), // Placeholder to balance layout
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}

