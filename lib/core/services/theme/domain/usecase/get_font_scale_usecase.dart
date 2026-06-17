import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/theme/domain/repository/theme_repository.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFontScaleUseCase extends UseCaseWithoutParams<FontScale> {
  final ThemeRepository repository;

  GetFontScaleUseCase({required this.repository});

  @override
  ResultFuture<FontScale> call() async {
    return await repository.getFontScale();
  }
}
