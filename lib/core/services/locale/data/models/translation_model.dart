import 'package:flutter_app_template/core/data_base/table_translation.dart';
import 'package:flutter_app_template/core/services/locale/domain/entities/translation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_model.freezed.dart';
part 'translation_model.g.dart';

@freezed
abstract class TranslationModel with _$TranslationModel {
  const TranslationModel._();

  const factory TranslationModel({
    required String key,
    required String en,
    required String si,
    required String ta,
  }) = _TranslationModel;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);

  factory TranslationModel.fromEntity(Translation translation) {
    return TranslationModel(
      key: translation.key,
      en: translation.en,
      si: translation.si,
      ta: translation.ta,
    );
  }

  factory TranslationModel.fromMap(Map<String, dynamic> map) {
    return TranslationModel(
      key: map[TableTranslation.key],
      en: map[TableTranslation.en],
      si: map[TableTranslation.si],
      ta: map[TableTranslation.ta],
    );
  }

  Translation toEntity() {
    return Translation(
      key: key,
      en: en,
      si: si,
      ta: ta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TableTranslation.key: key,
      TableTranslation.en: en,
      TableTranslation.si: si,
      TableTranslation.ta: ta,
    };
  }
}
