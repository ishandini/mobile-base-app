import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/theme/domain/repository/theme_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveThemeUseCase extends UseCaseWithParams<void, ThemeMode> {
  final ThemeRepository repository;

  SaveThemeUseCase({required this.repository});

  @override
  ResultFuture<void> call(ThemeMode param) async {
    return repository.setTheme(param);
  }
}
