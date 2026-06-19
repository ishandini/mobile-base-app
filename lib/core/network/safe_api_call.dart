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
