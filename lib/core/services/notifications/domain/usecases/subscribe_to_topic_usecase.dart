import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/notifications/domain/repositories/notifications_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubscribeToTopicUseCase extends UseCaseWithParams<void, String> {
  SubscribeToTopicUseCase({required this.repository});

  final NotificationsRepository repository;

  @override
  ResultFuture<void> call(String topic) => repository.subscribeToTopic(topic);
}
