import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_template/core/services/notifications/data/datasources/notifications_datasource.dart';
import 'package:flutter_app_template/core/services/notifications/domain/entities/notification_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationsDataSource)
class NotificationsDataSourceImpl implements NotificationsDataSource {
  NotificationsDataSourceImpl(this._messaging);

  final FirebaseMessaging _messaging;

  @override
  Future<bool> requestPermission() async {
    final settings = await _messaging.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  @override
  Future<String?> getFcmToken() => _messaging.getToken();

  @override
  Future<void> subscribeToTopic(String topic) =>
      _messaging.subscribeToTopic(topic);

  @override
  Future<void> unsubscribeFromTopic(String topic) =>
      _messaging.unsubscribeFromTopic(topic);

  @override
  Stream<NotificationEntity> get onForegroundMessage =>
      FirebaseMessaging.onMessage.map(
        (message) => NotificationEntity(
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          data: message.data,
          imageUrl: message.notification?.android?.imageUrl ??
              message.notification?.apple?.imageUrl,
        ),
      );

  @override
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;
}
