import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../style/text_style.dart';

class CustomActionbar extends StatelessWidget {
  final String headerString;
  Function? backPressed = null;
  Widget? rightView = null;
  CustomActionbar(this.headerString,this.backPressed,{this.rightView});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      color: Colors.blueAccent,
      width: Get.width,
      child: Stack(
        children: [
          Visibility(
            visible: backPressed == null?false:true,
            child: GestureDetector(
                onTap:(){
                  if (backPressed != null) backPressed!.call();
                },
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back_sharp, size: 28, color: Colors.white,),
                ),),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(headerString,
                style: getTextStyle(20,FontWeight.bold, Colors.white,),),
            ),
          ),
          Visibility(
            visible: rightView == null?false:true,
            child: Positioned(
              right: 10,
              child: rightView??Container()
            ),
          ),
        ],
      ),
    );
  }
}
