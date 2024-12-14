import 'package:b2004772/common/utils/constants.dart';
import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/app_shadow.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/features/home/controller/home_controller.dart';
import 'package:b2004772/features/question/controller/question_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: "Hello,",
          color: AppColors.primaryThreeElementText,
          fontWeight: FontWeight.bold),
    );
  }
}

// Widget helloText(){
//   return Container(
//     child: text24Normal(
//         text: "Hello,",
//         color: AppColors.primaryThreeElementText,
//         fontWeight: FontWeight.bold),
//   );
// }

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
   // print("my user name");
    return Container(
      child: text24Normal(
          text: Global.storageService.getUserProfile().name!,   //get user name from server đươc lưu ở storage
          //color: AppColors.primaryThreeElementText,
          fontWeight: FontWeight.bold),
    );
  }
}

//Banner & Dots
class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;

  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //banner
        SizedBox(
          height: 160.h,
          width: 325.w,
          child: PageView(
            controller: controller, //keep state cua banner
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },

            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),

        //dots
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(24.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w))),
        ),
      ],
    );
  }
}



Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    //color: Colors.red,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath!),
      fit: BoxFit.fill,
    ),
      borderRadius: BorderRadius.circular(16.0),
    ),
  );
}


AppBar homeAppbar(WidgetRef ref){
  var profileState = ref.watch(homeUserProfileProvider);

  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appImage(immagePath: ImageRes.menu, width: 34.w, height: 30.h),

            profileState.when(
                data: (data)=>GestureDetector(    //data lấy từ homeUserProfileProvider
                  child: AppBoxDecorationImage(imagePath: "${AppConstants.SERVER_API_URL}${data.avatar!}",),    //http://10.0.2.2:8000/uploads/default.png tren server

                ),
                error: (err, stack)=>appImage(immagePath: ImageRes.profile, width: 18.w, height: 12.h),
                loading: ()=>Container())

          ],
        ),
    ),
  );
}


class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: text16Normal(text: "Chọn bài thi", color: AppColors.primaryText,),
              ),
              // GestureDetector(
              //   child: const Text10Normal(text: "See all", color: AppColors.primaryThreeElementText),
              // )
            ],
          ),
        ),

        //SizedBox(height: 20.h,),

        //course item button
        // Container(
        //   child: Row(
        //     children: [
        //       Container(
        //           decoration: appBoxShadow(color: AppColors.primaryElement, radius: 7.w),
        //         padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
        //           child: const Text10Normal(text: "All",),
        //
        //       ),
        //
        //       Container(
        //         margin: EdgeInsets.only(left: 30.w,),
        //         child: const Text11Normal(
        //           text: "Popular",
        //           color: AppColors.primaryThreeElementText,
        //         ),
        //       ),
        //
        //       Container(
        //         margin: EdgeInsets.only(left: 30.w,),
        //         child: const Text11Normal(
        //           text: "Newest",
        //           color: AppColors.primaryThreeElementText,
        //         ),
        //       ),
        //
        //     ],
        //   ),
        // )

      ],
    );
  }
}

// lưới ảnh course list
class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;
  const CourseItemGrid({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);    //lang nghe update cua homeCourseListProvider roi cap nhap vào courseState

    //
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: courseState.when(      //courseState
        //data
          data: (data) {
            if (data == null || data.isEmpty) {
              print(data.toString());
              return const Center(child: Text("No data available"));
            }
            return GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.6,
              ),
              itemCount: data.length,
              itemBuilder: (_, int index) {   //index cua tung item
                //return appImage();
                return AppBoxDecorationImageVer2(
                  imagePath: ImageRes.defaultImg,
                  boxFit: BoxFit.fitWidth,
                  courseItem: data[index],
                  func: (){
                   Navigator.of(context).pushNamed(
                       "/course_detail",
                       arguments:{
                         "id":data[index].id!
                       }
                   );

                    // Navigator.of(context).pushNamed(
                    //     "/question_screen",
                    //
                    // );

                  },
                );
              },
            );
          },

          //error
          error: (error, stackTrace) {
            print(error.toString());
            print(stackTrace.toString());
            return const Center(child: Text("Error loading data"));
          },

          //loading
          loading: () => const Center(
            child: Text("loading..."),
          )),
    );
  }
}


// lưới ảnh test list
class TestItemGrid extends StatelessWidget {
  final WidgetRef ref;
  const TestItemGrid({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final testState = ref.watch(homeTestListProvider);    //lang nghe update cua homeCourseListProvider roi cap nhap vào courseState

    //
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: testState.when(      //courseState
        //data
          data: (data) {
            if (data == null || data.isEmpty) {
              print(data.toString());
              return const Center(child: Text("No data available"));
            }
            return GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.6,
              ),
              itemCount: data.length,
              itemBuilder: (_, int index) {   //index cua tung item
                //return appImage();
                return AppBoxDecorationImageVer3(
                  imagePath: ImageRes.defaultImg,
                  boxFit: BoxFit.fitWidth,
                  testItem: data[index],
                  func: (){
                    Navigator.of(context).pushNamed(
                        "/test_detail",
                        arguments:{
                          "id":data[index].id!  //day id cua test qua UI test_detail de show data
                        }
                    );

                    // Navigator.of(context).pushNamed(
                    //     "/question_screen",
                    //
                    // );

                  },
                );
              },
            );
          },

          //error
          error: (error, stackTrace) {
            print(error.toString());
            print(stackTrace.toString());
            return const Center(child: Text("Error loading data"));
          },

          //loading
          loading: () => const Center(
            child: Text("loading..."),
          )),
    );
  }
}


//thu nghiem list question
class QuestionItemGrid extends StatelessWidget {
  final WidgetRef ref;
  final int args;
  const QuestionItemGrid({super.key, required this.ref, required this.args});

  @override
  Widget build(BuildContext context) {
    final QuestionState = ref.watch(QuestionListForTestControllerProvider(index: args));    //lang nghe update cua homeCourseListProvider roi cap nhap vào courseState

    //
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: QuestionState.when(      //courseState
        //data
          data: (data) {
            if (data == null || data.isEmpty) {
              print(data.toString());
              return const Center(child: Text("No data available"));
            }
            return GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.6,
              ),
              itemCount: data.length,
              itemBuilder: (_, int index) {   //index cua tung item
                //return appImage();
                return AppBoxDecorationImageVer4(
                  imagePath: ImageRes.defaultImg,
                  boxFit: BoxFit.fitWidth,
                  questionItem: data[index],
                  func: (){
                    Navigator.of(context).pushNamed(
                        "/test_detail",
                        arguments:{
                          "id":data[index].id!  //day id cua test qua UI test_detail de show data
                        }
                    );

                    // Navigator.of(context).pushNamed(
                    //     "/question_screen",
                    //
                    // );

                  },
                );
              },
            );
          },

          //error
          error: (error, stackTrace) {
            print(error.toString());
            print(stackTrace.toString());
            return const Center(child: Text("Error loading data"));
          },

          //loading
          loading: () => const Center(
            child: Text("loading..."),
          )),
    );
  }
}



