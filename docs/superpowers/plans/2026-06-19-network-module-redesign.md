# Network Module Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix correctness bugs, remove the hidden `sl<AppLocalizations>()` dependency from `APIException`, and unify `safeApiCall` to an Either-based contract matching `safeRepoCall`.

**Architecture:** Two-phase. Phase 1 (correctness): simplify `APIException`, inject `AppLocalizations` into `ErrorInterceptor`, guard `HashValidationException`, fix `SecurityInterceptor` catch block. Phase 2 (design): migrate `BaseResponse` to freezed, rewrite `safeApiCall` as `Either<Failure, T>`.

**Tech Stack:** Flutter/Dart, Dio 5.x, fpdart, freezed 3.2.x, freezed_annotation 3.1.x, json_serializable 6.x, injectable, mocktail (tests)

## Global Constraints

- `flutter analyze --no-pub 2>&1 | grep "error •"` must return empty after every commit
- `flutter test` must pass after any task that adds or touches tests
- Phase 1 and Phase 2 are separate commits — do not combine them
- No behaviour change visible to the UI or BLoC layers
- Do not modify `safeRepoCall` — its signature and logic stay unchanged

---

## File Map

| File | Phase | Change |
|------|-------|--------|
| `lib/core/errors/exceptions.dart` | 1 | Remove `_resolveTitle`, `_resolveMessage`, dead branch; simplify `initWithException`; remove DI imports |
| `lib/core/network/interceptors/error_interceptor.dart` | 1 | Add `AppLocalizations` constructor param; move resolution logic; guard `HashValidationException` |
| `lib/core/di/modules/network_module.dart` | 1 | Add `AppLocalizations` param to `dio()` method; update `ErrorInterceptor` instantiation |
| `lib/core/network/interceptors/security_interceptor.dart` | 1 | Fix catch block: raw string → `HashValidationException` |
| `test/core/network/interceptors/error_interceptor_test.dart` | 1 | New — unit tests for interceptor behaviour |
| `lib/core/network/responses/base_response.dart` | 2 | Migrate to `@freezed`; `isSuccess()` method → `isSuccess` getter |
| `lib/core/network/safe_api_call.dart` | 2 | Rewrite `safeApiCall` to `Future<Either<Failure, T>>`; `safeRepoCall` unchanged |
| `test/core/network/safe_api_call_test.dart` | 2 | New — unit tests for `safeApiCall` Either contract |

---

## Phase 1 — Correctness

### Task 1: Simplify `APIException`

**Files:**
- Modify: `lib/core/errors/exceptions.dart`

**Interfaces:**
- Produces:
  - `APIException.initWithResponse(BaseResponse response)` — `message = response.message`, `title = null`
  - `APIException.initWithException(Object exception)` — `message = exception is DioException ? exception.message ?? exception.toString() : exception.toString()`, `title = null`
  - `const APIException({required String? message, required String? title})`
  - `static String APIException.messageFrom(Object e, [String fallback = 'Something went wrong'])`
  - `class HashValidationException implements Exception` — unchanged, stays in this file

- [ ] **Step 1: Replace `lib/core/errors/exceptions.dart`**

```dart
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
```

- [ ] **Step 2: Verify (expect one downstream error in network_module.dart — fixed in Task 2)**

```bash
flutter analyze --no-pub 2>&1 | grep "error •"
```

Expected: zero errors. (`APIException` is still backward-compatible — its public constructors and `messageFrom` are unchanged in signature.)

- [ ] **Step 3: Commit**

```bash
git add lib/core/errors/exceptions.dart
git commit -m "refactor(network): simplify APIException — remove sl<> and localization logic"
```

---

### Task 2: Rewrite `ErrorInterceptor` + update `NetworkModule`

These two files must change together — `ErrorInterceptor` now requires `AppLocalizations` and `NetworkModule` provides it. Run `flutter analyze` only after both are updated.

**Files:**
- Modify: `lib/core/network/interceptors/error_interceptor.dart`
- Modify: `lib/core/di/modules/network_module.dart`
- Create: `test/core/network/interceptors/error_interceptor_test.dart`

**Interfaces:**
- Consumes: `APIException({required message, required title})` and `HashValidationException` from `exceptions.dart`; `AppLocalizations.translate(String key)` from `app_localizations.dart`
- Produces: `ErrorInterceptor({required AppLocalizations localizations})`

- [ ] **Step 1: Write failing test**

Create `test/core/network/interceptors/error_interceptor_test.dart`:

```dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/network/interceptors/error_interceptor.dart';
import 'package:flutter_app_template/core/services/locale/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

// AppLocalizations.translate() returns the key when _localizedStrings is
// empty (no load() called) — perfect for asserting on key names in tests.
class _StubLocalizations extends AppLocalizations {
  _StubLocalizations() : super(const Locale('en'));
}

void main() {
  late ErrorInterceptor interceptor;
  late MockErrorInterceptorHandler handler;

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
```

