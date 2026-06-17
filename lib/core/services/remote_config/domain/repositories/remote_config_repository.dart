import 'package:flutter_app_template/core/utils/typedef.dart';

abstract class RemoteConfigRepository {
  ResultFuture<void> fetchAndActivate();
  String getString(String key);
  bool getBool(String key);
  int getInt(String key);
  double getDouble(String key);
}
