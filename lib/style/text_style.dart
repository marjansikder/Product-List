import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../customWidgets/root_containers.dart';
import '../style/theme.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';


String FONT_NAME = 'Lato';
String FONT_NAME2 = 'arial';
String FONT_NAME3 = 'Rubik';


var cLargeLabelTextStyle =
TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white);

var cLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFFFFFFF),
);

var cAppBarTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);

var kTempTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 100.0,
);

var kMessageTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 60.0,
);

var kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: FONT_NAME,
);

var kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

var introTitleTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
);

var introSubTitleTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 13,
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);

var barTitleTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
);


var barTitleTextStyle2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

var homeTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
);

var homeTextStyle2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 22,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);
var homeTextStyle20 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);
var homeTextStyle16 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var leaderboardStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var practiceTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
);

var practiceTextStyle2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.deepOrangeAccent,
);

var practiceTextStyle3 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);
var homeTextSubStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var editTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var commonTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var commonTextStyleB = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 17,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

var menuTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 10,
  fontWeight: FontWeight.normal,
  color:Color(0xFF727272),
);

var commonTextStyleWhite = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var commonTextStyleWhite2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var commonTextStyleGrey = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Color(0xFF727272),
);

var buttonTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var buttonDecoration = BoxDecoration(
  borderRadius:  BorderRadius.circular(8),
  color: Color(0xFFF2AB12),
   );


TextStyle getTextStyleDisplay(double sized,FontWeight weight,Color color){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,
  );
}
TextStyle getTextStyleAsap(double sized,FontWeight weight,Color color){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,
  );
}


TextStyle getTextStyle(double sized,FontWeight? weight,Color? color){
  return TextStyle(
    fontFamily: FONT_NAME3,
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null? textColor:color,
    height: 1.1
  );
}
TextStyle getArialTextStyle(double sized,FontWeight? weight,Color? color){
  return TextStyle(
      fontFamily: FONT_NAME2,
      fontSize: sized,
      fontWeight: weight == null?FontWeight.normal:weight,
      color: color == null?Colors.black:color,
      height: 1.1
  );
}

void ShowDialog(String title, String body, {required VoidCallback onConfirm, required VoidCallback onCancel}){
  Get.defaultDialog(
    title: title,
    titlePadding: EdgeInsets.only(top: 15),
    titleStyle: TextStyle(
      fontSize: 24.0,
      color: Colors.red,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      fontFamily: FONT_NAME,
    ),
    content: Padding(
      padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 16),
      child: Text(
        body,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: FONT_NAME,
        ),
      ),
    ),
    confirm: Padding(
      padding: const EdgeInsets.only(left:24.0, right:24, top: 16, bottom: 24),
      child: GestureDetector(
        onTap: onConfirm,
        child: Container(
          height: 25,
          width: 50,
          decoration:RootContainers.instance.getBoxDecorations(AppColors.greenButton,5) ,

          child: Center(
            child: Text(
              "Ok".tr,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: FONT_NAME
              ),
            ),
          ),
        ),
      ),
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(left:24.0, right:24, top: 16, bottom: 16),
      child: GestureDetector(
        onTap: onCancel,
        child: Container(
          height: 25,
          width: 50,
          decoration:RootContainers.instance.getBoxDecorations(AppColors.red,5) ,
          child: Center(
            child: Text(
              "Back".tr,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: FONT_NAME
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void showSingleCustomDialogBox(BuildContext context, String title,String errors,String? leftButtonText,String? rightButtonText,{required VoidCallback onConfirm}) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: getTextStyle(20, FontWeight.bold, colorAccentLight),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(errors,style: getTextStyle2(14, FontWeight.normal, Colors.black),),
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: onConfirm,
                    child: Container(
                        decoration: BoxDecoration(
                          color: colorPrimaryDark,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        height: 50,
                        child: Center(child: Text(rightButtonText??' OK '.tr,style: getTextStyle(14, FontWeight.bold, Colors.white),))
                    ),
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
void ShowDialogSingleButton(String title, String body, {required VoidCallback onConfirm, required VoidCallback onCancel}){
  Get.defaultDialog(
    backgroundColor: AppColors.priceShowColor,
    title: title,
    titleStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        fontFamily: FONT_NAME
    ),
    content: Padding(
      padding: const EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 2),
      child: Text(
        body,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: FONT_NAME,
        ),
      ),
    ),
    confirm: Padding(
      padding: const EdgeInsets.only(left:24.0, right:24, top: 12, bottom: 12),
      child: GestureDetector(
        onTap: onConfirm,
        child: Container(
          width: 100,
          color: AppColors.greenButton,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Text(
                " OK ".tr,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: FONT_NAME
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

var colorAsh = Color(0xFFF2F2F2);
var colorAshDeep = Color(0xF727272);

