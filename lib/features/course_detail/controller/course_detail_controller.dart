import 'package:b2004772/common/models/course_entities.dart';
import 'package:b2004772/features/course_detail/repo/course_detail_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../global.dart';
part 'course_detail_controller.g.dart';

//truyen obj ref -> co the truy cap vao cac provider khac
@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref, {required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response = await CourseDetailRepo.courseDetail(param: courseRequestEntity); //repo
  if(response.code == 200){
    return response.data;
  }else{
    print("request failed ${response.code}");
  }

}

