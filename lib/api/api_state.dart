import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/server_addresses.dart';
import '../utils/PreferenceUtils.dart';

class ApiState {
  Dio dio = Dio();
  String baseUrl = ServerAddresses.baseUrl;
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  Options opt = Options(contentType:"application/json");

  ApiState() {
    PreferenceUtils.init();
    dio.interceptors.add(PrettyDioLogger());
    requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    baseUrl = ServerAddresses.baseUrl;
    opt = Options(headers:requestHeaders,contentType:"application/json");
  }
}