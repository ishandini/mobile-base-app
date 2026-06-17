import 'package:flutter_app_template/core/services/theme/data/datasource/theme_local_datasource.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:flutter_app_template/core/utils/storage_manager.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ThemeLocalDataSource)
class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  ThemeLocalDataSourceImpl();

  @override
  Future<String?> getThemeModeString() async {
    final themeString = await StorageManager.getString(StorageKeys.themeMode);
    return themeString;
  }

  @override
  Future<void> saveThemeModeString(String themeModeString) async {
    await StorageManager.saveString(
      StorageKeys.themeMode,
      themeModeString,
    );
  }

  @override
  Future<void> setFontScale(FontScale scale) async {
    await StorageManager.saveString(StorageKeys.fontScale, scale.toString());
  }

  @override
  Future<FontScale> getFontScale() async {
    final value = await StorageManager.getString(StorageKeys.fontScale);
    return FontScaleExtension.fromValue(value ?? FontScale.small.toString());
  }
}
