import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/services/locale/app_localizations.dart';
import 'package:flutter_app_template/core/utils/common.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor({required this.localizations});

  final AppLocalizations localizations;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is HashValidationException) {
      return handler.next(err);
    }
    final exception = _resolve(err);
    logger.e('API Error: ${exception.title} - ${exception.message}');
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      error: exception,
      type: err.type,
    ));
  }

  APIException _resolve(DioException err) => APIException(
        title: _resolveTitle(err),
        message: _resolveMessage(err),
      );

  String? _resolveTitle(DioException exception) {
    if (exception.type == DioExceptionType.connectionError) {
      return localizations.translate('api_exception_lbl_connection_error');
    }
    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return localizations.translate('api_exception_lbl_request_timeout');
    }
    if (exception.response != null) {
      final rawTitle = exception.response?.data?['error'];
      return switch (exception.response?.statusCode) {
        400 => rawTitle ??
            localizations.translate('api_exception_lbl_something_wrong_400'),
        401 => rawTitle ??
            localizations.translate('api_exception_lbl_unauthorized_401'),
        403 => rawTitle ??
            localizations.translate('api_exception_lbl_access_denied_403'),
        404 => rawTitle ??
            localizations.translate('api_exception_lbl_not_found_404'),
        500 => rawTitle ??
            localizations.translate('api_exception_lbl_server_error_500'),
        _ => rawTitle ??
            localizations.translate('api_exception_lbl_unexpected_error'),
      };
    }
    return null;
  }

  String? _resolveMessage(DioException exception) {
    if (exception.type == DioExceptionType.connectionError) {
      return localizations.translate('api_exception_lbl_unable_to_connect');
    }
    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return localizations.translate('api_exception_lbl_took_too_long');
    }
    if (exception.response != null) {
      final rawMessage = exception.response?.data?['message'];
      return switch (exception.response?.statusCode) {
        400 => rawMessage ??
            localizations.translate('api_exception_lbl_request_incorrect'),
        401 => rawMessage ??
            localizations.translate('api_exception_lbl_log_in_required'),
        403 => rawMessage ??
            localizations.translate('api_exception_lbl_no_permission'),
        404 => rawMessage ??
            localizations.translate('api_exception_lbl_couldnt_find_page'),
        500 => rawMessage ??
            localizations.translate('api_exception_lbl_something_wrong_end'),
        _ => rawMessage ??
            localizations.translate('api_exception_lbl_try_again'),
      };
    }
    return null;
  }
}
