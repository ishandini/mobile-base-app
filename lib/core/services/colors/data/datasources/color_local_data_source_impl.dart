import 'package:flutter_app_template/core/data_base/database_helper.dart';
import 'package:flutter_app_template/core/data_base/table_color.dart';
import 'package:flutter_app_template/core/services/colors/data/datasources/color_local_data_source.dart';
import 'package:flutter_app_template/core/services/colors/data/models/color_data_model.dart';
import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';
import 'package:flutter_app_template/core/utils/common.dart';
import 'package:flutter_app_template/core/utils/helper.dart';
import 'package:flutter_app_template/core/utils/storage_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ColorLocalDataSource)
class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  ColorLocalDataSourceImpl();
  final Database database = DatabaseHelper.instance.db;

  @override
  Future<ColorDataModel> getColorDataFromLocal() async {
    final jsonData =
        await Helper().loadLocalJsonData(path: 'assets/theme/colors.json');
    final colorDataModel = ColorDataModel.fromJson(jsonData);
    return colorDataModel;
  }

  @override
  Future<List<ColorModel>> getColors() async {
    final List<Map<String, dynamic>> maps =
        await database.query(TableColor.tableName);
    final colors = List.generate(maps.length, (i) {
      return ColorModel.fromMap(maps[i]);
    });
    return colors;
  }

  @override
  Future<String> getLastSyncDateTime() async {
    final syncTime =
        await StorageManager.getString(StorageKeys.colorSyncDateTime) ?? '';
    return syncTime;
  }

  @override
  Future<void> saveColors(List<ColorModel> colors) async {
    try {
      await database.transaction((txn) async {
        final batch = txn.batch();
        batch.delete(TableColor.tableName);
        for (final color in colors) {
          batch.insert(
            TableColor.tableName,
            color.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
        await batch.commit();
      });
    } catch (e) {
      logger.e('Error saving colors: $e');
    }
  }

  @override
  Future<void> saveLastSyncDateTime(String syncDateTime) async {
    await StorageManager.saveString(
        StorageKeys.colorSyncDateTime, syncDateTime);
  }
}
