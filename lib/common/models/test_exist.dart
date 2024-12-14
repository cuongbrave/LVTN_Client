class TestExistRequestEntities {
  int? test_id;

  TestExistRequestEntities({
    this.test_id,
  });

  Map<String, dynamic> toJson() => {
        "test_id": test_id,
      };
}

class TestExistResponseEntity {
  int? code;
  String? msg;
  TestExistItem? data;

  TestExistResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory TestExistResponseEntity.fromJson(Map<String, dynamic> json) {
    return TestExistResponseEntity(
      code: json["code"],
      msg: json["msg"],
      data:
          json["data"] == null || (json["data"] is List && json["data"].isEmpty)
              ? null
              : TestExistItem.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class TestExistItem {
  int? user_id;
  int? test_id;
  int? score;
  int? id;

  TestExistItem({
    this.user_id,
    this.test_id,
    this.score,
    this.id,
  });

  factory TestExistItem.fromJson(Map<String, dynamic> json) => TestExistItem(
        user_id: json["user_id"],
        test_id: json["test_id"],
        score: json["score"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "test_id": test_id,
        "score": score,
        "id": id,
      };
}
