import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/common/widgets/button_widget.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:b2004772/features/application/view/application.dart';
import 'package:b2004772/features/home/view/home.dart';
import 'package:b2004772/features/tests_detail/controller/test_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//UI cua test_detail
class TestDetail extends ConsumerStatefulWidget {
  const TestDetail({super.key});

  @override
  ConsumerState<TestDetail> createState() => _TestDetailState();
}

class _TestDetailState extends ConsumerState<TestDetail> {
  List<Map<String, int>> results =
      []; // Danh sách lưu câu hỏi và đáp án --> check mã existTest.code = 400
  //khai bao bien toan cuc args
  late var args;
  var temp = 1;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id['id'];
    print('Test ID at Test detail: $args');
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //doc bo nho cuc bo home
    var testDetailStateData =
        ref.watch(testDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildAppbar(title: "Chi tiết bài thi"),
      body: testDetailStateData.when(
          data: (data) {
            if (data == null) {
              return const Center(
                child: Text("No data found"),
              );
            } else {
              var testExistState = ref.watch(testExistControllerProvider(
                  testId: data.id!)); //check xem da thi bai nay chua

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text16Normal(text: "Tên bài thi: ${data.name!}", fontWeight: FontWeight.w700,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text("Mô tả: ${data.description!}"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text("Thời gian làm bài: ${data.time!.toString()} phút"),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    testExistState.when(
                      data: (testExist) {
                        if (testExist == null) {
                          return const Center(
                            child: Text("No data found"),
                          );
                        } else {
                          if (testExist.code == 200 &&
                              testExist.msg == "Test exists") {
                            return Column(
                              children: [
                                const Center(
                                  child: Text("Bạn đã hoàn thành bài thi này"),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Center(
                                  child: appButton(
                                    buttonName: "Quay về trang chủ",
                                    func: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Application()),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else if (testExist.code == 200 &&
                              testExist.msg == "Test does not exist") {
                            // Nếu testExist.code == 204 thì hiển thị nút Submit
                            return Center(
                              child: appButton(
                                buttonName: "Làm bài",
                                func: () {
                                  Navigator.of(context).pushNamed(
                                    "/question_screen",
                                    arguments: {
                                      "id": data.id,
                                      "time": data.time,
                                    },
                                  );
                                },
                              ),
                            );
                          }
                        }
                        // Trường hợp khác (có thể chưa xử lý), ví dụ trả về null
                        return const Center(
                          child: Text("Không thể tải dữ liệu"),
                        );
                      },
                      error: (error, stackTrace) {
                        print("Error: $stackTrace");
                        return const Center(
                          child: Text("Error loading test Exist"),
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          error: (error, traceStack) {
            print("Error: $traceStack");
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
