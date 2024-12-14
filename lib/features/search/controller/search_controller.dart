
import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/features/search/repo/search_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';



class SearchController extends AutoDisposeAsyncNotifier<List<TestItem>?> {
  bool _isDefaultStateDisabled = false;

  @override
  FutureOr<List<TestItem>?> build() async {
    if (_isDefaultStateDisabled) {
      // Nếu trạng thái mặc định bị vô hiệu hóa, trả về danh sách trống.
      return [];
    }
    // Nếu không, gọi API để lấy danh sách mặc định.
    final response = await SearchRepo.testDefaultSearch();
    if (response.code == 200) {
      return response.data;
    }
    return [];
  }

  // Hàm để vô hiệu hóa trạng thái mặc định.
  void disableDefaultState() {
    _isDefaultStateDisabled = true;
  }

  //method for search --> du lieu tra về hàm build --> ở trạng thái state
  Future<void> searchData(String search) async {
    state = const AsyncValue.loading();
    final searchRequestEntity = SearchRequestEntity(search: search);
    final response = await SearchRepo.testSearch(param: searchRequestEntity);

    if (response.code == 200) {
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.data([]);
    }
  }
}


final testSearchControllerProvider =
AutoDisposeAsyncNotifierProvider<SearchController, List<TestItem>?>(SearchController.new);


// @riverpod
// Future<List<TestItem>?>searchDataController(SearchDataControllerRef ref,{required String searchInput}) async {
//   SearchRequestEntity searchRequestEntity = SearchRequestEntity();
//   searchRequestEntity.search = searchInput;
//   final response = await SearchRepo.testSearch(param: searchRequestEntity);
//   if(response.code == 200){
//     return response.data;
//   }else{
//     print("request failed ${response.code}");
//   }
//   return null;
// }

