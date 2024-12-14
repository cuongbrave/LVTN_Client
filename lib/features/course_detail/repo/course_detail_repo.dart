import 'package:b2004772/common/models/course_entities.dart';
import 'package:b2004772/common/services/http_util.dart';


class CourseDetailRepo{
  static Future<CourseDetailResponseEntity> courseDetail({CourseRequestEntity? param}) async {    //doi tuong request gui len server cho courseDetail --> chi can id
    var response = await HttpUtil().post(
      "api/courseDetail",
        queryParameters: param!.toJson(),
    );
    return CourseDetailResponseEntity.fromJson(response);
  }
}






//Muon cho tao UI Test_question




