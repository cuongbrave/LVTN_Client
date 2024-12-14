import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/features/course_detail/controller/course_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildAppbar(title: "Course Detail"),
      body: stateData.when(
          data: (data) {
            if (data == null) {
              return Center(
                child: Text("No data found"),
              );
            } else {
              return Center(child: Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Column(

                children: [
                  Text(data.name!),
                  SizedBox(height: 10.h,),
                  Text(data.description!),

                ],
              )));
            }
          },
          error: (error, traceStack) => Text("Error loading data...."),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
