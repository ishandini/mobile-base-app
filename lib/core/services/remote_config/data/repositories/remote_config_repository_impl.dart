import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/services/remote_config/data/datasources/remote_config_datasource.dart';
import 'package:flutter_app_template/core/services/remote_config/domain/repositories/remote_config_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteConfigRepository)
class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  RemoteConfigRepositoryImpl({required this.dataSource});

  final RemoteConfigDataSource dataSource;

  @override
  ResultFuture<void> fetchAndActivate() async {
    try {
      await dataSource.fetchAndActivate();
      return const Right(null);
    } catch (e) {
      return Left(AppFailure(
        title: 'Remote Config Error',
        message: e.toString(),
      ));
    }
  }

  @override
  String getString(String key) => dataSource.getString(key);

  @override
  bool getBool(String key) => dataSource.getBool(key);

  @override
  int getInt(String key) => dataSource.getInt(key);

  @override
  double getDouble(String key) => dataSource.getDouble(key);
}
