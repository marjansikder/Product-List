import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:product_list/customWidgets/root_containers.dart';
import '../../style/theme.dart';
import '../../style/text_style.dart';

class CommonButtons{
  CommonButtons._privateConstructor();
  static final CommonButtons _instance = CommonButtons._privateConstructor();
  static CommonButtons get instance => _instance;

  TextButton getCommonTextButtons(String title,Function onPressed,{Color? bgColor,Color? textColor,}) => TextButton(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.all(0),
    ),
    onPressed: () {
      onPressed.call();
    },
    child: Container(
      width: Get.width,
      decoration: ContainerBoxDecorations.instance.getButtonBoxDecoration(),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonPaddingVertical),
      child: Align(
          alignment: Alignment.center,
          child: Text(title,style: getTextStyleDisplay(14,FontWeight.normal,AppColors.white),),
      )
    ),
  );

  TextButton getAnimatedButton(String title,Function onPressed,bool isEnabled,{Color? bgColor1,Color? textColor,}) => TextButton(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.all(0),
    ),
    onPressed: () {
      onPressed.call();
    },
    child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: Get.width,
        decoration: ContainerBoxDecorations.instance.getAnimatedButtonBoxDecoration(isEnabled,bgColor: bgColor1),
        padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonPaddingVertical),
        child: Align(
          alignment: Alignment.center,
          child: Text(title,style: getTextStyleDisplay(14,FontWeight.normal,AppColors.white),),
        )
    ),
  );


  TextButton getAshTextButtons(String title,Function onPressed,{Color? bgColor,Color? textColor,}) => TextButton(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.all(0),
    ),
    onPressed: () {
      onPressed.call();
    },
    child: Container(
        width: Get.width,
        decoration: ContainerBoxDecorations.instance.getAshButtonBoxDecoration(),
        padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonPaddingVertical),
        child: Align(
          alignment: Alignment.center,
          child: Text(title,style: getTextStyleDisplay(14,FontWeight.normal,AppColors.textAshBUttonColor),),
        )
    ),
  );
}