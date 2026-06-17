import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';
import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/network/responses/base_response.dart';

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

Future<T?> safeApiCall<T>(Future<BaseResponse<T>> Function() apiCall) async {
  try {
    final response = await apiCall();
    if (response.isSuccess()) {
      return response.data;
    } else {
      throw APIException.initWithResponse(response);
    }
  } catch (e) {
    if (e is DioException && e.error is APIException) {
      throw e.error as APIException;
    }
    throw APIException.initWithException(e);
  }
}
