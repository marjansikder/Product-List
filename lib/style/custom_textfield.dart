import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String validatorMessage;
  final Color fillColor;

  CustomTextField(
      {required this.controller,
        required this.hintText,
        required this.textInputType,
        required this.maxLine,
        required this.focusNode,
        required this.nextNode,
        required this.textInputAction,
        this.isPhoneNumber = false,
        this.isValidator=false,
        required this.validatorMessage,
        required this.fillColor});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:Colors.grey[200],
        borderRadius: isPhoneNumber ? BorderRadius.all(Radius.circular(6)) : BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color:Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine,
        maxLength: isPhoneNumber ? 15 : null,
        focusNode: focusNode,
        keyboardType: textInputType,
        //keyboardType: TextInputType.number,
        initialValue: null,
        textInputAction: textInputAction,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        //auto validate: true,
        inputFormatters: [isPhoneNumber ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter],
        validator: (input){

            if(isValidator){
              return validatorMessage;
            }

          return null;

        },
        decoration: InputDecoration(
          hintText: hintText,
          filled: fillColor != null,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
          isDense: true,
          counterText: '',
          hintStyle: TextStyle(),
          errorStyle: TextStyle(height: 1.5),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
