import 'package:flutter_app_template/core/services/locale/data/models/language_model.dart';
import 'package:flutter_app_template/core/services/locale/data/models/translation_model.dart';
import 'package:flutter_app_template/core/services/locale/domain/entities/translation.dart';

abstract class TranslationLocalDataSource {
  Future<List<TranslationModel>> getTranslations();
  Future<String> getTranslation(String key, String languageCode);
  Future<String> getLastSyncDateTime();
  Future<void> saveTranslations(List<Translation> translations);
  Future<void> saveLastSyncDateTime(String syncDateTime);
  Future<String> getCurrentLanguageCode();
  Future<void> setCurrentLanguageCode(String languageCode);
  Future<LanguageModel> getLanguageFromLocal();
}
