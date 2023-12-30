import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style/theme.dart';
import 'colors.dart';

var cLargeLabelTextStyle =
TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: Colors.white);

var cLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFFFFFFF),
);

var titleTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: colorBlack,
);

var subTitleTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: colorBlack,
);

var subTitleTextStyle2 = GoogleFonts.notoSans(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  color: colorBlack,
);
var subTitleTextStyle3 = GoogleFonts.notoSans(
  fontSize: 13.0,
  fontWeight: FontWeight.normal,
  color: colorAccent,
);
var subTitleTextStyle4 = GoogleFonts.notoSans(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFF727272),
);

TextStyle getTextStyle(double sized,FontWeight? weight,Color? color){
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

var cAppBarTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFFFFFFFF),
);

var kTempTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 100.0,
);

var kMessageTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 60.0,
);

var kButtonTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 30.0,
);

var kConditionTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 100.0,
);

var introTitleTextStyle = GoogleFonts.hindSiliguri(
  //fontFamily: FONT_NAME,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.3
);

var barTitleTextStyle = GoogleFonts.hindSiliguri(
  //fontFamily: FONT_NAME,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    decoration: TextDecoration.underline
);

var homeTextStyle = GoogleFonts.hindSiliguri(
  //fontFamily: FONT_NAME,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
);

var homeTextStyle2 = GoogleFonts.hindSiliguri(
  //fontFamily: FONT_NAME,
  fontSize: 22,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var practiceTextStyle = GoogleFonts.hindSiliguri(
  //fontFamily: FONT_NAME,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
);
var homeTextSubStyle = GoogleFonts.hindSiliguri(
  //fontFamily: FONT_NAME,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var editTextStyle = GoogleFonts.hindSiliguri(
  //fontFamily: 'bangla3',
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var commonTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var menuTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 10,
  fontWeight: FontWeight.normal,
  color:Color(0xFF727272),
);

var commonTextStyleWhite = GoogleFonts.hindSiliguri(
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var commonTextStyleGrey = GoogleFonts.hindSiliguri(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: colorAsh,
);

var buttonTextStyle = GoogleFonts.hindSiliguri(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

//date_picker

const TextStyle defaultMonthTextStyle = TextStyle(
  color: AppColorsDate.defaultMonthColor,
  fontSize: Dimen.monthTextSize,
  fontWeight: FontWeight.w500,
);

const TextStyle defaultDateTextStyle = TextStyle(
  color: AppColorsDate.defaultDateColor,
  fontSize: Dimen.dateTextSize,
  fontWeight: FontWeight.w500,
);

const TextStyle defaultDayTextStyle = TextStyle(
  color: AppColorsDate.defaultDayColor,
  fontSize: Dimen.dayTextSize,
  fontWeight: FontWeight.w500,
);

class Dimen {
  Dimen._();

  static const double dateTextSize = 24;
  static const double dayTextSize = 11;
  static const double monthTextSize = 11;
}