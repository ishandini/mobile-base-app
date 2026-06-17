import 'package:flutter_app_template/core/services/notifications/domain/entities/notification_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
sealed class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsInitial;
  const factory NotificationsState.loading() = NotificationsLoading;
  const factory NotificationsState.ready({
    required bool permissionGranted,
    String? fcmToken,
  }) = NotificationsReady;
  const factory NotificationsState.messageReceived({
    required NotificationEntity notification,
  }) = NotificationsMessageReceived;
  const factory NotificationsState.error({String? message}) =
      NotificationsError;
}
