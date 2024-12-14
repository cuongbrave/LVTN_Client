import 'package:b2004772/common/models/test_result_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repo/test_result_repo.dart';
part 'test_result_controller.g.dart';

//su dung voi submitted (model 1)
@riverpod
Future<SubmittedResultResponseEntities?> testResultController(
    TestResultControllerRef ref,
    {required int testId,
      required String status,
      required List<Map<String, int>> results}) async {
  //tạo đối tượng request tổng thể {testId, List<Result>}
  TestResultItem testResultItem = TestResultItem();
  testResultItem.test_id = testId;
  testResultItem.status = status;


  List<Result> resultItems = [];

  for (var item in results) {
    Result resultItem = Result();
    resultItem.question_id = item['question_id'];
    resultItem.choice_id = item['choice_id'];
    resultItems.add(resultItem);
  }

  testResultItem.results = resultItems;

  //gọi hàm testResult từ TestResultRepo
  final response = await TestResultRepo.testResult(param: testResultItem);
  if (response.code == 200) {
    return response.data;
  } else {
    print("request failed ${response.code}");
  }
  return null;
}


//su dung voi NoSubmitted (model 2) --> trả về createdAt và progress
// return về trường data {userTest, progress} --> data.userTest và data.progress
@riverpod
Future<NoSubmittedDataResponseEntities?> testResultContinueController(
    TestResultContinueControllerRef ref,
    {required int testId,
      required String status,
      required List<Map<String, int>> results}) async {
  //tạo đối tượng request tổng thể {testId, List<Result>}
  TestResultItem testResultItem = TestResultItem();
  testResultItem.test_id = testId;
  testResultItem.status = status;


  List<Result> resultItems = [];

  for (var item in results) {
    Result resultItem = Result();
    resultItem.question_id = item['question_id'];
    resultItem.choice_id = item['choice_id'];
    resultItems.add(resultItem);
  }

  testResultItem.results = resultItems;

  //gọi hàm testResult từ TestResultRepo
  final response = await ContinueTestResultRepo.testResultContinue(param: testResultItem);
  if (response.code == 200) {
    return response.data;
  } else {
    print("request failed ${response.code}");
  }
  return null;
}


