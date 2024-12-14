

import 'package:b2004772/common/services/http_util.dart';

import '../models/course_entities.dart';

class CourseAPI{
  //courseList() tra ve CourseListResponseEntity
  static Future<CourseListResponseEntity> courseList() async {
    var response=  await HttpUtil().post(
      "/api/courseList",
    );
    return CourseListResponseEntity.fromJson(response);
  }
}