import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/theme/domain/repository/theme_repository.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveFontScaleUseCase extends UseCaseWithParams<void, FontScale> {
  final ThemeRepository repository;

  SaveFontScaleUseCase({required this.repository});

  @override
  ResultFuture<void> call(FontScale param) async {
    return repository.setFontScale(param);
  }
}
