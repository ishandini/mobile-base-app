import 'package:flutter_app_template/core/utils/typedef.dart';

abstract class TranslationRepository {
  ResultFuture<String> getTranslation(String key, String languageCode);
  ResultFuture<String> getCurrentLanguageCode();
  ResultFuture<void> setCurrentLanguageCode(String languageCode);
  ResultFuture<bool> syncTranslations();
}
