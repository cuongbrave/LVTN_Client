

import 'dart:convert';
import 'dart:ffi';

import 'package:b2004772/common/models/entities.dart';
import 'package:b2004772/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();    //khoi tao _pref theo SharedPreferences luu vao bo nho dem theo format (key -> value)
    return this;
  }

  String getString(String key)  {
    return _pref.getString(key)??"";
  }

  Future<bool> setString(String key, String value) async {    //sign_in_controller save info user logged
    return await _pref.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  //trả về trạng thái của key DEVICE_OPEN_FIRST_KEY (true false)
  bool getDeviceFirstOpen(){
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY)??false;  //check _DEVICE_OPEN_FIRST chua bi thay doi(null) -> return false;
  }

  //check key user != null
  bool isLoggedIn(){
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY)!=null?true:false;
  }

  UserProfile getUserProfile(){
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";   //lay data(SharedPreferences) luu trong STORAGE_USER_PROFILE_KEY  khi code == 200 (sign_in_controller) vào profile
    var profileJson = jsonDecode(profile);    //chuyen ve json
    var userProfile = UserProfile.fromJson(profileJson);  //tao 1 obj useProfile tu profileJson
    return userProfile;
  }

  //luu tru access_token cua ng dung
  String getUserToken(){
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY)??"";
  }

  Future<bool> remove(String key) async {
    return await _pref.remove(key);
  }
}