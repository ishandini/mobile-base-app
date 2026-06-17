import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_event.freezed.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.initialize() = InitializeNotificationsEvt;
  const factory NotificationsEvent.foregroundMessageReceived({
    required String title,
    required String body,
    required Map<String, dynamic> data,
  }) = ForegroundMessageReceivedEvt;
}
