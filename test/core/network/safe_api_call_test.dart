import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/network/responses/base_response.dart';
import 'package:flutter_app_template/core/network/safe_api_call.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  group('safeApiCall', () {
    test('returns Right with data on success response', () async {
      final result = await safeApiCall(
        () async => const BaseResponse<String>(
          status: 'success',
          data: 'hello',
        ),
      );

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Expected Right'),
        (data) => expect(data, equals('hello')),
      );
    });

    test('returns Left APIFailure when response is success but data is null',
        () async {
      final result = await safeApiCall<String>(
        () async => const BaseResponse<String>(
          status: 'success',
          data: null,
        ),
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<APIFailure>());
          expect(failure.message, equals('No data in response'));
        },
        (_) => fail('Expected Left'),
      );
    });

    test('returns Left APIFailure on non-success status', () async {
      final result = await safeApiCall<String>(
        () async => const BaseResponse<String>(
          status: 'error',
          message: 'Something went wrong',
          data: null,
        ),
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
          expect(failure, isA<APIFailure>());
          expect(failure.message, equals('Something went wrong'));
        },
        (_) => fail('Expected Left'),
      );
    });

    test('returns Left APIFailure when DioException carries APIException',
        () async {
      const apiException = APIException(
        message: 'Unauthorized',
        title: '401',
      );
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/'),
        error: apiException,
      );

      final result = await safeApiCall<String>(
        () async => throw dioError,
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure.message, equals('Unauthorized')),
        (_) => fail('Expected Left'),
      );
    });

    test('returns Left APIFailure on generic exception', () async {
      final result = await safeApiCall<String>(
        () async => throw Exception('network down'),
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<APIFailure>()),
        (_) => fail('Expected Left'),
      );
    });
  });
}
