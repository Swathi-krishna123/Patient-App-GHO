// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateReviewPatientModelImpl _$$CreateReviewPatientModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReviewPatientModelImpl(
      Status: (json['Status'] as num).toInt(),
      Error: json['Error'] as String,
      Info: json['Info'] as String,
      Data: const PatientModelListConverter().fromJson(json['Data'] as List),
    );

Map<String, dynamic> _$$CreateReviewPatientModelImplToJson(
        _$CreateReviewPatientModelImpl instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Error': instance.Error,
      'Info': instance.Info,
      'Data': const PatientModelListConverter().toJson(instance.Data),
    };

_$PatientModelImpl _$$PatientModelImplFromJson(Map<String, dynamic> json) =>
    _$PatientModelImpl(
      id: json['id'] as String,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$$PatientModelImplToJson(_$PatientModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'msg': instance.msg,
    };
