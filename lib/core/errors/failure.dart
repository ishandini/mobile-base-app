import 'package:equatable/equatable.dart';
import 'package:flutter_app_template/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    this.title = 'Error',
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];
}

class APIFailure extends Failure {
  const APIFailure({
    super.title,
    required super.message,
  });

  APIFailure.fromException(APIException exception)
      : this(
          title: exception.title ?? 'API Error',
          message: exception.message ?? 'An error occurred',
        );
}

class AppFailure extends Failure {
  const AppFailure({
    super.title,
    required super.message,
  });
}
