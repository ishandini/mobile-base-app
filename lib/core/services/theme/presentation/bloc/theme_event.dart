import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.freezed.dart';

@freezed
sealed class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.setThemeMode({required ThemeMode themeMode}) =
      SetThemeModeEvt;
  const factory ThemeEvent.loadThemeMode() = LoadThemeModeEvt;
  const factory ThemeEvent.setFontScale({required FontScale scale}) =
      SetFontScaleEvt;
}
