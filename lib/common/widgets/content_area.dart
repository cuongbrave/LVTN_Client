import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/features/question/view/question_widget/UI_parameters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({super.key,
     this.addPadding = true,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Material(

      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: const BoxDecoration(
          color: AppColors.primaryBackground,
        ),

        padding: addPadding
            ? EdgeInsets.only(
                top: mobileScreenPadding, left: mobileScreenPadding, right: mobileScreenPadding)
            :EdgeInsets.zero,

        child: child,

      ),
    );
  }
}
