import 'package:b2004772/common/models/answer_entities.dart';
import 'package:b2004772/common/services/http_util.dart';

class AnswerRePo{
  static Future<AnswerListResponseEntity> answerListForQuestion({AnswerRequestEntity? param}) async {
    var response =  await HttpUtil().post(
      "/api/answerList",
      queryParameters: param!.toJson()
    );
    return AnswerListResponseEntity.fromJson(response);
  }
}