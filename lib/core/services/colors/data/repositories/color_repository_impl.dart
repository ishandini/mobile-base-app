import 'package:flutter_app_template/core/data_base/database_helper.dart';
import 'package:flutter_app_template/core/data_base/table_color.dart';
import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/services/colors/data/datasources/color_local_data_source.dart';
import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';
import 'package:flutter_app_template/core/services/colors/domain/repositories/color_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ColorRepository)
class ColorRepositoryImpl implements ColorRepository {
  ColorRepositoryImpl({
    required this.localDataSource,
  });

  final ColorLocalDataSource localDataSource;
  final Database database = DatabaseHelper.instance.db;

  @override
  ResultFuture<void> saveColors(List<ColorModel> colors) async {
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
      return const Right(null);
    } catch (e) {
      return Left(AppFailure(title: 'Database Error', message: e.toString()));
    }
  }

  @override
  ResultFuture<List<ColorModel>> getColors() async {
    try {
      final List<Map<String, dynamic>> maps =
          await database.query(TableColor.tableName);
      final colors = List.generate(maps.length, (i) {
        return ColorModel.fromMap(maps[i]);
      });
      return Right(colors);
    } catch (e) {
      return Left(AppFailure(title: 'Database Error', message: e.toString()));
    }
  }

  @override
  ResultFuture<bool> syncColors() async {
    try {
      final colorDataModel = await localDataSource.getColorDataFromLocal();

      final newSyncDateTime = colorDataModel.syncDateTime ?? '';

      final lastSyncDateTime = await localDataSource.getLastSyncDateTime();

      if (newSyncDateTime == lastSyncDateTime) {
        return const Right(false);
      }

      final colorModels = colorDataModel.colors?.map((data) {
            return data;
          }).toList() ??
          [];

      await localDataSource.saveColors(colorModels);

      await localDataSource.saveLastSyncDateTime(newSyncDateTime);
      return const Right(true);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
