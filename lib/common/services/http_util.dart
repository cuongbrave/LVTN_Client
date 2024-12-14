//use Dio to create Singleton class-> chi tao ra 1 instance

import 'package:b2004772/common/utils/constants.dart';
import 'package:b2004772/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil
      ._internal(); //tao 1 doi tuong _instance bang trinh xay dunng rieng

  factory HttpUtil() {
    return _instance;
  }

  //private constructor --> chi su dung duoc trong class nay
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json; charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);

    // bộ chặn kiểm tra (interceptors) -->(xuat trinh giay to)
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      //print("app request data ${options.data}");
      print("Request [${options.method}] => PATH: ${options.path}");
      print("Request Data: ${options.data}");
      print("Request Query Parameters: ${options.queryParameters}");
      print("Request Headers: ${options.headers}");
      return handler.next(options); // pass over
    }, onResponse: (response, handler) {
      print("app response data ${response.data}");
      return handler.next(response); //pass over
    }, onError: (DioException e, handler) {
      if (kDebugMode) {
        print("app error data ${e.response?.data}");
      }
      ErrorEntity eInfo = createErrorEntity(e);
      onError(eInfo);
    }));
  } //finish internal()

  //???
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService
        .getUserToken(); //lay token trong bo nho cuc bo ???
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  //post method
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions =
        options ?? Options(); //kiem tra ton tai requestOption?
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization =
        getAuthorizationHeader(); //authorization la 1 header tra ve

    if (authorization != null) {
      requestOptions.headers!
          .addAll(authorization); //ghi de header moi len header cu
    }

    //await de nhan duoc response sau khi post
    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);

    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");

    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timed out");

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timed out");

    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificates");

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Bad request");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");
        case 500:
          return ErrorEntity(code: 500, message: "Server internal error");
      }
      return ErrorEntity(
          code: error.response!.statusCode!, message: "Server bad response");

    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Server canceled it");

    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");

    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  print('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
  switch (eInfo.code) {
    case 400:
      print("Server syntax error");
      break;
    case 401:
      print("You are denied to continue");
      break;
    case 500:
      print("Server internal error");
      break;
    default:
      print("Unknown error");
      break;
  }
}
