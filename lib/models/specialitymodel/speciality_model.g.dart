// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecialityModelImpl _$$SpecialityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SpecialityModelImpl(
      Status: (json['Status'] as num).toInt(),
      Error: json['Error'] as String,
      Info: json['Info'] as String,
      Data: const SpecialityListModelConverter().fromJson(json['Data'] as List),
    );

Map<String, dynamic> _$$SpecialityModelImplToJson(
        _$SpecialityModelImpl instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Error': instance.Error,
      'Info': instance.Info,
      'Data': const SpecialityListModelConverter().toJson(instance.Data),
    };

_$SpecialityListModelImpl _$$SpecialityListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SpecialityListModelImpl(
      id: (json['id'] as num).toInt(),
      nm: json['nm'] as String?,
    );

Map<String, dynamic> _$$SpecialityListModelImplToJson(
        _$SpecialityListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nm': instance.nm,
    };
