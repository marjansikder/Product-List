import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/text_style.dart';
import 'theme.dart';

class CustomButtons{
  CustomButtons._privateConstructor();
  static final CustomButtons _instance = CustomButtons._privateConstructor();
  static CustomButtons get instance => _instance;

  TextButton commonTextButtons(String text,void onPressButton(),Color? bgColor,Color? textColor){
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: textColor == null?Colors.white:textColor, padding: EdgeInsets.only(top: 10,bottom: 10,left: 40,right: 40),
        backgroundColor: bgColor == null ? AppColors.splashBackGround:bgColor,
        textStyle: getTextStyle(
            15,
          FontWeight.normal,
          Colors.white
        ),
      ),
      onPressed: () {
        onPressButton.call();
      },
      child: Text(text),
    );
  }

  TextButton commonTextButtons1(String text,void onPressButton(),Color? bgColor,Color? textColor){
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: textColor == null?Colors.white:textColor, padding: EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
        backgroundColor: bgColor == null ? AppColors.splashBackGround:bgColor,
        textStyle: getTextStyle(
            14,
            FontWeight.normal,
            Colors.white
        ),
      ),
      onPressed: () {
        onPressButton.call();
      },
      child: Text(text),
    );
  }

  TextButton endIconButton(String text,void onPressButton(),Color? bgColor,Color? textColor,Icon ic, double? borderRadius, Color? borderColor,
      {EdgeInsets? margin, double? fontSize}){
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(margin??EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20)),
        backgroundColor: MaterialStateProperty.all<Color>(bgColor == null?AppColors.splashBackGround:bgColor),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
          color: textColor == null?Colors.white:textColor,
          fontSize: fontSize??20,),),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius??4.0),
                side: BorderSide(color: borderColor??(bgColor == null?AppColors.splashBackGround:bgColor))
            )
        ),
      ),
      onPressed: () {
        onPressButton.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 9, child: Align(alignment:Alignment.center,child: Text(text,style: getTextStyle(fontSize??14,null, textColor)))),
          Expanded(flex:1,child: ic),
        ],
      ),
    );
  }

  TextButton commonFormButton(String text,void onPressButton(),Color? bgColor,Color? textColor){
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: textColor == null?Colors.white:textColor, padding: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
        backgroundColor: bgColor == null?AppColors.splashBackGround:bgColor,
        textStyle: TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: () {
        onPressButton.call();
      },
      child: Row(
        children: [
          Expanded(flex: 9, child: Align(alignment:Alignment.centerLeft,child: Text(text,style: getTextStyle(14,null, textColor)))),
        ],
      ),
    );
  }


}