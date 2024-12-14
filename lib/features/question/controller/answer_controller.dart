import 'package:b2004772/common/models/answer_entities.dart';
import 'package:b2004772/features/question/repo/answer_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'answer_controller.g.dart';


@riverpod
Future<List<AnswerItem>?> answerListForQuestionController(AnswerListForQuestionControllerRef ref, {required int index}) async {
  AnswerRequestEntity answerRequestEntity = AnswerRequestEntity();
  answerRequestEntity.question_id = index;
  final response = await AnswerRePo.answerListForQuestion(param: answerRequestEntity);
  if(response.code == 200){
    return response.data;
  }else{
    print("request failed ${response.code}");
  }
  return null;

}