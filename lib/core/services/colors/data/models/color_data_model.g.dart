// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ColorDataModel _$ColorDataModelFromJson(Map<String, dynamic> json) =>
    _ColorDataModel(
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      syncDateTime: json['sync_date_time'] as String?,
    );

Map<String, dynamic> _$ColorDataModelToJson(_ColorDataModel instance) =>
    <String, dynamic>{
      'colors': ?instance.colors?.map((e) => e.toJson()).toList(),
      'sync_date_time': ?instance.syncDateTime,
    };
