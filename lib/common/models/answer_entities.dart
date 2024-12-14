class AnswerRequestEntity {
  int? question_id;

  AnswerRequestEntity({
    this.question_id,
  });

  Map<String, dynamic> toJson() => {
        "question_id": question_id,
      };
}

class AnswerListResponseEntity {
  int? code;
  String? msg;
  List<AnswerItem>? data;

  AnswerListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory AnswerListResponseEntity.fromJson(Map<String, dynamic> json) =>
      AnswerListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<AnswerItem>.from(
                json["data"].map((x) => AnswerItem.fromJson(x))),
      );
}

//api post response msg
class AnswerDetailResponseEntity {
  //trả về chi tiết từng câu hỏi theo test_id
  int? code;
  String? msg;
  //List<LessonVideoItem>? data;  //QuestionItem? data;
  AnswerItem? data;

  AnswerDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory AnswerDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      AnswerDetailResponseEntity(
          code: json["code"],
          msg: json["msg"],
          data: AnswerItem.fromJson(json["data"]));
}

// login result
class AnswerItem {
  String? choice_text;
  int? choice_num;
  int? question_id;
  bool? is_correct;
  int? id;

  AnswerItem({
    this.choice_text,
    this.choice_num,
    this.is_correct,
    this.question_id,
    this.id,
  });

  factory AnswerItem.fromJson(Map<String, dynamic> json) => AnswerItem(
        choice_text: json["choice_text"],
        choice_num: json["choice_num"],
        is_correct: json["is_correct"] == 1
            ? true
            : false, // Chuyển đổi từ số nguyên sang boolean
        question_id: json["question_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "choice_text": choice_text,
        "choice_num": choice_num,
        "is_correct":
            is_correct == true ? 1 : 0, // Chuyển đổi từ boolean sang số nguyên
        "question_id": question_id,
        "id": id,
      };
}
