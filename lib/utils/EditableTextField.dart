import 'package:flutter/material.dart';

import '../../style/text_style.dart';
import '../../style/theme.dart';


class CustomTextFieldEdit extends StatelessWidget{
   const CustomTextFieldEdit(
      this._hintText,
      this._controller,
      this.textInputType,
      {this.onTextChange,
        this.obscureText}
      );
  final String _hintText;
  final TextEditingController _controller;
  final TextInputType textInputType;
  final ValueChanged<String>? onTextChange;
  final bool? obscureText;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        height: 50,
        decoration: new BoxDecoration(
            color: AppColors.ashButtonColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(5.0),
              topRight: const Radius.circular(5.0),
              bottomLeft: const Radius.circular(5.0),
              bottomRight: const Radius.circular(5.0),
            )
        ),

        child: TextField(
            obscureText: obscureText??false,
            autofocus: false,
            onChanged: onTextChange,
            controller: _controller,
            showCursor: true,
            keyboardType: textInputType,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintText: _hintText,
              hintStyle: getTextStyle(14,FontWeight.normal, Colors.black),
              border: InputBorder.none,
            )
        ),
      ),
    );
  }
}