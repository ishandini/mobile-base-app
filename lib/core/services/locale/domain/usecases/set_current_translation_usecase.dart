import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/locale/domain/repositories/translation_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetCurrentTranslationUseCase extends UseCaseWithParams<void, String> {
  const SetCurrentTranslationUseCase({required this.repository});

  final TranslationRepository repository;

  @override
  ResultFuture<void> call(String params) async {
    return await repository.setCurrentLanguageCode(params);
  }
}
