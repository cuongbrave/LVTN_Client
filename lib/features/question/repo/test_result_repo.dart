import 'package:b2004772/common/models/test_result_entities.dart';
import 'package:b2004772/common/services/http_util.dart';


//su dung voi submitted
class TestResultRepo {
  static Future<SubmittedTestResultResponseEntities> testResult(
      {TestResultItem? param}) async {
    var response = await HttpUtil().post(
      "api/submitTest",
      data: param!.toJson(),
    );
    //print("Request Data: ${param.toJson()}"); // In ra dữ liệu gửi lên máy chủ
    return SubmittedTestResultResponseEntities.fromJson(response);
  }
}



//sử dụng gửi request lên server với model 2
class ContinueTestResultRepo {

  //chấp nhận gửi lên TestResultItem boi model 1 và model 2 có request giống nhau
  static Future<NoSubmittedTestResultResponseEntities> testResultContinue(
      {TestResultItem? param}) async {
    var response = await HttpUtil().post(
      "api/submitTest",
      data: param!.toJson(),
    );
    //print("Request Data: ${param.toJson()}"); // In ra dữ liệu gửi lên máy chủ
    return NoSubmittedTestResultResponseEntities.fromJson(response);
  }
}
