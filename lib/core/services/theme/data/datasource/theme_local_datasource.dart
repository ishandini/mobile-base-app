import 'package:flutter_app_template/core/services/theme/theme_style.dart';

abstract class ThemeLocalDataSource {
  Future<String?> getThemeModeString();
  Future<void> saveThemeModeString(String themeModeString);
  Future<FontScale> getFontScale();
  Future<void> setFontScale(FontScale fontScale);
}
