import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../../utils/PreferenceUtils.dart';
import '../../../utils/constansts.dart';
import '../../api/base_controller.dart';
import '../home.dart';
import '../sign_in/view.dart';
import 'splash_state.dart';

class SplashLogic extends BaseController {
  final SplashState state = SplashState();

  @override
  void onReady() {
    super.onReady();
    //_splashScreenTimer();
    _splashScreen();
  //  Get.offAll(() => HomeScreen(),transition: Transition.native,duration: const Duration(milliseconds: 1000),curve:Curves.easeInCubic );
  }

  _splashScreenTimer(){
    Timer( const Duration(seconds: AppConstants.SPLASH_SCREEN_DURATION), () async{
      //save token
      await PreferenceUtils.init();
      var token = PreferenceUtils.getString(AppConstants.PREF_KEY_AUTH_TOKEN);
      if(token.isNotEmpty){
        Get.offAll(() => HomeScreen(),transition: Transition.native,duration: const Duration(milliseconds: 1000),curve:Curves.easeInCubic );
      } else
        Get.offAll(() => SignInPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
    });
  }

  _splashScreen(){
    Timer( const Duration(seconds: AppConstants.SPLASH_SCREEN_DURATION), () async {
      Get.to(() => HomeScreen(), transition: Transition.native,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInCubic);
    });
    }


}
