


import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/common/services/http_util.dart';

class SearchRepo{
  static Future<TestListResponseEntity> testDefaultSearch() async {
    var response = await HttpUtil()
        .post("api/testSearchDefault");
    return TestListResponseEntity.fromJson(response);
  }


  static Future<TestListResponseEntity> testSearch({SearchRequestEntity? param }) async {
    var response = await HttpUtil()
        .post("api/testSearch", queryParameters: param?.toJson());
    return TestListResponseEntity.fromJson(response);
  }
}