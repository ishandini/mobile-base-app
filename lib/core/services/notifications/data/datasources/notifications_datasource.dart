import 'package:flutter_app_template/core/services/notifications/domain/entities/notification_entity.dart';

abstract class NotificationsDataSource {
  Future<bool> requestPermission();
  Future<String?> getFcmToken();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);
  Stream<NotificationEntity> get onForegroundMessage;
  Stream<String> get onTokenRefresh;
}
