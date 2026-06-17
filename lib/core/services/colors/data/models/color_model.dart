import 'package:flutter_app_template/core/data_base/table_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_model.freezed.dart';
part 'color_model.g.dart';

@freezed
class ColorModel with _$ColorModel {
  const ColorModel._();

  const factory ColorModel({
    required String key,
    required String light,
    required String dark,
  }) = _ColorModel;

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);

  factory ColorModel.fromMap(Map<String, dynamic> map) {
    return ColorModel(
      key: map[TableColor.key],
      light: map[TableColor.light],
      dark: map[TableColor.dark],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TableColor.key: key,
      TableColor.light: light,
      TableColor.dark: dark,
    };
  }
}
