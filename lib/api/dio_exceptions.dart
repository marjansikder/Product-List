import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../utils/constansts.dart';

class DioExceptions implements Exception {

  dynamic message = '';

  DioExceptions.fromDioError(DioError dioError) {

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = AppStrings.CONNECTION_CANCELED;
        break;
      case DioExceptionType.connectionTimeout:
        message = AppStrings.CONNECTION_TIME_OUT_ERROR;
        break;
      case DioExceptionType.receiveTimeout:
        message = AppStrings.CONNECTION_TIME_OUT_ON_RECEIVED;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioExceptionType.sendTimeout:
        message = AppStrings.CONNECTION_TIME_OUT_ON_SEND;
        break;
      default:
        message = AppStrings.CONNECTION_ERROR_NO_INTERNET;
        break;
    }
  }


  dynamic _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error["error"];
      case 404:
        return error["error"];
      case 500:
        return error["error"];
      case 422:
        return error["error"];
      case 401:
        //Get.offAll(()=>MobileNumberScreenPage(), binding: MobileNumberScreenBinding());
        //TODO(Handle unauthentica)
        return null;
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}