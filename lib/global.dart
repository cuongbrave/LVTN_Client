import 'package:b2004772/common/services/storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';

class Global{
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();  // đảm bảo các bên thứ 3 được khởi tạo
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await StorageService().init(); //khoi tao storage --> sâu hơn là tạo SharedPreferences lưu trữ đệm
  }
}

