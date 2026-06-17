import 'package:flutter_app_template/core/services/remote_config/domain/repositories/remote_config_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRemoteValueUseCase {
  GetRemoteValueUseCase({required this.repository});

  final RemoteConfigRepository repository;

  String getString(String key) => repository.getString(key);
  bool getBool(String key) => repository.getBool(key);
  int getInt(String key) => repository.getInt(key);
  double getDouble(String key) => repository.getDouble(key);
}
