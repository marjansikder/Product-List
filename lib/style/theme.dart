import 'package:flutter/material.dart';

class AppSizes {
  static double titleTextSize1 = 16;
  static double textWidgetPadding = 16;
  static double otpFieldHeight = 45;
  static double bigTextStyle = 24;

  static double dashboardExploreHeight = 180;

  static double textWidgetHeight = 60;
  AppSizes._privateConstructor();
  static final AppSizes _instance = AppSizes._privateConstructor();
  static AppSizes get instance => _instance;

  static const double splashScreenLogiSize = 200;
  static const double defaultTextSize = 14;
  static const double mediumTextSize = 12;
  static const double backButtonWidth = 10;
  static const double backButtonHeight = 16;
  static const double buttonPaddingVertical = 14;
  static const double buttonCornerRadius = 168;

}
class AppColors {
  AppColors._privateConstructor();
  static final AppColors _instance = AppColors._privateConstructor();
  static AppColors get instance => _instance;

  static const colorBackGround= Color(0xFF2E2121);
  static const colorDot= Color(0xFFD9D9D9);
  static const ratingCountNumber= Color(0xFF4A4A4A);
  static const brownBorderColor= Color(0xFF7E1416);
  static const AshBackGround= Color(0xFFEEEEEE);
  static const splashText= Color(0xFF7C7C7C);
  static const splashTextBlack= Color(0xFF292929);
  static const textFieldBackGround= Color(0xFFE6E6E6);
  static const hintTextColor= Color(0xFFB0B0B0);
  static const whiteTextColor= Color(0xFFFFFFFF);
  static const yellowTextColor= Color(0xFFFCB717);
  static const bgTextColor= Color(0xFF016698);
  static const boxBgColor= Color(0xFFF4F1EB);
  static const circleBgColor= Color(0xFFD1BEFC);
  static const boxColor= Color(0xFFFAE8DC);
  static const circleTextColor= Color(0xFF4A0A0B);
  static const circleRightColor= Color(0xFF303030);
  static const colorPrimaryLight = Color(0xFF00C4D4);
  static const black = Color(0xFF222222);
  static const white = Color(0xFFFFFFFF);
  static const textColorBlack = Color(0xFF2B2B2E);
  static const textColorFade = Color(0xFF8E8E93);
  static const textColorRed = Color(0xFF96181A);
  static const orange = Color(0xFFFF8A65);
  static const red = Color(0xFFEF5350);
  static const borderColor = Color(0xFFF2F2F7);
  static const splashBackGround = Color(0xFFDFDFDF);
  static const buttonColor = Color(0xff812325);
  static const colorAccentLightFade = Color(0xffFDF1EE);
  static const colorAccentFade = Color(0xffFFD9CE);
  static const colorBlack = Color(0xff101010);
  static const grayLine = Color(0xffC9C9C9);
  static const colorAsh = Color(0xff888888);
  static const colorGrayDeep = Color(0xff727272);
  static const colorGray = Color(0xffF4F5F9);
  var colorTransparent = Color(0xffF4F5F9).withOpacity(0.0);
  static const colorLightBg = Color(0xffF4F5F9);
  static const colorTextFormButtons = Color(0xff888888);
  static const commentTextColor = Color(0xff848484);
  static const greyTextColor = Color(0xff6D6B6B);
  static const tabUnselectedColor = Color(0xFF9DA0A3);
  static const textAshBUttonColor = Color(0xFF3B4148);
  static const tabSelectedColor = Color(0xFF226CC3);
  static const explorePkgBg = Color(0xffE2ECF0);
  static const smallTextColor = Color(0xffA0A0A0);
  static const ashButtonColor = Color(0xffE6E7E8);
  static const ashTextColor = Color(0xff767676);
  static const bgColor = Color(0xffF5F5F5);
  static const takaColor = Color(0xff1F93C3);
  static const priceShowColor = Color(0xffe8f0ff);
  static const textLightColor = Color(0xff717171);
  static const textFieldTopColor = Color(0xff1C1C1E);
  static const greenButton = Color(0xff18a558);
}

class AppThemeData{
  AppThemeData._privateConstructor();
  static final AppThemeData _instance = AppThemeData._privateConstructor();
  static AppThemeData get instance => _instance;

  static ThemeData appMainThemeData() => ThemeData(
    primaryColor: AppColors.splashBackGround,
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
  );
}