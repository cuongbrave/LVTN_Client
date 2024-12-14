import 'package:b2004772/common/models/course_entities.dart';
import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/common/models/test_exist.dart';
import 'package:b2004772/common/services/http_util.dart';

//request and response TEST_DETAIL voi (para == test_id) toi "api/testDetail"
class TestDetailRepo {
  // static Future<TestDetailResponseEntity> testDetail(
  //     {TestRequestEntity? param}) async {
  //   var response1 = await HttpUtil().post(
  //     "api/testDetail",
  //     queryParameters: param!.toJson(),
  //   );
  //     var response = TestDetailResponseEntity.fromJson(response1);
  //   if (response.code == 200) {
  //     return response;
  //   } else {
  //     throw Exception('Failed to load test detail');
  //   }
  // }

  static Future<TestDetailResponseEntity> testDetail({TestRequestEntity? param}) async {    //doi tuong request gui len server cho courseDetail --> chi can id
    var response = await HttpUtil().post(
      "api/testDetail",
      queryParameters: param!.toJson(),
    );
    return TestDetailResponseEntity.fromJson(response);
  }


  //kiem tra co ton tai ket qua trong user_test voi test_id =? va nguoi dung app hien tai
  static Future<TestExistResponseEntity> testExist({TestExistRequestEntities? param}) async {    //doi tuong request gui len server cho courseDetail --> chi can id
    var response = await HttpUtil().post(
      "api/testExist",
      queryParameters: param!.toJson(),
    );
    return TestExistResponseEntity.fromJson(response);
  }



}
