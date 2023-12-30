import 'package:dio/dio.dart';
import '../utils/PreferenceUtils.dart';
import '../utils/constansts.dart';
import 'api_state.dart';
import 'app_exception.dart';
import 'dio_exceptions.dart';

class ApiBaseHelper {
  ApiState apiState = ApiState();

  Future<dynamic> get(String url,{ String token = ''}) async {
    var responseJson;
    if(token != '') {
      await PreferenceUtils.init();
      apiState.requestHeaders['Authorization'] = 'Bearer ${PreferenceUtils.getString(AppConstants.PREF_KEY_AUTH_TOKEN)}';
      apiState.opt.headers = apiState.requestHeaders;
    }

    try {
      var response = await apiState.dio.get(apiState.baseUrl + url,options: apiState.opt);
      print(response.data);
      responseJson = response.data;
    } catch(error) {
      final errorMessage = DioExceptions.fromDioError(error as DioError).toString();
      print(errorMessage);
      throw FetchDataException(errorMessage);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic req, { String token = ''}) async {
    dynamic responseJson;
    if(token.isNotEmpty) {
      await PreferenceUtils.init();
      apiState.requestHeaders['Authorization'] = 'Bearer ${PreferenceUtils.getString(AppConstants.PREF_KEY_AUTH_TOKEN)}';
      apiState.opt.headers = apiState.requestHeaders;
    }
    try {
      Response response = await apiState.dio.post(apiState.baseUrl + url,options: apiState.opt, data: req);
      responseJson = response.data;
    } catch(error) {
      final errorMessage = DioExceptions.fromDioError(error as DioError);
      throw FetchDataException(errorMessage);
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, dynamic req, { String token = ''}) async {
    dynamic responseJson;
    if(token.isNotEmpty) {
      await PreferenceUtils.init();
      apiState.requestHeaders['Authorization'] = 'Bearer ${PreferenceUtils.getString(AppConstants.PREF_KEY_AUTH_TOKEN)}';
      apiState.opt.headers = apiState.requestHeaders;
    }
    try {
      Response response = await apiState.dio.delete(apiState.baseUrl + url,options: apiState.opt, data: req);
      responseJson = response.data;
    } catch(error) {
      final errorMessage = DioExceptions.fromDioError(error as DioError);
      throw FetchDataException(errorMessage);
    }
    return responseJson;
  }
}