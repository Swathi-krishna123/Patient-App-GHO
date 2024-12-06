// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casefaqquestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseQuestionsResponseImpl _$$CaseQuestionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CaseQuestionsResponseImpl(
      Status: (json['Status'] as num).toInt(),
      Error: json['Error'] as String,
      Info: json['Info'] as String,
      Data: (json['Data'] as List<dynamic>)
          .map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$CaseQuestionsResponseImplToJson(
        _$CaseQuestionsResponseImpl instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Error': instance.Error,
      'Info': instance.Info,
      'Data': instance.Data,
    };

_$QuestionDataImpl _$$QuestionDataImplFromJson(Map<String, dynamic> json) =>
    _$QuestionDataImpl(
      id: (json['id'] as num).toInt(),
      Question: json['Question'] as String,
    );

Map<String, dynamic> _$$QuestionDataImplToJson(_$QuestionDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Question': instance.Question,
    };

_$CaseQuestionImpl _$$CaseQuestionImplFromJson(Map<String, dynamic> json) =>
    _$CaseQuestionImpl(
      id: (json['id'] as num).toInt(),
      did: (json['did'] as num?)?.toInt(),
      Question: json['Question'] as String?,
    );

Map<String, dynamic> _$$CaseQuestionImplToJson(_$CaseQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'did': instance.did,
      'Question': instance.Question,
    };
