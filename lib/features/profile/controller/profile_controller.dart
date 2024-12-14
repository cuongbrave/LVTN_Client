
import 'package:b2004772/common/models/user.dart';
import 'package:b2004772/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController{
  @override
  UserProfile build(){
    return Global.storageService.getUserProfile();
  }
}