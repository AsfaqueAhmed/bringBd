import 'package:bring_me_bd/app/core/controllers/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TokenInterceptor extends InterceptorsWrapper {
  TokenInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await Get.find<AuthController>().token();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
