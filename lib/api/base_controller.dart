import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../style/text_style.dart';
import '../../style/theme.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../customWidgets/root_containers.dart';
import '../models/base_response.dart';
import '../repositories/all_repository.dart';
import 'base_states.dart';

abstract class BaseController extends GetxController{

  final AllRepository _authenticationRepository = AllRepository();
  AllRepository get authenticationRepository =>
      _authenticationRepository;

  void executeNetworkRequest<T extends Object?>(BaseState state,
      Function executeCall,
      Function (T?,List<String>? message) doOnSuccess,
      {Function()? doOnLoading,Function()? doOnError})async{
      try{
        doOnLoading == null?state.isLoading.value = true:doOnLoading.call();
        BaseResponse<T?> response = await executeCall();
        doOnLoading == null?state.isLoading.value = false:null;
        if(response.success!){
            doOnSuccess.call(response.data,response.message);
        }else{
            _doOnError(errorFunction: doOnError,messages: response.message);
        }
      }catch(e){
        print('.......................'+e.toString());
        print(e.toString());
        doOnLoading == null?state.isLoading.value = false:null;
        _doOnError(errorFunction: doOnError);
      }
  }

  void _doOnError({Function()? errorFunction,List<String>? messages}){
    if(errorFunction != null){
      errorFunction.call();
    }else{
      if(messages != null){
        showSnakbar(message: messages.join("\n"));
      }else{
        showSnakbar(message: "Something went wrong please try again".tr);
      }
    }
  }

  showSnakbar({String? title, String? message}){
    Get.snackbar(
      title??"Error", message??"Something went wrong",
      borderRadius: 0,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red
    );
  }


  showListSnakbar({String? title, List<String>? message}){
    Get.snackbar(
        title??"Error", message.toString(),
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red
    );
  }


  String timeFormationForTime(String? dateTime){
    if(dateTime != null) {
      var dateValue = DateFormat("HH:mm:ss","en").parse(dateTime);
      return DateFormat("hh:mm aaa").format(dateValue);
    }
    return "N/A";
  }

  String dateFormationForDate(String? dateTime){
    if(dateTime != null) {
      var dateValue = DateFormat("yyyy-MM-dd hh:mm:ss","en").parse(dateTime);
      return DateFormat("dd MMM,yyyy").format(dateValue);
    }
    return "N/A";
  }

  String isoDateFormation(String? dateTime){
    if(dateTime != null) {
      var dateValue = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
      return DateFormat("yyyy-MM-dd").format(dateValue);
    }
    return "N/A";
  }

  void showCustomDialogBox(BuildContext context, String title,String errors,String? leftButtonText,String? rightButtonText,{required VoidCallback onConfirm, required VoidCallback onCancel}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(36),
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title,style: getTextStyle2(20, FontWeight.bold, colorAccentLight),),
                    SizedBox(height: 20,),
                    Text(errors,style: getTextStyle2(14, FontWeight.normal, Colors.black),),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: onCancel,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: colorAccent,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                                height: 50,
                                child: Center(child: Text(leftButtonText??'Back'.tr,style: getTextStyle2(14, FontWeight.bold, Colors.white),))
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: onConfirm,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: colorPrimaryDark,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                height: 50,
                                child: Center(child: Text(rightButtonText??'Okay'.tr,style: getTextStyle2(14, FontWeight.bold, Colors.white),))
                            ),
                          ),
                        )],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}