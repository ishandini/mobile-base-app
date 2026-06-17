// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageModelImpl _$$LanguageModelImplFromJson(Map<String, dynamic> json) =>
    _$LanguageModelImpl(
      translations: (json['translations'] as List<dynamic>?)
          ?.map((e) => TranslationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      syncDateTime: json['sync_date_time'] as String?,
    );

Map<String, dynamic> _$$LanguageModelImplToJson(_$LanguageModelImpl instance) =>
    <String, dynamic>{
      if (instance.translations?.map((e) => e.toJson()).toList()
          case final value?)
        'translations': value,
      if (instance.syncDateTime case final value?) 'sync_date_time': value,
    };
