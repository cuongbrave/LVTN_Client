//su dung de nop bai
class TestResultItem {
  int? test_id;
  String? status; // Thêm trường status
  List<Result>? results;

  TestResultItem({
    this.test_id,
    this.status,  // Khởi tạo status
    this.results,
  });

  factory TestResultItem.fromJson(Map<String, dynamic> json) => TestResultItem(
    test_id: json["test_id"],
    status: json["status"],  // Đọc status từ response
    results: json["results"] == null
        ? []
        : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  //su dung toJson de nop bai
  Map<String, dynamic> toJson() => {
    "test_id": test_id ?? 1,
    "status": status ?? 'in_progress',  // Gửi status khi chưa có
    'results': results?.map((x) => x.toJson()).toList(),
  };
}


//su dung de tao list cac cau hoi di kem dap an de nop bai
class Result {
  int? question_id;
  int? choice_id;

  Result({
    this.question_id,
    this.choice_id,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      question_id: json['question_id'] as int?,
      choice_id: json['choice_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'question_id': question_id,
        'choice_id': choice_id,
      };
}


                                // PHUC VU NOP BAI

//response
class SubmittedTestResultResponseEntities {
  int? code;
  String? msg;
  SubmittedResultResponseEntities? data;

  SubmittedTestResultResponseEntities({
    this.code,
    this.msg,
    this.data,
  });

  factory SubmittedTestResultResponseEntities.fromJson(Map<String, dynamic> json) {
    return SubmittedTestResultResponseEntities(
      code: json["code"],
      msg: json["msg"],
      data: json['data'] != null
          ? SubmittedResultResponseEntities.fromJson(json["data"])
          : null,
    );
  }

}

//response.data
class SubmittedResultResponseEntities {
  int? user_id;
  int? test_id;
  int? score;
  int? id;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubmittedResultResponseEntities({
    this.user_id,
    this.test_id,
    this.score,
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SubmittedResultResponseEntities.fromJson(Map<String, dynamic> json) =>
      SubmittedResultResponseEntities(
        user_id: json["user_id"],
        test_id: json["test_id"],
        score: json["score"],
        id: json["id"],
        status: json["status"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
      );
}

                      // PHUC VU CHO TIEP TUC LAM BAI CHUA NOP (model 2)

//y chang class Result nhung de dung cho model 2
class TestProgress {
  int? questionId;
  int? choiceId;

  TestProgress({this.questionId, this.choiceId});

  factory TestProgress.fromJson(Map<String, dynamic> json) {
    return TestProgress(
      questionId: json['question_id'],
      choiceId: json['choice_id'],
    );
  }
}



//class kết quả nhận về từ 1 request tới server dùng cho model 2
class NoSubmittedTestResultResponseEntities {
  int? code;
  String? msg;
  NoSubmittedDataResponseEntities? data;

  NoSubmittedTestResultResponseEntities({
    this.code,
    this.msg,
    this.data,
  });

  factory NoSubmittedTestResultResponseEntities.fromJson(Map<String, dynamic> json) {
    return NoSubmittedTestResultResponseEntities(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] != null
          ? NoSubmittedDataResponseEntities.fromJson(json['data'])
          : null,
    );
  }
}


//class chứa cả dữ liệu của userTest và progress === data: {userTest, progress}
class NoSubmittedDataResponseEntities {
  NoSubmittedResultResponseEntities? userTest;
  List<TestProgress>? progress;

  NoSubmittedDataResponseEntities({
    this.userTest,
    this.progress,
  });

  factory NoSubmittedDataResponseEntities.fromJson(Map<String, dynamic> json) {
    return NoSubmittedDataResponseEntities(
      userTest: json['userTest'] != null
          ? NoSubmittedResultResponseEntities.fromJson(json['userTest'])
          : null,
      progress: json['progress'] != null
          ? List<TestProgress>.from(
        json['progress'].map((x) => TestProgress.fromJson(x)),
      )
          : [],
    );
  }
}


//class SubmittedResultResponseEntities nhưng dùng cho model 2 và chỉ là 1 phần dữ liệu phản hồi bao gồm
//...data: {userTest, progress}
class NoSubmittedResultResponseEntities {
  int? user_id;
  int? test_id;
  int? score;
  int? id;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  NoSubmittedResultResponseEntities({
    this.user_id,
    this.test_id,
    this.score,
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory NoSubmittedResultResponseEntities.fromJson(Map<String, dynamic> json) =>
      NoSubmittedResultResponseEntities(
        user_id: json['user_id'],
        test_id: json['test_id'],
        score: json['score'],
        id: json['id'],
        status: json['status'],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
      );
}








