import 'dart:math';

import 'package:b2004772/features/question/repo/question_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/question_entities.dart';
part 'question_controller.g.dart';

//hien thi selected Answer
@riverpod
class Question_selectedAnswer extends _$Question_selectedAnswer {
  @override
  int build() {
    return -1;
  }

  void setSelectedAnswer(int value) {
    //if
    state = value;
  }
}

//provider nextQuestionProvider
@riverpod
class NextQuestion extends _$NextQuestion {
  @override
  int build() {
    return 0;
  }

  void nextQuestion(int currentQuestionIndex, int totalQuestion) {
    if (currentQuestionIndex < totalQuestion - 1) {
      state = currentQuestionIndex + 1;
    } else {
      print("Đây là câu hỏi cuối cùng");
    }
  }

  void backQuestion(int currentQuestionIndex) {
    if (currentQuestionIndex > 0) {
      state = currentQuestionIndex - 1;
    } else {
      print("Đây là câu hỏi đầu tiên");
    }
  }
}

//
@riverpod
Future<List<QuestionItem>?> questionListForTestController(
    QuestionListForTestControllerRef ref,
    {required int index}) async {
  QuestionRequestEntity questionRequestEntity = QuestionRequestEntity();
  questionRequestEntity.test_id = index;
  final response =
      await QuestionRepo.questionListForTest(param: questionRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    print("request failed ${response.code}");
  }
  return null;
}
