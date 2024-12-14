import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/common/models/test_exist.dart';
import 'package:b2004772/features/tests_detail/repo/test_detail_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/test_result_entities.dart';
import '../../question/repo/test_result_repo.dart';
part 'test_detail_controller.g.dart';

//provider TestDetailControllerProvider luu tru obj TestItem response tu request param  (testRequestEntity.id = index);

@riverpod
Future<TestItem?> testDetailController(TestDetailControllerRef ref,
    {required int index}) async {
  TestRequestEntity testRequestEntity = TestRequestEntity();
  testRequestEntity.id = index;
  final response = await TestDetailRepo.testDetail(param: testRequestEntity);
  if (response.code == 200) {
    return response.data; //obj TestItem
  } else {
    print("request failed ${response.code}");
  }
  return null;
}

//testExist Controller
// class TestResultResponseEntities {
//   int? code;
//   String? msg;
//   ResultResponseEntities? data;
@riverpod
Future<TestExistResponseEntity?> testExistController(TestExistControllerRef ref,
    {required int testId}) async {
  //tạo đối tượng request tổng thể
  TestExistRequestEntities testExistRequestEntities =
      TestExistRequestEntities();
  testExistRequestEntities.test_id = testId;
  final response =
      await TestDetailRepo.testExist(param: testExistRequestEntities);
  if (response.code == 200 || response.code == 404) {
    return response;
  } else {
    print("request failed at test detail with testExit: ${response.code}");
  }
  return null;
}
