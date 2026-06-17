import 'package:flutter_app_template/core/common/data_sources/settings_remote_datasource.dart';
import 'package:flutter_app_template/core/common/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({required this.remoteDataSource});

  final SettingsRemoteDataSource remoteDataSource;
}
