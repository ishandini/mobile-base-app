import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_template/core/network/responses/base_response.dart';
import 'package:flutter_app_template/core/services/locale/app_localizations.dart';
import 'package:flutter_app_template/core/di/injection.dart';

class APIException extends Equatable implements Exception {
  APIException.initWithResponse(BaseResponse response)
      : message = response.message,
        title = null;

  APIException.initWithException(exception)
      : message = _resolveMessage(exception),
        title = _resolveTitle(exception);

  const APIException({required this.message, required this.title});

  final String? message;
  final String? title;

  static String? _resolveTitle(dynamic exception) {
    if (exception is DioException) {
      final localizations = sl<AppLocalizations>();
      if (exception.type == DioExceptionType.connectionError) {
        return localizations.translate('api_exception_lbl_connection_error');
      } else if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.receiveTimeout) {
        return localizations.translate('api_exception_lbl_request_timeout');
      } else if (exception.response != null) {
        final rawTitle = exception.response?.data?['error'];
        return switch (exception.response?.statusCode) {
          400 => rawTitle ??
              localizations
                  .translate('api_exception_lbl_something_wrong_400'),
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
    }
    return null;
  }

  static String? _resolveMessage(dynamic exception) {
    if (exception is DioException) {
      final localizations = sl<AppLocalizations>();
      if (exception.type == DioExceptionType.connectionError) {
        return localizations.translate('api_exception_lbl_unable_to_connect');
      } else if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.receiveTimeout) {
        return localizations.translate('api_exception_lbl_took_too_long');
      } else if (exception.response != null) {
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
              localizations
                  .translate('api_exception_lbl_something_wrong_end'),
          _ => rawMessage ??
              localizations.translate('api_exception_lbl_try_again'),
        };
      } else if (exception.response?.data != null) {
        final baseR = BaseResponse.fromJson(exception.response?.data, (v) {});
        return baseR.message;
      }
    }
    return null;
  }

  static String messageFrom(Object e, [String fallback = 'Something went wrong']) {
    if (e is DioException && e.error is APIException) {
      return (e.error as APIException).message ?? fallback;
    }
    if (e is APIException) return e.message ?? fallback;
    return e.toString().replaceFirst('Exception: ', '');
  }

  @override
  List<Object?> get props => [message, title];
}

class HashValidationException implements Exception {
  const HashValidationException(this.message, {this.response});

  final String message;
  final dynamic response;

  @override
  String toString() => 'HashValidationException: $message';
}
