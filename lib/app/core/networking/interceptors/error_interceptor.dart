import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Customize error handling
    String errorMessage;
    if (err.type == DioExceptionType.connectionTimeout) {
      errorMessage = "Connection Timeout";
    } else if (err.type == DioExceptionType.sendTimeout) {
      errorMessage = "Send Timeout";
    } else if (err.type == DioExceptionType.receiveTimeout) {
      errorMessage = "Receive Timeout";
    } else if (err.type == DioExceptionType.badResponse) {
      // When the server responds with a status code other than 200-299
      switch (err.response?.statusCode) {
        case 400:
          errorMessage = "Bad Request";
          break;
        case 401:
          errorMessage = "Unauthorized";
          break;
        case 403:
          errorMessage = "Forbidden";
          break;
        case 404:
          errorMessage = "Not Found";
          break;
        case 500:
          errorMessage = "Internal Server Error";
          break;
        default:
          errorMessage =
              "Received invalid status code: ${err.response?.statusCode}";
      }
    } else {
      errorMessage = "Unexpected Error";
    }


    Logger.printLog('Error: $errorMessage');
    super.onError(err, handler);
  }
}
