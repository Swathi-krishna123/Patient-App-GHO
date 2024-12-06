// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_case_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewCaseDetailImpl _$$ReviewCaseDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewCaseDetailImpl(
      Status: (json['Status'] as num).toInt(),
      Error: json['Error'] as String,
      Info: json['Info'] as String,
      Data: (json['Data'] as List<dynamic>)
          .map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$ReviewCaseDetailImplToJson(
        _$ReviewCaseDetailImpl instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Error': instance.Error,
      'Info': instance.Info,
      'Data': instance.Data,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['id'],
      LastName: json['LastName'] as String,
      FirstName: json['FirstName'] as String,
      Gender: json['Gender'] as String,
      CountryID: json['CountryID'],
      CellPhone: json['CellPhone'] as String?,
      Occupation: json['Occupation'] as String?,
      MedicalSummary: json['MedicalSummary'] as String?,
      doby: (json['doby'] as num?)?.toInt(),
      dobm: (json['dobm'] as num?)?.toInt(),
      dobd: (json['dobd'] as num?)?.toInt(),
      DOB: json['DOB'],
      CaseStatus: json['CaseStatus'],
      StatusDesc: json['StatusDesc'],
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'LastName': instance.LastName,
      'FirstName': instance.FirstName,
      'Gender': instance.Gender,
      'CountryID': instance.CountryID,
      'CellPhone': instance.CellPhone,
      'Occupation': instance.Occupation,
      'MedicalSummary': instance.MedicalSummary,
      'doby': instance.doby,
      'dobm': instance.dobm,
      'dobd': instance.dobd,
      'DOB': instance.DOB,
      'CaseStatus': instance.CaseStatus,
      'StatusDesc': instance.StatusDesc,
    };

_$SpecialtyImpl _$$SpecialtyImplFromJson(Map<String, dynamic> json) =>
    _$SpecialtyImpl(
      id: (json['id'] as num?)?.toInt(),
      SpecialtyName: json['SpecialtyName'] as String?,
    );

Map<String, dynamic> _$$SpecialtyImplToJson(_$SpecialtyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SpecialtyName': instance.SpecialtyName,
    };

_$MedicationImpl _$$MedicationImplFromJson(Map<String, dynamic> json) =>
    _$MedicationImpl(
      id: (json['id'] as num?)?.toInt(),
      MedicationName: json['MedicationName'] as String?,
      mn: (json['mn'] as num?)?.toInt(),
      yr: (json['yr'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MedicationImplToJson(_$MedicationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'MedicationName': instance.MedicationName,
      'mn': instance.mn,
      'yr': instance.yr,
    };

_$UploadedFilesImpl _$$UploadedFilesImplFromJson(Map<String, dynamic> json) =>
    _$UploadedFilesImpl(
      id: (json['id'] as num?)?.toInt(),
      FileName: json['FileName'] as String?,
      fd: (json['fd'] as num?)?.toInt(),
      fl: json['fl'] as String?,
      UploadedDate: json['UploadedDate'] as String?,
    );

Map<String, dynamic> _$$UploadedFilesImplToJson(_$UploadedFilesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'FileName': instance.FileName,
      'fd': instance.fd,
      'fl': instance.fl,
      'UploadedDate': instance.UploadedDate,
    };
