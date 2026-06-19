import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_template/core/network/responses/base_response.dart';

class APIException extends Equatable implements Exception {
  APIException.initWithResponse(BaseResponse response)
      : message = response.message,
        title = null;

  APIException.initWithException(Object exception)
      : message = exception is DioException
            ? exception.message ?? exception.toString()
            : exception.toString(),
        title = null;

  const APIException({required this.message, required this.title});

  final String? message;
  final String? title;

  static String messageFrom(
    Object e, [
    String fallback = 'Something went wrong',
  ]) {
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
