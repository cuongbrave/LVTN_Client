import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'global_loader.g.dart';

@riverpod
class AppLoader extends _$AppLoader{
  @override
  bool build(){
    return false;
  }

  //hàm xây dựng bulid có type là bool -> state là bool
  void setLoaderValue(bool value){
    state = value;
  }

}