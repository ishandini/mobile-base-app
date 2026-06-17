import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/config/env_config.dart';
import 'package:flutter_app_template/core/network/api_client.dart';
import 'package:flutter_app_template/core/network/interceptors/error_interceptor.dart';
import 'package:flutter_app_template/core/network/interceptors/security_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:requests_inspector/requests_inspector.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.apiUrl,
        connectTimeout: EnvConfig.connectTimeout,
        receiveTimeout: EnvConfig.receiveTimeout,
        sendTimeout: EnvConfig.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (EnvConfig.accessKey.isNotEmpty) 'access-key': EnvConfig.accessKey,
        },
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    dio.interceptors.addAll([
      SecurityInterceptor(secretKey: EnvConfig.secretKey),
      ErrorInterceptor(),
      if (EnvConfig.enableLogging)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          filter: (options, args) => !args.isResponse || !args.hasUint8ListData,
        ),
      if (EnvConfig.enableLogging) RequestsInspectorInterceptor(),
    ]);

    return dio;
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio, baseUrl: EnvConfig.apiUrl);
}
