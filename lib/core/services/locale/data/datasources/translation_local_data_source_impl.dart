import 'package:flutter_app_template/core/constants/const.dart';
import 'package:flutter_app_template/core/data_base/database_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_app_template/core/data_base/table_translation.dart';
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_local_data_source.dart';
import 'package:flutter_app_template/core/services/locale/data/models/language_model.dart';
import 'package:flutter_app_template/core/services/locale/data/models/translation_model.dart';
import 'package:flutter_app_template/core/services/locale/domain/entities/translation.dart';
import 'package:flutter_app_template/core/utils/common.dart';
import 'package:flutter_app_template/core/utils/helper.dart';
import 'package:flutter_app_template/core/utils/storage_manager.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: TranslationLocalDataSource)
class TranslationLocalDataSourceImpl implements TranslationLocalDataSource {
  final Database database = DatabaseHelper.instance.db;

  TranslationLocalDataSourceImpl();

  @override
  Future<String> getCurrentLanguageCode() async {
    final languageCode = await StorageManager.getString(StorageKeys.language) ??
        Const.languageEn;
    return languageCode;
  }

  @override
  Future<void> setCurrentLanguageCode(String languageCode) async {
    await StorageManager.saveString(StorageKeys.language, languageCode);
  }

  @override
  Future<String> getLastSyncDateTime() async {
    final syncTime =
        await StorageManager.getString(StorageKeys.translationSyncDateTime) ??
            '';
    return syncTime;
  }

  @override
  Future<void> saveLastSyncDateTime(String syncDateTime) async {
    await StorageManager.saveString(
        StorageKeys.translationSyncDateTime, syncDateTime);
  }

  @override
  Future<List<TranslationModel>> getTranslations() async {
    final List<Map<String, dynamic>> maps = await database.query(
      TableTranslation.tableName,
    );

    return maps.map((map) {
      final tr = TranslationModel(
        key: map[TableTranslation.key],
        en: map[TableTranslation.en],
        si: map[TableTranslation.si],
        ta: map[TableTranslation.ta],
      );
      return tr;
    }).toList();
  }

  @override
  Future<String> getTranslation(String key, String languageCode) async {
    final List<Map<String, dynamic>> result = await database.query(
      TableTranslation.tableName,
      columns: [languageCode],
      where: '${TableTranslation.key} = ?',
      whereArgs: [key],
    );

    if (result.isEmpty || result.first[languageCode] == null) {
      return key;
    }

    return result.first[languageCode];
  }

  @override
  Future<void> saveTranslations(List<Translation> translations) async {
    final batch = database.batch();
    batch.delete(TableTranslation.tableName);

    for (final translation in translations) {
      final map = {
        TableTranslation.key: translation.key,
      };
      map[TableTranslation.en] = translation.en;
      map[TableTranslation.si] = translation.si;
      map[TableTranslation.ta] = translation.ta;

      batch.insert(
        TableTranslation.tableName,
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    try {
      await batch.commit(noResult: true);
    } catch (e) {
      logger.e('Error saving translations: $e');
    }
  }

  @override
  Future<LanguageModel> getLanguageFromLocal() async {
    final jsonData =
        await Helper().loadLocalJsonData(path: 'assets/locales/language.json');
    final languageModel = LanguageModel.fromJson(jsonData);
    return languageModel;
  }
}
