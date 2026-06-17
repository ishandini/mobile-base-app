import 'package:flutter_app_template/core/common/usecases/usecase.dart';
import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';
import 'package:flutter_app_template/core/services/colors/domain/repositories/color_repository.dart';
import 'package:flutter_app_template/core/utils/typedef.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetColorsUseCase extends UseCaseWithoutParams<List<ColorModel>> {
  final ColorRepository repository;

  GetColorsUseCase({required this.repository});

  @override
  ResultFuture<List<ColorModel>> call() async {
    return await repository.getColors();
  }
}
