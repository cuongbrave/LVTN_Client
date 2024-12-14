import 'package:b2004772/features/application/view/application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/button_widget.dart';
import '../../home/view/home.dart';
import '../../home/view/widgets/home_widget.dart';
import '../controller/question_controller.dart';

class ketQua extends ConsumerStatefulWidget {
  const ketQua({super.key});

  @override
  ConsumerState<ketQua> createState() => _TestDetailState();
}

class _TestDetailState extends ConsumerState<ketQua> {
  //khai bao bien toan cuc args
  late var score;
  late var totalQuestions;
  late var testId;

  var temp = 1;
  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    score = args['score'];
    totalQuestions = args['totalQuestions'];
    testId = args['testId'];
    print('Test score: $score');
    print('Test totalQuestions: $totalQuestions');
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var questionListForTestSate =
        ref.watch(QuestionListForTestControllerProvider(index: testId));

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Hoàn thành và kết quả",
         leading: SizedBox.shrink(),
        showActionIcon: false,
      ),
      body: questionListForTestSate.when(
          data: (data) {
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("Không có dữ liệu"),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                        "Tổng số câu hỏi của bài test: ${data.length.toString()}."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text("Tổng số câu hỏi bạn đã làm: $totalQuestions"),
                  ),
                  Center(
                    child: Text(
                        "Kết quả điểm của bạn: $score/${data.length.toString()} câu hỏi"),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Center(

                    child: appButton(
                        buttonName: "Quay về trang chủ",
                        func: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const Application()),
                                (route) => false,
                          );
                        }

                    ),
                  )
                ],
              ),
            );
          },
          error: (error, stackTrace) {
            print(error.toString());
            print(stackTrace.toString());
            return const Center(child: Text("Error loading data"));
          },
          loading: () => const Center(
                child: Text("loading..."),
              )),
    );
  }
}
