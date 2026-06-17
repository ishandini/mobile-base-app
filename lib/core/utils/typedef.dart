import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid<T> = ResultFuture<void>;
typedef DataMap = Map<String, dynamic>;
