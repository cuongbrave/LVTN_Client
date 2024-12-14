import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/common/services/http_util.dart';

//return full bai thi
class TestAPI{
  static Future<TestListResponseEntity>testList() async {
    var response = await HttpUtil().post(
      "/api/testList",
    );
    return TestListResponseEntity.fromJson(response);

  }

}