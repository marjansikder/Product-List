class MyAppRoutes {

  MyAppRoutes._privateConstructor();
  static final MyAppRoutes _instance = MyAppRoutes._privateConstructor();
  static MyAppRoutes get instance => _instance;

  static const splashScreen = '/';
  static const signInScreen = '/signInScreen';
  static const customerDetails = '/customerDetails';
  static const CustomerDetailsEdit = '/CustomerDetailsEdit';
  static const CustomerCreate = '/CustomerCreate';

}