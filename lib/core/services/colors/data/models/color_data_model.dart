import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_data_model.freezed.dart';
part 'color_data_model.g.dart';

@freezed
class ColorDataModel with _$ColorDataModel {
  const factory ColorDataModel({
    List<ColorModel>? colors,
    String? syncDateTime,
  }) = _ColorDataModel;

  factory ColorDataModel.fromJson(Map<String, dynamic> json) =>
      _$ColorDataModelFromJson(json);
}
