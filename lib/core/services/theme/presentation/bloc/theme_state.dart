import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(FontScale.small) FontScale fontScale,
    String? error,
  }) = _ThemeState;
}
