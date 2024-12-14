import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/common/widgets/search_widgets.dart';

import 'package:b2004772/features/home/view/widgets/home_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/home_controller.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  // @override
  // void initState() {
  //   _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
  //   // TODO: implement initState
  //   super.initState();
  // }

//trang thai init khoi tao chua co gia tri va initState chi goi 1 time at start time  --> _controller = null ---> error

  @override
  //didChangeDependencies la state cho change value tot nhat
  void didChangeDependencies() {    // trang thai thay doi --> thay doi nhan gia tri cua controller
    _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppbar(ref),
      body: RefreshIndicator(
          onRefresh: (){
            //lam moi course List trong homeCourseList provider khi refresh
            return ref.refresh(homeTestListProvider.notifier).fetchTestList();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  const HelloText(),
                  const UserName(),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // AppSearchBar(
                  //   func: (){
                  //     print("Search home page");
                  //   },
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  HomeBanner(controller: _controller, ref: ref),
                  const HomeMenuBar(),
                  SizedBox(
                    height: 5.h,
                  ),
                   //CourseItemGrid(ref: ref),
                   TestItemGrid(ref: ref)

                ],
              ),
            ),
          )),
    );
  }
}
