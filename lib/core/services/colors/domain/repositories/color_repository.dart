import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';

abstract class ColorRepository {
  ResultFuture<void> saveColors(List<ColorModel> colors);
  ResultFuture<List<ColorModel>> getColors();
  ResultFuture<bool> syncColors();
}
