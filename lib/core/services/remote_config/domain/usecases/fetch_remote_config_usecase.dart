import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/remote_config/domain/repositories/remote_config_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchRemoteConfigUseCase extends UseCaseWithoutParams<void> {
  FetchRemoteConfigUseCase({required this.repository});

  final RemoteConfigRepository repository;

  @override
  ResultFuture<void> call() => repository.fetchAndActivate();
}
