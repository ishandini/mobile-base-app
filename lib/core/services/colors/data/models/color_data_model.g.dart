// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorDataModelImpl _$$ColorDataModelImplFromJson(Map<String, dynamic> json) =>
    _$ColorDataModelImpl(
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      syncDateTime: json['sync_date_time'] as String?,
    );

Map<String, dynamic> _$$ColorDataModelImplToJson(
        _$ColorDataModelImpl instance) =>
    <String, dynamic>{
      if (instance.colors?.map((e) => e.toJson()).toList() case final value?)
        'colors': value,
      if (instance.syncDateTime case final value?) 'sync_date_time': value,
    };
