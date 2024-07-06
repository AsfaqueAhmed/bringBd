import 'package:bring_me_bd/app/core/networking/interceptors/error_interceptor.dart';
import 'package:bring_me_bd/app/core/networking/interceptors/logging_interceptor.dart';
import 'package:bring_me_bd/app/core/networking/interceptors/token_interceptor.dart';
import 'package:bring_me_bd/env.dart';
import 'package:dio/dio.dart';

abstract class DioClient {

  static Dio createDio() {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    ));


    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(TokenInterceptor());

    return dio;
  }
}
