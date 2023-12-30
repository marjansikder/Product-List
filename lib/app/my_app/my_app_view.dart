import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/lang/translate-lang.dart';
import '../../../config/routes.dart';
import '../../../style/theme.dart';
import '../../../utils/custom_scroll_behavior.dart';
import '../../screens/splash/splash_binding.dart';
import '../../screens/splash/splash_view.dart';
import 'my_app_logic.dart';

class MyAppPage extends StatelessWidget {
  MyAppLogic appController = Get.put(MyAppLogic(), permanent: true);
  final logic = Get.find<MyAppLogic>();
  final state = Get.find<MyAppLogic>().state;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black, statusBarColor: Colors.transparent, systemStatusBarContrastEnforced: true ));
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      initialRoute: MyAppRoutes.splashScreen,
      translations: LangConfig(),
      theme: AppThemeData.appMainThemeData(),
      getPages: _getPages(),
    );
  }

  List<GetPage<dynamic>> _getPages() {
    return [
      GetPage(name: MyAppRoutes.splashScreen, page: () => SplashPage(), binding: SplashBinding()),
    ];

  }
}
