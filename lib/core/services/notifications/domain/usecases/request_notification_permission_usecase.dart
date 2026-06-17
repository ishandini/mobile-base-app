import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/notifications/domain/repositories/notifications_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RequestNotificationPermissionUseCase extends UseCaseWithoutParams<bool> {
  RequestNotificationPermissionUseCase({required this.repository});

  final NotificationsRepository repository;

  @override
  ResultFuture<bool> call() => repository.requestPermission();
}
