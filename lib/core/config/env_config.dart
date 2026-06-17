import 'package:flutter_app_template/core/utils/common.dart';
import 'package:flutter_app_template/core/utils/enums.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static late Environment _environment;
  static late Map<String, String> _config;

  static Future<void> initialize(String? flavour) async {
    final env =
        enumFromString(flavour ?? '', Environment.values) ?? Environment.dev;
    _environment = env;

    String envFileName;
    switch (env) {
      case Environment.dev:
        envFileName = 'env/.env.dev';
        break;
      case Environment.qa:
        envFileName = 'env/.env.qa';
        break;
      case Environment.prod:
        envFileName = 'env/.env.prod';
        break;
    }

    await dotenv.load(fileName: envFileName);
    _config = dotenv.env;

    logger.d(
      'Application started in ${_environment.name.toUpperCase()} environment',
    );
  }

  static Environment get environment => _environment;

  static String getValue(String key, [String defaultValue = '']) {
    return _config[key] ?? defaultValue;
  }

  static String get baseUrl => getValue('API_BASE_URL');
  static String get apiVersion => getValue('API_VERSION', 'v1');
  static String get apiUrl => '$baseUrl/$apiVersion/';
  static String get accessKey => getValue('ACCESS_KEY');
  static String get secretKey => getValue('SECRET_KEY');

  static Duration get connectTimeout =>
      Duration(seconds: int.parse(getValue('CONNECT_TIMEOUT', '30')));
  static Duration get receiveTimeout =>
      Duration(seconds: int.parse(getValue('RECEIVE_TIMEOUT', '30')));
  static Duration get sendTimeout =>
      Duration(seconds: int.parse(getValue('SEND_TIMEOUT', '30')));

  static String get appName => getValue('APP_NAME', 'App Template');
  static bool get enableLogging => getValue('ENABLE_LOGGING', 'true') == 'true';
}
