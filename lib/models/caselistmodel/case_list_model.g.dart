// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseListModelImpl _$$CaseListModelImplFromJson(Map<String, dynamic> json) =>
    _$CaseListModelImpl(
      Status: (json['Status'] as num).toInt(),
      Error: json['Error'] as String,
      Info: json['Info'] as String,
      Data:
          const AllCasesListModelListConverter().fromJson(json['Data'] as List),
    );

Map<String, dynamic> _$$CaseListModelImplToJson(_$CaseListModelImpl instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Error': instance.Error,
      'Info': instance.Info,
      'Data': const AllCasesListModelListConverter().toJson(instance.Data),
    };

_$AllCasesListModelImpl _$$AllCasesListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllCasesListModelImpl(
      id: json['id'],
      FirstName: json['FirstName'],
      LastName: json['LastName'],
      Gender: json['Gender'],
      ReviewStatus: json['ReviewStatus'],
      Status: json['Status'],
      RequestDate: json['RequestDate'],
    );

Map<String, dynamic> _$$AllCasesListModelImplToJson(
        _$AllCasesListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'Gender': instance.Gender,
      'ReviewStatus': instance.ReviewStatus,
      'Status': instance.Status,
      'RequestDate': instance.RequestDate,
    };
