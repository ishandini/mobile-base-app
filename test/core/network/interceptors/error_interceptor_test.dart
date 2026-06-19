import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/network/interceptors/error_interceptor.dart';
import 'package:flutter_app_template/core/services/locale/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

class _FakeDioException extends Fake implements DioException {}

// AppLocalizations.translate() returns the key when _localizedStrings is
// empty (no load() called) — perfect for asserting on key names in tests.
class _StubLocalizations extends AppLocalizations {
  _StubLocalizations() : super(const Locale('en'));
}

void main() {
  late ErrorInterceptor interceptor;
  late MockErrorInterceptorHandler handler;

  setUpAll(() {
    registerFallbackValue(_FakeDioException());
  });

  setUp(() {
    interceptor = ErrorInterceptor(localizations: _StubLocalizations());
    handler = MockErrorInterceptorHandler();
  });

  group('ErrorInterceptor', () {
    test('passes HashValidationException through without wrapping', () {
      const hashException = HashValidationException('mismatch');
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/'),
        error: hashException,
      );

      interceptor.onError(dioError, handler);

      verify(() => handler.next(dioError)).called(1);
      verifyNever(() => handler.reject(any()));
    });

    test('wraps connection error DioException into APIException', () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.connectionError,
      );

      interceptor.onError(dioError, handler);

      final captured =
          verify(() => handler.reject(captureAny())).captured;
      final rejected = captured.first as DioException;
      final apiException = rejected.error as APIException;
      expect(
        apiException.title,
        equals('api_exception_lbl_connection_error'),
      );
      expect(
        apiException.message,
        equals('api_exception_lbl_unable_to_connect'),
      );
    });

    test('wraps 401 response DioException into APIException', () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/'),
        response: Response(
          requestOptions: RequestOptions(path: '/'),
          statusCode: 401,
          data: <String, dynamic>{},
        ),
        type: DioExceptionType.badResponse,
      );

      interceptor.onError(dioError, handler);

      final captured =
          verify(() => handler.reject(captureAny())).captured;
      final rejected = captured.first as DioException;
      final apiException = rejected.error as APIException;
      expect(
        apiException.title,
        equals('api_exception_lbl_unauthorized_401'),
      );
      expect(
        apiException.message,
        equals('api_exception_lbl_log_in_required'),
      );
    });
  });
}
