import 'package:flutter/material.dart';

import '../../style/theme.dart';

class CommonTextFields{
  CommonTextFields._privateConstructor();
  static final CommonTextFields _instance = CommonTextFields._privateConstructor();
  static CommonTextFields get instance => _instance;

  TextField getCommonTextView(TextEditingController textEditingController,String hintText,{Color? textColor, double? textSize,EdgeInsets? contentPadding,TextInputType? inputType,int? maxLength}) => TextField(
    controller: textEditingController,
    keyboardType: inputType??TextInputType.text,
    maxLength: maxLength??500,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColors.hintTextColor) ,
      border: InputBorder.none,
      counterText: '',
      contentPadding: contentPadding??EdgeInsets.symmetric(horizontal: 0,vertical: 6),
    ),
    style: TextStyle(
      color:AppColors.black
    ),
  );
}