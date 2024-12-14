import 'package:b2004772/common/api/course_api.dart';
import 'package:b2004772/common/api/testAPI.dart';
import 'package:b2004772/common/models/course_entities.dart';
import 'package:b2004772/common/models/entities.dart';
import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';



@Riverpod(keepAlive: true)      //giu cho provider live --> luon luu tru data trong suot qua trinh app hoat dong
class HomeScreenBannerDots extends _$HomeScreenBannerDots{

  @override
  int build()=>0;

  void setIndex(int value){
    state = value;

  }
}

@Riverpod(keepAlive: true)
class HomeUserProfile extends _$HomeUserProfile{

  @override
  FutureOr<UserProfile> build(){
    return Global.storageService.getUserProfile();
  }

}


@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList{

  Future<List<CourseItem>?> fetchCourseList() async {
    var result = await CourseAPI.courseList();
    if(result.code==200){
      return result.data;
    }
    return null;
  }

  @override
  FutureOr<List<CourseItem>?> build() async{
    return fetchCourseList();
  }

}

//HomeTestListProvider --> luu tru local all list test va bat dong bo khi co thay doi du lieu
@Riverpod(keepAlive: true)
class HomeTestList extends _$HomeTestList{

  //to refresh
  Future<List<TestItem>?> fetchTestList() async {
    var result = await TestAPI.testList();
    if(result.code == 200){
      return result.data;
    }
    return null;
  }

  //build ngay khi xay dung
@override
  FutureOr<List<TestItem>?> build() async{
    return fetchTestList();
}

}

