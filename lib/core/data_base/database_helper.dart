import 'package:flutter_app_template/core/data_base/table_color.dart';
import 'package:flutter_app_template/core/data_base/table_translation.dart';
import 'package:flutter_app_template/core/utils/common.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static const _databaseName = 'app_data.db';
  static const _databaseVersion = 1;

  static late DatabaseHelper _instance;
  static DatabaseHelper get instance => _instance;
  Database? _database;
  Database get db => _database!;

  static Future<void> init() async {
    _instance = DatabaseHelper._();
    _instance._database = await _instance._initDatabase();
    logger.d('DatabaseHelper init()');
  }

  Future<Database> _initDatabase() async {
    final String path = await getDatabasesPath();
    logger.d('DB Path: $path');
    return openDatabase(
      join(path, _databaseName),
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute(TableColor.createQuery);
    batch.execute(TableTranslation.createQuery);
    await batch.commit();
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    final batch = db.batch();
    batch.execute(TableColor.createQuery);
    batch.execute(TableTranslation.createQuery);
    await batch.commit();
  }
}
