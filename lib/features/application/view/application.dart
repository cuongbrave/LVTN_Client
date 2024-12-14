import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/common/widgets/app_shadow.dart';
import 'package:b2004772/features/application/provider/application_nav_notifier.dart';
import 'package:b2004772/features/application/view/widget/widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//su dung lop ko trang thai de chuyen thanh ConsumerWidget
class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);   //doc su thay doi moi nhat de cap nhap UI

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            body: appScreens(index: index),   //truyen vao index cua bottom item duoc onTap
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: appBoxShadowWithRadius(),
              child: BottomNavigationBar(
                currentIndex: index,
                onTap: (value) => {
                  ref.read(applicationNavIndexProvider.notifier).changeIndex(value),

                },
                elevation: 0,
                items: bottomTabs,  //list item at bottom bar
                type: BottomNavigationBarType.fixed,  //fix lai item ko vo
                showSelectedLabels: false, // item duoc chon ko show ten
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,

              ),
            ),
          )),
    );
  }
}

