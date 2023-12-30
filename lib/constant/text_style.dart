import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style/theme.dart';
import 'colors.dart';

String FONT_NAME = 'Hind Siliguri';
String FONT_NAME2 = 'lato';


TextStyle getTextStyle1(double sized,FontWeight? weight,Color? color){
  return GoogleFonts.hindSiliguri(
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,

  );
}
TextStyle getTextStyleBarlow(double sized,FontWeight? weight,Color? color){
  return GoogleFonts.barlow(
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,

  );
}

TextStyle getTextStyleNotoSans(double sized,FontWeight? weight,Color? color){
  return GoogleFonts.firaSans(
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,

  );
}

TextStyle getTextStyle2(double sized,FontWeight? weight,Color? color){
  return GoogleFonts.notoSans(
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,
  );
}

TextStyle getTextStyleTab(double sized,FontWeight? weight){
  return GoogleFonts.notoSans(
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
  );
}

TextStyle getTextStyle(double sized,FontWeight? weight,Color? color){
  return TextStyle(
      fontFamily: FONT_NAME,
      fontSize: sized,
      fontWeight: weight == null?FontWeight.normal:weight,
      color: color == null?Colors.black:color,
      height: 1.5
  );
}

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


void showCustomDialogBox(BuildContext context, String title, String errors,
    String? leftButtonText, String? rightButtonText,
    {required VoidCallback onConfirm, required VoidCallback onCancel}) {
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
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: getTextStyle2(
                      20, FontWeight.bold, AppColors.tabSelectedColor),),
                  SizedBox(height: 20,),
                  Text(errors,
                    style: getTextStyle2(14, FontWeight.normal, Colors.black),),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onCancel,
                          child: Container(
                              decoration: BoxDecoration(
                                color: colorPrimaryDark,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              height: 50,
                              child: Center(child: Text(
                                leftButtonText ?? 'Back',
                                style: getTextStyle2(
                                    14, FontWeight.bold, Colors.white),))
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: onConfirm,
                          child: Container(
                              decoration: BoxDecoration(
                                color: colorAccent,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                              height: 50,
                              child: Center(child: Text(
                                rightButtonText ?? 'Okay',
                                style: getTextStyle2(
                                    14, FontWeight.bold, Colors.white),))
                          ),
                        ),
                      )
                    ],
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