import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_template/core/services/notifications/domain/entities/notification_entity.dart';
import 'package:flutter_app_template/core/services/notifications/domain/repositories/notifications_repository.dart';
import 'package:flutter_app_template/core/services/notifications/domain/usecases/get_fcm_token_usecase.dart';
import 'package:flutter_app_template/core/services/notifications/domain/usecases/request_notification_permission_usecase.dart';
import 'package:flutter_app_template/core/services/notifications/domain/usecases/subscribe_to_topic_usecase.dart';
import 'package:flutter_app_template/core/services/notifications/presentation/bloc/notifications_event.dart';
import 'package:flutter_app_template/core/services/notifications/presentation/bloc/notifications_state.dart';
import 'package:flutter_app_template/core/utils/storage_manager.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({
    required this.requestPermissionUseCase,
    required this.getFcmTokenUseCase,
    required this.subscribeToTopicUseCase,
    required this.notificationsRepository,
  }) : super(const NotificationsInitial()) {
    on<InitializeNotificationsEvt>(_onInitialize);
    on<ForegroundMessageReceivedEvt>(_onForegroundMessage);
  }

  final RequestNotificationPermissionUseCase requestPermissionUseCase;
  final GetFcmTokenUseCase getFcmTokenUseCase;
  final SubscribeToTopicUseCase subscribeToTopicUseCase;
  final NotificationsRepository notificationsRepository;

  StreamSubscription? _foregroundSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;

  bool _permissionGranted = false;
  String? _lastKnownToken;

  FutureOr<void> _onInitialize(
    InitializeNotificationsEvt event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsLoading());

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    final permissionResult = await requestPermissionUseCase.call();
    final permissionGranted = permissionResult.fold((_) => false, (v) => v);

    String? fcmToken;
    if (permissionGranted) {
      final tokenResult = await getFcmTokenUseCase.call();
      fcmToken = tokenResult.fold((_) => null, (t) => t);
      if (fcmToken != null) {
        await StorageManager.saveString(StorageKeys.fcmToken, fcmToken);
      }
    }

    _permissionGranted = permissionGranted;
    _lastKnownToken = fcmToken;

    emit(NotificationsReady(
        permissionGranted: permissionGranted, fcmToken: fcmToken));

    _foregroundSubscription?.cancel();
    _foregroundSubscription =
        notificationsRepository.onForegroundMessage.listen(
      (notification) => add(NotificationsEvent.foregroundMessageReceived(
        title: notification.title,
        body: notification.body,
        data: notification.data,
      )),
    );

    _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription =
        notificationsRepository.onTokenRefresh.listen((newToken) async {
      _lastKnownToken = newToken;
      await StorageManager.saveString(StorageKeys.fcmToken, newToken);
    });
  }

  FutureOr<void> _onForegroundMessage(
    ForegroundMessageReceivedEvt event,
    Emitter<NotificationsState> emit,
  ) {
    emit(NotificationsMessageReceived(
      notification: NotificationEntity(
        title: event.title,
        body: event.body,
        data: event.data,
      ),
    ));

    emit(NotificationsReady(
      permissionGranted: _permissionGranted,
      fcmToken: _lastKnownToken,
    ));
  }

  @override
  Future<void> close() {
    _foregroundSubscription?.cancel();
    _tokenRefreshSubscription?.cancel();
    return super.close();
  }
}
