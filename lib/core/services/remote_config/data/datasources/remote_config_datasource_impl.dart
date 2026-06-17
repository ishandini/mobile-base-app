import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_app_template/core/services/remote_config/data/datasources/remote_config_datasource.dart';
import 'package:flutter_app_template/core/services/remote_config/remote_config_defaults.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteConfigDataSource)
class RemoteConfigDataSourceImpl implements RemoteConfigDataSource {
  RemoteConfigDataSourceImpl(this._remoteConfig);

  final FirebaseRemoteConfig _remoteConfig;

  @override
  Future<void> fetchAndActivate() async {
    await _remoteConfig.setDefaults(RemoteConfigDefaults.defaults);
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await _remoteConfig.fetchAndActivate();
  }

  @override
  String getString(String key) => _remoteConfig.getString(key);

  @override
  bool getBool(String key) => _remoteConfig.getBool(key);

  @override
  int getInt(String key) => _remoteConfig.getInt(key);

  @override
  double getDouble(String key) => _remoteConfig.getDouble(key);
}
