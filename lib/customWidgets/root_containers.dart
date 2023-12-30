import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/theme.dart';

class RootContainers{
  RootContainers._privateConstructor();
  static final RootContainers _instance = RootContainers._privateConstructor();
  static RootContainers get instance => _instance;

  SafeArea getScaffoldRootContainer<T extends Widget>(T childContainers,{BoxDecoration? boxDecoration}) => SafeArea(
    child: Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: boxDecoration,
        child: childContainers,
      ),
    ),
  );
  BoxDecoration getBoxDecorations(Color color,double radius){
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
    );
  }
}

class ContainerBoxDecorations{
  ContainerBoxDecorations._privateConstructor();
  static final ContainerBoxDecorations _instance = ContainerBoxDecorations._privateConstructor();
  static ContainerBoxDecorations get instance => _instance;

  BoxDecoration getGradientBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Colors.lightBlueAccent,
          Colors.lightBlueAccent,

        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  BoxDecoration getTextBorderStyle() => BoxDecoration(
    color: AppColors.textFieldBackGround.withOpacity(.35),
    borderRadius: BorderRadius.all(Radius.circular(3.0)),
  );
  BoxDecoration getBoxBorderStyle() => BoxDecoration(
    border: Border.all(color: AppColors.textFieldBackGround,),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  BoxDecoration getTextBorderStyleBlue() => BoxDecoration(
    border: Border.all(color: AppColors.splashBackGround,),
    borderRadius: BorderRadius.all(Radius.circular(3.0)),
  );

  BoxDecoration getButtonBoxDecoration({Color? bgColor}) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppSizes.backButtonWidth),
      color: bgColor??AppColors.buttonColor,
  );

  BoxDecoration getAnimatedButtonBoxDecoration(bool isEnable,{Color? bgColor}) => BoxDecoration(
    borderRadius: BorderRadius.circular(AppSizes.backButtonWidth),
    color: isEnable?bgColor??AppColors.takaColor:AppColors.ashTextColor,
  );

  BoxDecoration getAshButtonBoxDecoration({Color? bgColor}) => BoxDecoration(
    borderRadius: BorderRadius.circular(AppSizes.buttonCornerRadius),
    color: bgColor??AppColors.ashButtonColor,
  );

  BoxDecoration getImageBgBoxDecoration(String imagePath) => BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      )
  );


}