import 'package:flutter_app_template/core/services/notifications/domain/entities/notification_entity.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';

abstract class NotificationsRepository {
  ResultFuture<bool> requestPermission();
  ResultFuture<String?> getFcmToken();
  ResultFuture<void> subscribeToTopic(String topic);
  ResultFuture<void> unsubscribeFromTopic(String topic);
  Stream<NotificationEntity> get onForegroundMessage;
  Stream<String> get onTokenRefresh;
}