- [ ] **Step 2: Run test — expect compile failure**

```bash
flutter test test/core/network/interceptors/error_interceptor_test.dart
```

Expected: compile error — `ErrorInterceptor()` has no named parameter `localizations` yet.

- [ ] **Step 3: Replace `lib/core/network/interceptors/error_interceptor.dart`**

```dart
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
```

- [ ] **Step 4: Update `lib/core/di/modules/network_module.dart`**

Add `AppLocalizations` as a parameter to `dio()` and update `ErrorInterceptor` instantiation:

```dart
import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/config/env_config.dart';
import 'package:flutter_app_template/core/network/api_client.dart';
import 'package:flutter_app_template/core/network/interceptors/error_interceptor.dart';
import 'package:flutter_app_template/core/network/interceptors/security_interceptor.dart';
import 'package:flutter_app_template/core/services/locale/app_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:requests_inspector/requests_inspector.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AppLocalizations localizations) {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.apiUrl,
        connectTimeout: EnvConfig.connectTimeout,
        receiveTimeout: EnvConfig.receiveTimeout,
        sendTimeout: EnvConfig.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (EnvConfig.accessKey.isNotEmpty) 'access-key': EnvConfig.accessKey,
        },
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    dio.interceptors.addAll([
      SecurityInterceptor(secretKey: EnvConfig.secretKey),
      ErrorInterceptor(localizations: localizations),
      if (EnvConfig.enableLogging)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          filter: (options, args) => !args.isResponse || !args.hasUint8ListData,
        ),
      if (EnvConfig.enableLogging) RequestsInspectorInterceptor(),
    ]);

    return dio;
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio, baseUrl: EnvConfig.apiUrl);
}
```

- [ ] **Step 5: Run tests**

```bash
flutter test test/core/network/interceptors/error_interceptor_test.dart
```

Expected: all 3 tests pass.

- [ ] **Step 6: Verify**

```bash
flutter analyze --no-pub 2>&1 | grep "error •"
```

Expected: no output.

- [ ] **Step 7: Commit**

```bash
git add lib/core/network/interceptors/error_interceptor.dart \
        lib/core/di/modules/network_module.dart \
        test/core/network/interceptors/error_interceptor_test.dart
git commit -m "refactor(network): inject AppLocalizations into ErrorInterceptor, guard HashValidationException"
```

---

### Task 3: Fix `SecurityInterceptor` catch block + Phase 1 commit

**Files:**
- Modify: `lib/core/network/interceptors/security_interceptor.dart`

**Interfaces:**
- No interface change — internal fix only

- [ ] **Step 1: Fix the catch block in `onResponse`**

In `security_interceptor.dart`, find the `catch (e)` block inside `onResponse` (currently at the bottom of the method). Replace the raw string error with `HashValidationException`:

```dart
// BEFORE (lines ~79-85):
} catch (e) {
  logger.e('Error verifying response hash: $e');
  final dioError = DioException(
    requestOptions: response.requestOptions,
    error: 'Hash verification error: $e',
    response: response,
  );
  return handler.reject(dioError);
}

// AFTER:
} catch (e) {
  logger.e('Error verifying response hash: $e');
  final dioError = DioException(
    requestOptions: response.requestOptions,
    error: HashValidationException('Hash verification error: $e',
        response: response),
    response: response,
  );
  return handler.reject(dioError);
}
```

`HashValidationException` is already imported via `exceptions.dart` which is already imported at the top of `security_interceptor.dart`.

- [ ] **Step 2: Verify**

```bash
flutter analyze --no-pub 2>&1 | grep "error •"
```

Expected: no output.

- [ ] **Step 3: Run all tests**

```bash
flutter test
```

Expected: all tests pass.

- [ ] **Step 4: Commit Phase 1 complete**

```bash
git add lib/core/network/interceptors/security_interceptor.dart
git commit -m "fix(network): wrap SecurityInterceptor catch errors as HashValidationException"
```

---

## Phase 2 — Design Improvements

### Task 4: Migrate `BaseResponse` to freezed

**Files:**
- Modify: `lib/core/network/responses/base_response.dart`
- Delete: `lib/core/network/responses/base_response.g.dart` (regenerated by build_runner)

**Interfaces:**
- Produces:
  - `const factory BaseResponse({String? status, String? message, T? data})` — same call signature as before
  - `factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT)` — same signature as before
  - `bool get isSuccess` — was `bool isSuccess()`, now a getter (no parentheses)

- [ ] **Step 1: Replace `lib/core/network/responses/base_response.dart`**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
class BaseResponse<T> with _$BaseResponse<T> {
  const BaseResponse._();

