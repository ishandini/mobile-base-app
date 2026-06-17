import 'package:flutter_app_template/core/utils/typedef.dart';

abstract class UseCaseWithParams<Output, Params> {
  const UseCaseWithParams();

  ResultFuture<Output> call(Params params);
}

abstract class UseCaseWithoutParams<Output> {
  const UseCaseWithoutParams();

  ResultFuture<Output> call();
}
