import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/locale/domain/repositories/translation_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SyncTranslationsUseCase extends UseCaseWithoutParams<bool> {
  final TranslationRepository repository;

  SyncTranslationsUseCase({required this.repository});

  @override
  ResultFuture<bool> call() async {
    return repository.syncTranslations();
  }
}
