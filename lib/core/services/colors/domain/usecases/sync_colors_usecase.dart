import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/colors/domain/repositories/color_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SyncColorsUseCase extends UseCaseWithoutParams<bool> {
  SyncColorsUseCase({required this.repository});

  final ColorRepository repository;

  @override
  ResultFuture<bool> call() async {
    return repository.syncColors();
  }
}
