//list all question voi tham so la QuestionRequestEntities

import 'package:b2004772/common/models/question_entities.dart';
import 'package:b2004772/common/services/http_util.dart';

class QuestionRepo{
  static Future<QuestionListResponseEntity> questionListForTest({QuestionRequestEntity? param}) async {
    var response = await HttpUtil().post(
      "/api/questionList",
      queryParameters: param!.toJson(),
    );

    return  QuestionListResponseEntity.fromJson(response);
  }
}


