class AppStrings{
  static String SIGN_IN = "Log In";
  static String SUBMIT = "Submit";

  static String NAME_HINT = "Enter Your Name";
  static String EMAIL_HINT = "Enter Your Email";
  static String PASSWORD_HINT = "Enter Password";


  static String RESEND_NOW = "Resend now";
  static String RESEND_THE_OTP_AFTER = "Resend the otp after";
  AppStrings._privateConstructor();
  static final AppStrings _instance = AppStrings._privateConstructor();
  static AppStrings get instance => _instance;

  static const String APP_NAME = 'Blog App';
  static const String CONNECTION_TIME_OUT_ERROR = 'Connection timeout with API server';
  static const String CONNECTION_CANCELED = 'Request to API server was cancelled';
  static const String CONNECTION_TIME_OUT_ON_RECEIVED = 'Receive timeout in connection with API server';
  static const String CONNECTION_TIME_OUT_ON_SEND = 'Send timeout in connection with API server';
  static const String CONNECTION_ERROR_NO_INTERNET = 'Connection to API server failed due to internet connection';

}

class AppConstants{

  AppConstants._privateConstructor();
  static final AppConstants _instance = AppConstants._privateConstructor();
  static AppConstants get instance => _instance;

  static const int SPLASH_SCREEN_DURATION = 2;
  static const String DEVICE_TOKEN = "2OEL4P1Rz04-2OEL4P1Rz04-2OEL4P1Rz04-2OEL4P1Rz04";
  static const String PREF_KEY_AUTH_TOKEN = "bearer_token";
}

