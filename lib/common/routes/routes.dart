//CLASS APPPage to chuyen page ben main.dart

import 'package:b2004772/common/routes/app_routes_name.dart';
import 'package:b2004772/features/application/view/application.dart';
import 'package:b2004772/features/change/password/view/change_password.dart';
import 'package:b2004772/features/course_detail/view/course_detail.dart';
import 'package:b2004772/features/forget/view/forget.dart';
import 'package:b2004772/features/profile/settings/widget/settings.dart';
import 'package:b2004772/features/question/view/question_screnn.dart';
import 'package:b2004772/features/question/view/question_test_screen.dart';
import 'package:b2004772/features/sign_in/view/sign_in.dart';
import 'package:b2004772/features/sign_up/view/sign_up.dart';
import 'package:b2004772/features/tests_detail/view/test_detail.dart';
import 'package:b2004772/features/welcome/view/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../features/home/view/home.dart';
import '../../global.dart';

class AppPages{
  static List<RouteEntity> routes(){
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.FORGET, page: const Forget()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
      RouteEntity(path: AppRoutesNames.COURSE_DETAIL, page: const CourseDetail()),
      RouteEntity(path: AppRoutesNames.TEST_DETAIL, page: const TestDetail()),

      RouteEntity(path: AppRoutesNames.QUESTION_SCREEN, page: const QuestionScrenn()),
      RouteEntity(path: AppRoutesNames.TEMP_ROUTE, page: const ketQua()),
      RouteEntity(path: AppRoutesNames.SETTINGS, page: const Settings()),
      RouteEntity(path: AppRoutesNames.CHANGE_PASS, page: const ChangePassword()),




    ];
  }

  static MaterialPageRoute generateRouteSettings (RouteSettings settings){
    if (kDebugMode) {
      //print("my route name is ${settings.name}");
    }
    //mac dinh khi app chay lan dau --> settings.name = "/", sau đó lưu lại path gần nhất
    if(settings.name != null){
     var result = routes().where((element) => element.path == settings.name); //tra ve danh sach RouteEntity 'at' route hien tai( settings.name) -> gan vao result
     // print(result.isNotEmpty);

     if(result.isNotEmpty){   //dam bao result != "", true =>
       //check used first time or not
       bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
       //print(deviceFirstTime);

       if(result.first.path == AppRoutesNames.WELCOME && deviceFirstTime){  //result.first : kq đầu tiên (RouteEntity) && deviceFirstTime = true

         bool isLoggedIn = Global.storageService.isLoggedIn();
         if(isLoggedIn){  //true ->Application()
           return MaterialPageRoute(
               builder: (_)=>
               const Application(), //(_) : ko can truyen context
               settings: settings
           );

         }else{   //false -> SignIn()
           return MaterialPageRoute(
               builder: (_)=>
               const SignIn(), //(_) : ko can truyen context
               settings: settings
           );
         }


       }else{
         if (kDebugMode) {
          //print('app ran first time');
         }
         return MaterialPageRoute(
             builder: (_)=> result.first.page, // (RouteEntity)
             settings: settings,
         );

       }

     }

    }// ->if settings.name != null

    return MaterialPageRoute(builder: (_)=>Welcome(), //(_) : ko can truyen context
        settings: settings);
  }
}

class RouteEntity{
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}