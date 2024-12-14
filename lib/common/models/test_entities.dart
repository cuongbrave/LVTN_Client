//clas su dung truy van voi doi so
class TestRequestEntity {
  int? id;

  TestRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class SearchRequestEntity {
  String? search;

  SearchRequestEntity({
    this.search,
  });

  Map<String, dynamic> toJson() => {
    "search": search,
  };
}

class TestListResponseEntity {
  int? code;
  String? msg;
  List<TestItem>? data;

  TestListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory TestListResponseEntity.fromJson(Map<String, dynamic> json) =>
      TestListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<TestItem>.from(
            json["data"].map((x) => TestItem.fromJson(x))),
      );
}

//api post response msg
class TestDetailResponseEntity {
  int? code;
  String? msg;
  TestItem? data;

  TestDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory TestDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      TestDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: TestItem.fromJson(json["data"]),  //chuyen doi json['data] -> obj TestItem
      );
}

class AuthorRequestEntity {
  String? token;

  AuthorRequestEntity({
    this.token,
  });

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}

//api post response msg
class AuthorResponseEntity {
  int? code;
  String? msg;
  AuthorItem? data;

  AuthorResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory AuthorResponseEntity.fromJson(Map<String, dynamic> json) =>
      AuthorResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: AuthorItem.fromJson(json["data"]),
      );
}

// login result
class AuthorItem {
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  int? download;
  int? online;

  AuthorItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  factory AuthorItem.fromJson(Map<String, dynamic> json) => AuthorItem(
    token: json["token"],
    name: json["name"],
    description: json["description"],
    avatar: json["avatar"],
    job: json["job"],
    follow: json["follow"],
    score: json["score"],
    download: json["download"],
    online: json["online"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
    "description": description,
    "avatar": avatar,
    "job": job,
    "follow": follow,
    "score": score,
    "download": download,
    "online": online,
  };
}

// login result
class TestItem {
  String? user_token;
  String? name;
  String? description;
  int? time;
  int? id;

  TestItem({
    this.user_token,
    this.name,
    this.description,
    this.time,

    this.id,

  });

  factory TestItem.fromJson(Map<String, dynamic> json) => TestItem(
      user_token: json["user_token"],
      name: json["name"],
      description: json["description"],
      time: json["time"],
      id: json["id"],

  );

  Map<String, dynamic> toJson() => {
    "user_token": user_token,
    "name": name,
    "description": description,
    "time": time,
    "id": id,

  };
}