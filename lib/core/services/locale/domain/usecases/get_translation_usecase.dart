import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/locale/domain/repositories/translation_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTranslationUseCase extends UseCaseWithoutParams<String> {
  const GetTranslationUseCase({required this.repository});

  final TranslationRepository repository;

  @override
  ResultFuture<String> call() async {
    return await repository.getCurrentLanguageCode();
  }
}
