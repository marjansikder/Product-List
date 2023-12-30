import 'package:get/get.dart';

import 'my_app_logic.dart';

class MyAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAppLogic());
  }
}
