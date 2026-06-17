import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_template/core/services/colors/domain/usecases/get_color_usecase.dart';
import 'package:flutter_app_template/core/services/colors/domain/usecases/sync_colors_usecase.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_event.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_state.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_event.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc({
    required this.getColorsUseCase,
    required this.syncColorsUseCase,
    required this.themeBloc,
  }) : super(const ColorInitial()) {
    on<SyncColorsEvt>(_onSyncColorEvt);
    on<LoadColorsEvt>(_onLoadColorsEvt);
  }

  final GetColorsUseCase getColorsUseCase;
  final SyncColorsUseCase syncColorsUseCase;
  final ThemeBloc themeBloc;

  FutureOr<void> _onLoadColorsEvt(
    LoadColorsEvt event,
    Emitter<ColorState> emit,
  ) async {
    emit(const ColorLoading());
    try {
      final result = await getColorsUseCase.call();
      result.fold(
        (error) => emit(
          ColorError(message: error.message),
        ),
        (colors) {
          emit(
            ColorLoaded(colors: colors),
          );
          themeBloc.add(const LoadThemeModeEvt());
        },
      );
    } catch (e) {
      emit(ColorError(message: e.toString()));
    }
  }

  Future<void> _onSyncColorEvt(
    SyncColorsEvt event,
    Emitter<ColorState> emit,
  ) async {
    emit(const ColorLoading());
    final result = await syncColorsUseCase.call();
    result.fold(
      (failure) => emit(ColorError(message: failure.message)),
      (status) async {
        add(const LoadColorsEvt());
      },
    );
  }
}
