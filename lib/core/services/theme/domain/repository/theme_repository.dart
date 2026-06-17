import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';

abstract class ThemeRepository {
  ResultFuture<ThemeMode> getTheme();
  ResultFuture<void> setTheme(ThemeMode themeMode);
  ResultFuture<FontScale> getFontScale();
  ResultFuture<void> setFontScale(FontScale fontScale);
}
