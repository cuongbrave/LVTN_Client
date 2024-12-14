import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/common/widgets/search_widgets.dart';
import 'package:b2004772/features/search/controller/search_controller.dart';
import 'package:b2004772/features/search/view/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(testSearchControllerProvider);
    return Scaffold(
        appBar: buildGlobalAppbar(tilte: "Tìm kiếm bài thi"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 20.h,
                ),
                AppSearchBar(
                  searchFunc: (search){
                   ref.watch(testSearchControllerProvider.notifier).searchData(search!);


                  }
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: switch (searchProvider) {
                    AsyncData(:final value) => value!.isEmpty
                        ? const Center(child: Text("Không tìm thấy dữ liệu."))
                        :  TestSearchWidgets(value: value),
                    AsyncError(:final error) => Text('Error $error'),
                    _ => const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.red,
                              strokeWidth: 2,
                            )))
                  },
                )



              ],
            ),
          ),
        ));
  }
}
