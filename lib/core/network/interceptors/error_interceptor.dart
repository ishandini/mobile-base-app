import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/utils/common.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = APIException.initWithException(err);
    logger.e('API Error: ${exception.title} - ${exception.message}');
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      error: exception,
      type: err.type,
    ));
  }
}