  const factory BaseResponse({
    String? status,
    String? message,
    T? data,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);

  bool get isSuccess => status?.toLowerCase() == 'success';
}
```

- [ ] **Step 2: Run build_runner**

```bash
dart run build_runner build --delete-conflicting-outputs
```

Expected: generates `base_response.freezed.dart` and regenerates `base_response.g.dart`. No errors.

- [ ] **Step 3: Verify**

```bash
flutter analyze --no-pub 2>&1 | grep "error •"
```

Expected: no output. (If `safe_api_call.dart` calls `response.isSuccess()` with parentheses, you will see an error — that is fixed in Task 5 when `safeApiCall` is rewritten.)

- [ ] **Step 4: Commit**

```bash
git add lib/core/network/responses/base_response.dart \
        lib/core/network/responses/base_response.freezed.dart \
        lib/core/network/responses/base_response.g.dart
git commit -m "refactor(network): migrate BaseResponse to freezed"
```

---

### Task 5: Rewrite `safeApiCall` + Phase 2 commit

**Files:**
- Modify: `lib/core/network/safe_api_call.dart`
- Create: `test/core/network/safe_api_call_test.dart`

**Interfaces:**
- Consumes: `BaseResponse<T>.isSuccess` (getter, no parens), `BaseResponse<T>.data`, `APIException.initWithResponse`, `APIException.initWithException`, `APIFailure.fromException`
- Produces:
  - `Future<Either<Failure, T>> safeApiCall<T>(Future<BaseResponse<T>> Function() call)` — Either-based, non-nullable `T` on success
  - `Future<Either<Failure, T>> safeRepoCall<T>(Future<T> Function() call)` — unchanged

- [ ] **Step 1: Write failing tests**

Create `test/core/network/safe_api_call_test.dart`:

```dart
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
```

- [ ] **Step 2: Run tests — expect compile failure**

```bash
flutter test test/core/network/safe_api_call_test.dart
```

Expected: compile error — current `safeApiCall` returns `Future<T?>`, not `Future<Either<Failure, T>>`.

- [ ] **Step 3: Replace `lib/core/network/safe_api_call.dart`**

```dart
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/network/responses/base_response.dart';

Future<Either<Failure, T>> safeApiCall<T>(
  Future<BaseResponse<T>> Function() call,
) async {
  try {
    final response = await call();
    if (response.isSuccess) {
      final data = response.data;
      if (data == null) {
        return Left(APIFailure.fromException(
          const APIException(message: 'No data in response', title: null),
        ));
      }
      return Right(data);
    }
    return Left(
      APIFailure.fromException(APIException.initWithResponse(response)),
    );
  } on DioException catch (e) {
    final ex = e.error is APIException
        ? e.error as APIException
        : APIException.initWithException(e);
    return Left(APIFailure.fromException(ex));
  } on APIException catch (e) {
    return Left(APIFailure.fromException(e));
  } catch (e) {
    return Left(APIFailure.fromException(
      APIException(message: e.toString(), title: null),
    ));
  }
}

Future<Either<Failure, T>> safeRepoCall<T>(Future<T> Function() call) async {
  try {
    return Right(await call());
  } on DioException catch (e) {
    final apiException = e.error is APIException
        ? e.error as APIException
        : APIException.initWithException(e);
    return Left(APIFailure.fromException(apiException));
  } on APIException catch (e) {
    return Left(APIFailure.fromException(e));
  } catch (e) {
    return Left(APIFailure.fromException(APIException.initWithException(e)));
  }
}
```

- [ ] **Step 4: Run tests**

```bash
flutter test test/core/network/safe_api_call_test.dart
```

Expected: all 5 tests pass.

- [ ] **Step 5: Run all tests**

```bash
flutter test
```

Expected: all tests pass.

- [ ] **Step 6: Final verify**

```bash
flutter analyze --no-pub 2>&1 | grep "error •"
```

Expected: no output.

- [ ] **Step 7: Commit Phase 2 complete**

```bash
git add lib/core/network/safe_api_call.dart \
        test/core/network/safe_api_call_test.dart
git commit -m "refactor(network): rewrite safeApiCall as Either-based, non-nullable T"
```

---

## Repository Usage Pattern After Phase 2

For any endpoint using `BaseResponse<T>`, the repository now calls:

```dart
// Repository
Future<Either<Failure, BeneficiaryEntity>> getBeneficiaries() async {
  final result = await safeApiCall(() => _apiClient.beneficiaries());
  return result.map((model) => model.toEntity());
}
```

`safeRepoCall` remains for Firebase Callable Functions and any datasource
that does not return `BaseResponse<T>`:

```dart
// Repository
Future<Either<Failure, void>> doFirebaseAction(String id) {
  return safeRepoCall(() => _dataSource.doAction(id));
}
```
