import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/common/widgets/app_shadow.dart';
import 'package:b2004772/common/widgets/content_area.dart';
import 'package:b2004772/common/widgets/image_widgets.dart';
import 'package:b2004772/features/question/controller/question_controller.dart';
import 'package:b2004772/features/question/controller/test_result_controller.dart';
import 'package:b2004772/features/question/view/question_widget/UI_parameters.dart';
import 'package:b2004772/features/question/view/question_widget/answer_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:b2004772/common/widgets/button_widget.dart';

import '../../../common/models/test_result_entities.dart';
import '../../../common/utils/image_res.dart';
import '../controller/answer_controller.dart';
import 'dart:async';

var selectedAnswerIdProvider = StateProvider<int>((ref) => -1);

class QuestionScrenn extends ConsumerStatefulWidget {
  const QuestionScrenn({super.key});

  @override
  ConsumerState<QuestionScrenn> createState() => _QuestionScrennState();
}

class _QuestionScrennState extends ConsumerState<QuestionScrenn>
    with WidgetsBindingObserver {
  bool isProgressUpdated = false; // Tránh cập nhật tiến trình nhiều lần

  int? responseTestId;
  int? responseScore;
  late int timeInSeconds;
  Timer? _countdownTimer;
  List<Map<String, int>> results = []; // Danh sách lưu câu hỏi và đáp án
  List<Map<String, int>> resultsUpdate = [];
  bool isSubmitting = false; // Biến để kiểm soát trạng thái gửi request

  // Hàm khởi tạo bộ đếm ngược
  void startCountdownTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeInSeconds <= 0) {
        timer.cancel();
        submitTestAutomatically(); // Tự động nộp bài khi hết giờ
      } else {
        if (mounted) {
          setState(() {
            timeInSeconds--;
          });
        }
      }
    });
  }

  // Hàm gửi bài thi lên server và chuyển đến màn hình tiếp theo
  Future<void> submitTestAutomatically() async {
    // Lấy câu trả lời được chọn từ `selectedAnswerIdProvider`
    int selectedAnswerId = ref.read(selectedAnswerIdProvider);
    int currentQuestionIndex = ref.read(nextQuestionProvider);

    // Kiểm tra nếu có câu trả lời được chọn và chưa được thêm vào `results`
    if (selectedAnswerId != -1) {
      var currentQuestion = ref
          .read(QuestionListForTestControllerProvider(index: args))
          .value![currentQuestionIndex];

      bool isAlreadyExist = results.any((result) =>
          result["question_id"] == currentQuestion.id &&
          result["choice_id"] == selectedAnswerId);

      // Thêm câu trả lời cuối cùng vào `results` nếu chưa tồn tại
      if (!isAlreadyExist) {
        results.add({
          "question_id": currentQuestion.id!,
          "choice_id": selectedAnswerId
        });
      }
    }

    final navigator = Navigator.of(context);

    // Gửi dữ liệu lên server và chuyển đến màn hình tiếp theo
    SubmittedResultResponseEntities? response = await ref.read(
      testResultControllerProvider(
              testId: args, status: 'submitted', results: results)
          .future,
    );

    if (response != null && response.score != null) {
      int score = response.score!;
      int totalQuestions = results.length;
      if (mounted) {
        navigator.pushReplacementNamed(
          "/temp",
          arguments: {
            "score": score,
            "totalQuestions": totalQuestions,
            "testId": args,
          },
        );
      }
    }
  }

  late var args;
  bool _isTimerInitialized = false; //chắc chắn khởi tạo bộ đếm 1 lần

  /////
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    print("Danh sách đáp án sau mỗi thay đổi....: $results");
    if (!_isTimerInitialized) {
      var id = ModalRoute.of(context)!.settings.arguments as Map;
      timeInSeconds = (id['time'] as int) * 60; // Thời gian làm bài (giây)
      args = id['id'];

      // Gửi request tới server để lấy `created_at`
      await ref
          .read(testResultContinueControllerProvider(
        testId: id['id'],
        status: 'in_progress',
        results: [],
      ).future)
          .then((response) {
        if (response != null && response.userTest != null) {
          handleServerResponse(response);
        } else {
          print("Phản hồi không hợp lệ từ server: $response");
        }
      });

        //
      ref.read(selectedAnswerIdProvider.notifier).state = -1;
      _isTimerInitialized = true;
    }
  }

  void handleServerResponse(dynamic response) {
    // Kiểm tra nếu userTest có tồn tại và createdAt không phải null
    if (response.userTest?.createdAt != null) {
      // Lấy thời gian bắt đầu làm bài từ server
      DateTime createdAt = response.userTest!.createdAt!;

      // Tính thời gian đã trôi qua kể từ khi bài kiểm tra bắt đầu
      DateTime now = DateTime.now();
      int elapsedSeconds = now.difference(createdAt).inSeconds;

      // Tính thời gian còn lại và giới hạn trong phạm vi không âm
      int remainingTime =
          (timeInSeconds - elapsedSeconds).clamp(0, timeInSeconds);
      setState(() {
        timeInSeconds = remainingTime;
      });

      // Kiểm tra nếu progress không phải null và tiến hành ánh xạ
      // if (response.progress != null && response.progress!.isNotEmpty) {
      //   results = response.progress!
      //       .map((progress) {
      //     return {
      //       "question_id": progress.questionId is int
      //           ? progress.questionId
      //           : int.tryParse(progress.questionId.toString()) ?? 0,
      //       "choice_id": progress.choiceId is int
      //           ? progress.choiceId
      //           : int.tryParse(progress.choiceId.toString()) ?? 0,
      //     };
      //   })
      //       .toList();
      // } else {
      //   print("Thông báo: Không có tiến trình trước đó, bắt đầu làm bài mới.");
      // }

      // Khởi tạo bộ đếm ngược
      startCountdownTimer();

      print("response.progress: ${response.progress}");
      response.progress!.forEach((element) {
        print("Element: $element, Type: ${element.runtimeType}");
      });

      response.progress!.forEach((progress) {
        print(
            "Question ID: ${progress.questionId}, Choice ID: ${progress.choiceId}");
      });

      if (response.progress != null && response.progress!.isNotEmpty) {
        resultsUpdate =
            response.progress!.map<Map<String, int>>((TestProgress progress) {
          return {
            "question_id": progress.questionId ?? 0,
            "choice_id": progress.choiceId ?? 0,
          };
        }).toList();
      } else {
        print("Thông báo: Không có tiến trình trước đó, bắt đầu làm bài mới.");
      }

      print("Danh sách đáp án ánh xạ vê: $resultsUpdate");
    } else {
      print("Lỗi: Không nhận được `created_at` từ server");
    }
  }

  Future<void> updateTestProgress() async {
    await ref
        .read(testResultContinueControllerProvider(
      testId: args,
      status: 'in_progress',
      results: results,
    ).future)
        .then((response) {
      if (response != null && response.userTest != null) {
        print("Cập nhật tiến trình thành công: $response");
        print("Danh sách đáp án cập nhập: $results");

      } else {
        print("Không thể cập nhật tiến trình: $response");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Theo dõi trạng thái vòng đời
  }

  @override
  void dispose() {
    _countdownTimer?.cancel(); // Hủy timer

    //updateTestProgress(); // Cập nhật tiến trình trước khi rời khỏi màn hình

    WidgetsBinding.instance
        .removeObserver(this); // Bỏ theo dõi khi widget bị hủy
    super.dispose();
  }

  // Theo dõi trạng thái vòng đời của ứng dụng
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      await _updateProgressSafely(); // Cập nhật tiến trình khi ứng dụng bị tạm dừng hoặc thoát
    }
  }

  // Hàm cập nhật tiến trình
  Future<void> _updateProgressSafely() async {
    if (!isProgressUpdated) {
      isProgressUpdated = true;
      print("Cập nhật tiến trình làm bài...");

      await updateTestProgress(); // Gọi hàm cập nhật tiến trình
    }
  }

  // Hiển thị hộp thoại xác nhận khi nhấn SUBMIT
  void _showSubmitConfirmationDialog(
      BuildContext context, int testId, List<Map<String, int>> results) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Xác nhận nộp bài"),
          content: const Text("Bạn có chắc chắn muốn nộp bài không?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại
              },
              child: const Text("Hủy"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Đóng hộp thoại
                await submitTest(testId, results); // Gửi bài thi
                print("Showdialog danh sách đáp án trước khi gửi: $results");
              },
              child: const Text("Nộp bài"),
            ),
          ],
        );
      },
    );
  }

  // Gửi bài thi lên server
  Future<void> submitTest(int testId, List<Map<String, int>> results) async {
    final navigator = Navigator.of(context);

    // Gửi dữ liệu lên server và chuyển đến màn hình tiếp theo
    SubmittedResultResponseEntities? response = await ref.read(
      testResultControllerProvider(
              testId: testId, status: 'submitted', results: results)
          .future,
    );

    if (response != null && response.score != null) {
      int score = response.score!;
      int totalQuestions = results.length;
      if (mounted) {
        navigator.pushReplacementNamed(
          "/temp",
          arguments: {
            "score": score,
            "totalQuestions": totalQuestions,
            "testId": testId,
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    int selectedAnswerIndex = ref.watch(question_selectedAnswerProvider);

    print("selected answer index first: $selectedAnswerIndex");

    int currentQuestionIndex =
        ref.watch(nextQuestionProvider); //for next button

    //QuestionListForTestProvider
    var questionListForTestSate =
        ref.watch(QuestionListForTestControllerProvider(index: args));

    return PopScope(
      onPopInvoked: (result) async {
        await _updateProgressSafely(); // Cập nhật tiến trình khi pop màn hình
        return Future.value(true);
      },
      child: Scaffold(
          appBar: CustomAppBar(
            title: "My custom AppBar",
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const ShapeDecoration(
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.white, width: 2))),
              child: Text(
                  "Timmer: $minutes:${seconds.toString().padLeft(2, '0')} phút"),
            ), //them leading show time state

            showActionIcon: true, //show icon menu appbar
            titleWidget: Text(
              "Câu hỏi số ${currentQuestionIndex + 1}",
              style: const TextStyle(fontSize: 13),
            ),
          ),
          body: questionListForTestSate.when(
              data: (questions) {
                if (questions == null || questions.isEmpty) {
                  return const Center(
                    child: Text("No data found"),
                  );
                }
                var currentQuestion = questions[currentQuestionIndex];
                var answerListForQuestionState = ref.watch(
                    answerListForQuestionControllerProvider(
                        index: currentQuestion.id!));

                return BackgroundDecoration(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: ContentArea(
                            addPadding: true,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      currentQuestion.question_text ??
                                          "No question text available",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    answerListForQuestionState.when(
                                      data: (answers) {
                                        if (answers == null ||
                                            answers.isEmpty) {
                                          return const Center(
                                            child: Text("No answers available"),
                                          );
                                        }

                                        return ListView.separated(
                                          shrinkWrap: true,
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            // Kiểm tra xem câu hỏi hiện tại có trong resultsUpdate không
                                            if (resultsUpdate.isNotEmpty) {
                                              var existingAnswer =
                                                  resultsUpdate.firstWhere(
                                                (result) =>
                                                    result["question_id"] ==
                                                    currentQuestion.id,
                                                orElse: () => {},
                                              );

                                              if (existingAnswer.isNotEmpty) {
                                                int existingAnswerId =
                                                    existingAnswer[
                                                        "choice_id"]!;
                                                int existingAnswerIndex =
                                                    answers.indexWhere(
                                                        (answer) =>
                                                            answer.id ==
                                                            existingAnswerId);

                                                if (existingAnswerIndex != -1) {
                                                  selectedAnswerIndex =
                                                      existingAnswerIndex;
                                                  //selectedAnswerIdProvider = existingAnswerId;
                                                  print(
                                                      "selected answer index: $selectedAnswerIndex");

                                                  bool isAlreadyExist =
                                                      results.any((result) =>
                                                          result["question_id"] ==
                                                              currentQuestion
                                                                  .id &&
                                                          result["choice_id"] ==
                                                              existingAnswerId);

                                                  // Thêm câu trả lời cuối cùng vào `results` nếu chưa tồn tại
                                                  if (!isAlreadyExist) {
                                                    results.add({
                                                      "question_id":
                                                          currentQuestion.id!,
                                                      "choice_id":
                                                          existingAnswerId
                                                    });
                                                  }
                                                }
                                              }
                                            }

                                            return AnswerCard(
                                              answer:
                                                  '${String.fromCharCode(65 + (index % 26))}. ${answers[index].choice_text!}',
                                              isSelected:
                                                  selectedAnswerIndex == index,
                                              onTap: () {
                                                //click chon thi doi mau dap an da chon
                                                ref
                                                    .read(
                                                        question_selectedAnswerProvider
                                                            .notifier)
                                                    .setSelectedAnswer(index);
                                                print(
                                                    "selected answer index: $index");

                                                // Lấy ID của đáp án được chọn
                                                ref
                                                    .read(
                                                        selectedAnswerIdProvider
                                                            .notifier)
                                                    .state = answers[index].id!;
                                                print(
                                                    "selected answer id: ${answers[index].id!}");
                                              },
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  const SizedBox(height: 10),
                                          itemCount: answers.length,
                                        );
                                      },
                                      error: (error, stackTrace) {
                                        print("Error: $stackTrace");
                                        return const Center(
                                          child: Text("Error loading answers"),
                                        );
                                      },
                                      loading: () => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        ColoredBox(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Padding(
                            padding: UIParameters.mobileScreenPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: currentQuestionIndex >= 1,
                                  child: SizedBox(
                                    width: 55,
                                    height: 55,
                                    child: MainButton(
                                      //enabled: currentQuestionIndex >= 1,
                                      onTap: () {
                                        ref
                                            .read(nextQuestionProvider.notifier)
                                            .backQuestion(currentQuestionIndex);
                                      },
                                      color: AppColors.primaryElement,
                                      child:
                                          appImage(immagePath: ImageRes.back),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20, height: 55),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Visibility(
                                      child: MainButton(
                                        title: currentQuestionIndex ==
                                                questions.length - 1
                                            ? "SUBMIT"
                                            : "NEXT QUESTION",
                                        onTap: () {
                                          // Lấy `selectedAnswerId` từ `selectedAnswerIdProvider`
                                          int selectedAnswerId = ref
                                              .read(selectedAnswerIdProvider);

                                          if (selectedAnswerId != -1) {
                                            // Kiểm tra xem câu hỏi với ID này và đáp án với ID đã chọn có trong danh sách chưa
                                            bool isAlreadyExist = results.any(
                                                (result) =>
                                                    result["question_id"] ==
                                                        currentQuestion.id &&
                                                    result["choice_id"] ==
                                                        selectedAnswerId);

                                            // Nếu chưa tồn tại, thêm câu trả lời vào danh sách
                                            if (!isAlreadyExist) {
                                              results.add({
                                                "question_id":
                                                    currentQuestion.id!,
                                                "choice_id": selectedAnswerId
                                              });
                                            }
                                          }

                                          if (currentQuestionIndex ==
                                              questions.length - 1) {
                                            // Navigator.pushNamed(context, '/temp');
                                            // Hiển thị hộp thoại xác nhận khi nhấn SUBMIT
                                            _showSubmitConfirmationDialog(
                                                context, args, results);
                                            print("results: $results");
                                          } else {
                                            // Đi đến câu hỏi tiếp theo
                                            ref
                                                .read(nextQuestionProvider
                                                    .notifier)
                                                .nextQuestion(
                                                    currentQuestionIndex,
                                                    questions.length);
                                            // Đặt lại giá trị của selectedAnswerIndex
                                            ref
                                                .read(
                                                    question_selectedAnswerProvider
                                                        .notifier)
                                                .setSelectedAnswer(-1);

                                            // Đặt lại `selectedAnswerIdProvider` để tránh giữ lại lựa chọn của câu hỏi trước
                                            ref
                                                .read(selectedAnswerIdProvider
                                                    .notifier)
                                                .state = -1;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              error: (error, stackTrace) {
                print("Error: $stackTrace");
                return const Center(
                  child: Text("Error loading data"),
                );
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
