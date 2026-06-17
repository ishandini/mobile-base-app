import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/const.dart';
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_local_data_source.dart';
import 'package:flutter_app_template/core/services/locale/data/models/translation_model.dart';
import 'package:flutter_app_template/core/di/injection.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  final Map<String, String> _localizedStrings = {};

  Future<bool> load(List<TranslationModel> trns) async {
    _localizedStrings.clear();

    for (TranslationModel translation in trns) {
      switch (locale.languageCode) {
        case Const.languageEn:
          _localizedStrings[translation.key] = translation.en;
          break;
        case Const.languageSi:
          _localizedStrings[translation.key] = translation.si;
          break;
        case Const.languageTa:
          _localizedStrings[translation.key] = translation.ta;
          break;
        default:
          _localizedStrings[translation.key] = translation.en;
          break;
      }
    }
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return Const.supportLanguages.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final trns = await sl<TranslationLocalDataSource>().getTranslations();
    final localizations = AppLocalizations(locale);
    await localizations.load(trns);
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) {
    return true;
  }
}
