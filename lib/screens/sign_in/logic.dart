import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../../repositories/all_repository.dart';
import '../../../utils/PreferenceUtils.dart';
import '../../../utils/constansts.dart';
import '../../api/base_controller.dart';
import '../home.dart';
import 'state.dart';

class SignInLogic extends BaseController {
  final SignInState state = SignInState();


  @override
  void onReady() {
    super.onReady();
    state.emailAddressController.addListener(() {
      _formValidation();
    });
    state.passwordController.addListener(() {
      _formValidation();
    });
  }

  void _formValidation(){
    if(state.emailAddressController.text.isEmpty){
      state.isButtonEnable.value = false;
      return;
    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(state.emailAddressController.text)){
      state.isButtonEnable.value = false;
      return;
    }else if(state.passwordController.text.isEmpty){
      state.isButtonEnable.value = false;
      return;
    }
    state.isButtonEnable.value = true;
  }

  void adminLoginCall() async{
    await PreferenceUtils.init();

    try{
      state.isLoading.value = true;
      var resp = await AllRepository.adminLogin(
          state.emailAddressController.text,
          state.passwordController.text,
      );
      state.isLoading.value = false;
      if(resp.message == 'Success'){
        var token = resp.data?.token ?? '';
        PreferenceUtils.setString(AppConstants.PREF_KEY_AUTH_TOKEN,token);
        //save token
        PreferenceUtils.init();
        PreferenceUtils.getString(AppConstants.PREF_KEY_AUTH_TOKEN,token);
        Get.offAll(() => HomeScreen(), transition: Transition.native, duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
      }else{
        Get.offAll(() => HomeScreen(), transition: Transition.native, duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
      }
    }catch(e){
      state.isLoading.value = false;

    }
  }

  }

