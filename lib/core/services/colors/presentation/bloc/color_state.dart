import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_state.freezed.dart';

@freezed
sealed class ColorState with _$ColorState {
  const factory ColorState.initial() = ColorInitial;
  const factory ColorState.loading() = ColorLoading;
  const factory ColorState.loaded({required List<ColorModel> colors}) = ColorLoaded;
  const factory ColorState.error({String? message}) = ColorError;
}
