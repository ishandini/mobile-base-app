import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/errors/failure.dart';
import 'package:flutter_app_template/core/services/theme/data/datasource/theme_local_datasource.dart';
import 'package:flutter_app_template/core/services/theme/domain/repository/theme_repository.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});

  @override
  ResultFuture<ThemeMode> getTheme() async {
    try {
      final themeString = await localDataSource.getThemeModeString();
      final themeMode = ThemeMode.values
          .firstWhereOrNull((element) => element.toString() == themeString);
      return Right(themeMode ?? ThemeMode.system);
    } catch (e) {
      return Left(AppFailure(title: 'Theme Error', message: e.toString()));
    }
  }

  @override
  ResultFuture<void> setTheme(ThemeMode themeMode) async {
    try {
      await localDataSource.saveThemeModeString(themeMode.toString());
      return const Right(null);
    } catch (e) {
      return Left(AppFailure(title: 'Database Error', message: e.toString()));
    }
  }

  @override
  ResultFuture<FontScale> getFontScale() async {
    try {
      final result = await localDataSource.getFontScale();
      return Right(result);
    } catch (e) {
      return Left(AppFailure(title: 'Font Error', message: e.toString()));
    }
  }

  @override
  ResultFuture<void> setFontScale(FontScale fontScale) async {
    try {
      await localDataSource.setFontScale(fontScale);
      return const Right(null);
    } catch (e) {
      return Left(AppFailure(title: 'Storage Error', message: e.toString()));
    }
  }
}
