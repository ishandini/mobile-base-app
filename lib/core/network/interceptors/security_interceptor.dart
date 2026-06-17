import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/utils/common.dart';

class SecurityInterceptor extends Interceptor {
  SecurityInterceptor({required this.secretKey});

  final String secretKey;

  static const String payloadHashHeader = 'X-Payload-Hash';
  static const String timestampHeader = 'X-Timestamp';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String payloadHash = '';

    if (options.data != null) {
      final payload =
          options.data is String ? options.data : jsonEncode(options.data);
      payloadHash = _generateHash(payload, timestamp);
    } else if (options.queryParameters.isNotEmpty) {
      final stringParams = options.queryParameters.map(
        (k, v) => MapEntry(k, v?.toString() ?? ''),
      );
      final queryString = Uri(queryParameters: stringParams).query;
      payloadHash = _generateHash(queryString, timestamp);
    } else {
      payloadHash = _generateHash('', timestamp);
    }

    options.headers[payloadHashHeader] = payloadHash;
    options.headers[timestampHeader] = timestamp;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      if (response.headers.map.containsKey(payloadHashHeader.toLowerCase()) &&
          response.headers.map.containsKey(timestampHeader.toLowerCase())) {
        final responseHash = response.headers.value(payloadHashHeader);
        final timestamp = response.headers.value(timestampHeader);

        if (responseHash != null && timestamp != null) {
          String calculatedHash = '';

          if (response.data != null) {
            final payload = response.data is String
                ? response.data
                : jsonEncode(response.data);
            calculatedHash = _generateHash(payload, timestamp);
          } else {
            calculatedHash = _generateHash('', timestamp);
          }

          if (calculatedHash != responseHash) {
            logger.e('Response payload hash verification failed!');
            final exception = HashValidationException(
                'Response integrity check failed',
                response: response);

            final dioError = DioException(
              requestOptions: response.requestOptions,
              error: exception,
              type: DioExceptionType.badResponse,
              response: response,
            );
            return handler.reject(dioError);
          }
        }
      }

      super.onResponse(response, handler);
    } catch (e) {
      logger.e('Error verifying response hash: $e');
      final dioError = DioException(
        requestOptions: response.requestOptions,
        error: 'Hash verification error: $e',
        response: response,
      );
      return handler.reject(dioError);
    }
  }

  String _generateHash(String payload, String timestamp) {
    final dataToHash = '$payload|$timestamp|$secretKey';
    final bytes = utf8.encode(dataToHash);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
