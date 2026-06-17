import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/theme/domain/repository/theme_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetThemeUseCase extends UseCaseWithoutParams<ThemeMode> {
  final ThemeRepository repository;

  GetThemeUseCase({required this.repository});

  @override
  ResultFuture<ThemeMode> call() async {
    return await repository.getTheme();
  }
}
