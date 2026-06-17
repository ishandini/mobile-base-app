import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/services/theme/domain/usecase/get_font_scale_usecase.dart';
import 'package:flutter_app_template/core/services/theme/domain/usecase/get_theme_usecase.dart';
import 'package:flutter_app_template/core/services/theme/domain/usecase/save_font_scale_usecase.dart';
import 'package:flutter_app_template/core/services/theme/domain/usecase/save_theme_usecase.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_event.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_state.dart';

@lazySingleton
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  final SaveThemeUseCase saveThemeUseCase;
  final GetFontScaleUseCase getFontScaleUseCase;
  final SaveFontScaleUseCase saveFontScaleUseCase;

  ThemeBloc({
    required this.getThemeUseCase,
    required this.saveThemeUseCase,
    required this.getFontScaleUseCase,
    required this.saveFontScaleUseCase,
  }) : super(const ThemeState()) {
    on<SetThemeModeEvt>(_onSetThemeMode);
    on<LoadThemeModeEvt>(_onLoadThemeMode);
    on<SetFontScaleEvt>(_onSetFontScale);
  }

  FutureOr<void> _onSetThemeMode(
    SetThemeModeEvt event,
    Emitter<ThemeState> emit,
  ) async {
    await saveThemeUseCase.call(event.themeMode);
    emit(
      state.copyWith(
        themeMode: event.themeMode,
        error: null,
      ),
    );
  }

  FutureOr<void> _onLoadThemeMode(
    LoadThemeModeEvt event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final themeResult = await getThemeUseCase.call();
      if (themeResult.isLeft()) {
        final error = themeResult.fold((l) => l.message, (_) => null);
        emit(state.copyWith(error: error));
        return;
      }

      final themeMode = themeResult.fold((_) => ThemeMode.system, (r) => r);

      final fontScaleResult = await getFontScaleUseCase.call();
      if (fontScaleResult.isLeft()) {
        final error = fontScaleResult.fold((l) => l.message, (_) => null);
        emit(state.copyWith(error: error));
        return;
      }

      final fontScale = fontScaleResult.fold((_) => FontScale.small, (r) => r);

      emit(
        state.copyWith(
          themeMode: themeMode,
          fontScale: fontScale,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  FutureOr<void> _onSetFontScale(
    SetFontScaleEvt event,
    Emitter<ThemeState> emit,
  ) async {
    await saveFontScaleUseCase(event.scale);
    emit(state.copyWith(fontScale: event.scale));
  }
}
