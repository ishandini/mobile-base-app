import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_local_data_source.dart';
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_remote_data_source.dart';
import 'package:flutter_app_template/core/services/locale/domain/repositories/translation_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TranslationRepository)
class TranslationRepositoryImpl implements TranslationRepository {
  final TranslationLocalDataSource localDataSource;
  final TranslationRemoteDataSource remoteDataSource;

  TranslationRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  ResultFuture<String> getTranslation(String key, String languageCode) async {
    try {
      final translation =
          await localDataSource.getTranslation(key, languageCode);
      return Right(translation);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<String> getCurrentLanguageCode() async {
    try {
      final languageCode = await localDataSource.getCurrentLanguageCode();
      return Right(languageCode);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> setCurrentLanguageCode(String languageCode) async {
    try {
      await localDataSource.setCurrentLanguageCode(languageCode);
      return const Right(null);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<bool> syncTranslations() async {
    try {
      final languageModel = await localDataSource.getLanguageFromLocal();

      final newSyncDateTime = languageModel.syncDateTime ?? '';

      final lastSyncDateTime = await localDataSource.getLastSyncDateTime();

      if (newSyncDateTime == lastSyncDateTime) {
        return const Right(false);
      }

      final translations = languageModel.translations?.map((data) {
            return data.toEntity();
          }).toList() ??
          [];

      await localDataSource.saveTranslations(translations);

      await localDataSource.saveLastSyncDateTime(newSyncDateTime);
      return const Right(true);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
