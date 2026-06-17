import 'package:flutter_app_template/core/services/locale/data/datasources/translation_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TranslationRemoteDataSource)
class TranslationRemoteDataSourceImpl implements TranslationRemoteDataSource {
  TranslationRemoteDataSourceImpl();
}
