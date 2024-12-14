import 'package:b2004772/common/routes/routes.dart';

import 'package:b2004772/common/utils/app_styles.dart';
import 'package:b2004772/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';

Future<void> main() async {
  await Global
      .init(); //khoi tao global de su dung (await de doi chac chac global dc init)
  //debugPrint = (String? message, {int? wrapWidth}) {};

  // await HttpUtil().post("api/login", queryParameters: {
  //   'name': "cuongbrave123",
  //   'email': "b123@gmail.com",
  //   'avatar': "\"xyz\"",
  //   'open_id': "\"cuongdeptrai\"",
  //   'type': 1 //type la kieu int nen k dc de kieu string
  //
  // });

  var item =
      Global.storageService.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ??
          "";
  print(item);

  runApp(const ProviderScope(child: MyApp()));
}

/*
        doi tuong trang thai dieu huong navKEY
       */
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navKey,
          title: 'Flutter Demo',
          theme: AppTheme.appThemeData,
          debugShowCheckedModeBanner: false,

          onGenerateRoute: (settings) =>
              AppPages.generateRouteSettings(settings), //routes.dart
        );
      },
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 1;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("River pod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: () {
              // ref.read(appCount.notifier).state++;
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const secondPage()));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_rounded),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed: () {
              ref.read(appCount.notifier).state++;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class secondPage extends ConsumerWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$count",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
