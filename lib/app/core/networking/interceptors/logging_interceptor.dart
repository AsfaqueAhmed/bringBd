import 'dart:convert';

import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.printLog('Request [${options.method}] => PATH: ${options.path}');
    Logger.printLog('Request Headers: ${options.headers}');
    Logger.printLog('Request Data: ${jsonEncode(options.data)}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.printLog(
        'Response [${response.statusCode}] => PATH: ${response.requestOptions.path}');
    Logger.printLog('Response Data: ${jsonEncode(response.data)}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Logger.printLog(
        'Error [${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    Logger.printLog('Error Message: ${err.message}');
    super.onError(err, handler);
  }
}
