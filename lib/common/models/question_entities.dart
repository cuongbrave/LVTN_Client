class QuestionRequestEntity {
  int? test_id;

  QuestionRequestEntity({
    this.test_id,
  });

  Map<String, dynamic> toJson() =>
      {
        "test_id": test_id,
      };
}


class QuestionListResponseEntity {
  int? code;
  String? msg;
  List<QuestionItem>? data;

  QuestionListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory QuestionListResponseEntity.fromJson(Map<String, dynamic> json) =>
      QuestionListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<QuestionItem>.from(
            json["data"].map((x) => QuestionItem.fromJson(x))),
      );
}

//api post response msg
class QuestionDetailResponseEntity {  //trả về chi tiết từng câu hỏi theo test_id
  int? code;
  String? msg;
  //List<LessonVideoItem>? data;  //QuestionItem? data;
  QuestionItem? data;

  QuestionDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });


  factory QuestionDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      QuestionDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: QuestionItem.fromJson(json["data"])
      );
}

// login result
class QuestionItem {

  String? question_text;
  int? question_num;
  int? test_id;
  int? id;

  QuestionItem({
   this.question_text,
    this.question_num,
    this.test_id,
    this.id,
  });

  factory QuestionItem.fromJson(Map<String, dynamic> json) =>
      QuestionItem(

        question_text: json["question_text"],
        question_num: json["question_num"],
        test_id: json["test_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() =>
      {
        "question_text": question_text,
        "question_num": question_num,
        "test_id": test_id,
        "id": id,
      };
}





