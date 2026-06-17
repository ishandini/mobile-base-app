import 'package:flutter_app_template/core/services/colors/data/models/color_data_model.dart';
import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';

abstract class ColorLocalDataSource {
  Future<List<ColorModel>> getColors();
  Future<String> getLastSyncDateTime();
  Future<void> saveColors(List<ColorModel> colors);
  Future<void> saveLastSyncDateTime(String syncDateTime);
  Future<ColorDataModel> getColorDataFromLocal();
}
