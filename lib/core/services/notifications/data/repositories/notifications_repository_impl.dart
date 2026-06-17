import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/services/notifications/data/datasources/notifications_datasource.dart';
import 'package:flutter_app_template/core/services/notifications/domain/entities/notification_entity.dart';
import 'package:flutter_app_template/core/services/notifications/domain/repositories/notifications_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl({required this.dataSource});

  final NotificationsDataSource dataSource;

  @override
  ResultFuture<bool> requestPermission() async {
    try {
      final granted = await dataSource.requestPermission();
      return Right(granted);
    } catch (e) {
      return Left(AppFailure(
        title: 'Permission Error',
        message: e.toString(),
      ));
    }
  }

  @override
  ResultFuture<String?> getFcmToken() async {
    try {
      final token = await dataSource.getFcmToken();
      return Right(token);
    } catch (e) {
      return Left(AppFailure(
        title: 'FCM Token Error',
        message: e.toString(),
      ));
    }
  }

  @override
  ResultFuture<void> subscribeToTopic(String topic) async {
    try {
      await dataSource.subscribeToTopic(topic);
      return const Right(null);
    } catch (e) {
      return Left(AppFailure(
        title: 'Subscribe Error',
        message: e.toString(),
      ));
    }
  }

  @override
  ResultFuture<void> unsubscribeFromTopic(String topic) async {
    try {
      await dataSource.unsubscribeFromTopic(topic);
      return const Right(null);
    } catch (e) {
      return Left(AppFailure(
        title: 'Unsubscribe Error',
        message: e.toString(),
      ));
    }
  }

  @override
  Stream<NotificationEntity> get onForegroundMessage =>
      dataSource.onForegroundMessage;

  @override
  Stream<String> get onTokenRefresh => dataSource.onTokenRefresh;
}
