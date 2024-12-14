//import 'package:flutter/cupertino.dart';
import 'package:b2004772/features/welcome/provider/welcome_notifier.dart';
import 'package:b2004772/features/welcome/view/widgets/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../notifier/welcome_notifier.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();
  //int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProviderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // showing 3 welcome pages
                PageView(
                  onPageChanged: (value) {
                    //print("my index is $value");
                    ref
                        .read(indexDotProviderProvider.notifier)
                        .changeIndex(value);
                  },

                  controller: _controller,
                  //scrollDirection: Axis.vertical,

                  children: [
                    //first page
                    AppOnboardingPage(
                        controller: _controller,
                        imagePath: "assets/images/reading.png",
                        title: "Chào mừng bạn tới với ứng dụng",
                        subTitle:
                            "Nơi cung cấp những bài thi bổ ích trực tuyến và hoàn toàn miễn phí",
                        index: 1,
                        context: context),
                    //second page
                    AppOnboardingPage(
                        controller: _controller,
                        imagePath: "assets/images/man.png",
                        title: "Tiện lợi và linh động",
                        subTitle:
                            "Bạn có thể làm bài ở bất cứ đâu chỉ với điện thoại của mình",
                        index: 2,
                        context: context),
                    AppOnboardingPage(
                        controller: _controller,
                        imagePath: "assets/images/boy.png",
                        title: "Tiết kiệm thời gian",
                        subTitle:
                            "Sự tiện lợi chính là yếu tố quan trọng để tiết kiệm thời gian",
                        index: 3,
                        context: context),
                  ],
                ),

                // Showing dots
                Positioned(
                  //left: 20,
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(24.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.w))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
