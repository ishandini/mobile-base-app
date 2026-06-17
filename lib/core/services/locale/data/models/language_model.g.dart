// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    _LanguageModel(
      translations: (json['translations'] as List<dynamic>?)
          ?.map((e) => TranslationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      syncDateTime: json['sync_date_time'] as String?,
    );

Map<String, dynamic> _$LanguageModelToJson(_LanguageModel instance) =>
    <String, dynamic>{
      'translations': ?instance.translations?.map((e) => e.toJson()).toList(),
      'sync_date_time': ?instance.syncDateTime,
    };
