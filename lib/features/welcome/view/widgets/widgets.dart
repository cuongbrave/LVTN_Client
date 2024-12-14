import 'package:b2004772/common/utils/constants.dart';
import 'package:b2004772/common/widgets/app_shadow.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

class AppOnboardingPage extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final BuildContext context;

  //cosntuctor for AppOnboardingPage
  const AppOnboardingPage({
    super.key,
    required this.controller,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
        //Image.asset("assets/images/boy.png"),
        Container(
            //color: Colors.red,
            //padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 15),
            child: text24Normal(text: title)),
        Container(
          //color: Colors.yellow,
          margin: const EdgeInsets.only(
            top: 15,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: text16Normal(text: subTitle),
        ),
        _nextButton(index, controller, context),
      ],
    );
  }
}

// Widget appOnboardingPage(
//   PageController controller, {
//   String imagePath = "assets/images/reading.png",
//   String title = "",
//   String subTitle = "",
//   index = 0,
//   required BuildContext context,
// }) {
//   return Column(
//     children: [
//       Image.asset(
//         imagePath,
//         fit: BoxFit.fitWidth,
//       ),
//       //Image.asset("assets/images/boy.png"),
//       Container(
//           //color: Colors.red,
//           //padding: const EdgeInsets.all(20),
//           margin: const EdgeInsets.only(top: 15),
//           child: text24Normal(text: title)),
//       Container(
//         //color: Colors.yellow,
//         margin: const EdgeInsets.only(
//           top: 15,
//         ),
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: text16Normal(text: subTitle),
//       ),
//       _nextButton(index, controller, context),
//     ],
//   );
// }

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // print("my tap is index $index");

      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
      print("from tap ${deviceFirstTime}");

      if (index < 3) {
        controller.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        //index > 4 --> signIn

        //ghi lai lan dau pass welcome -> lan toi k phai vao welcome again
        //key for welcome là dạng Bool (setBool)
        Global.storageService.setBool(
            AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY,
            true); //setBool cho bien OPEN_FIRST = true

        Navigator.pushNamed(
          context,
          "/signIn",
        );
        //   Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => const SignIn(),
        //   ),
        // );
      }
    },
    child: Container(
        width: 325,
        height: 50,
        //alignment: Alignment.center,
        // color: Colors.blue, //because have app decoration
        margin: EdgeInsets.only(top: 100, left: 25, right: 25),
        decoration: appBoxShadow(),
        child: Center(
            child: text16Normal(
                text: index == 3 ? "Bắt đầu ngay" : "Tiếp tục",
                color: Colors.white))),
  );
}
