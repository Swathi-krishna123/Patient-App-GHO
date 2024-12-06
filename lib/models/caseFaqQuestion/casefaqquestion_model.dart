import 'package:freezed_annotation/freezed_annotation.dart';

part 'casefaqquestion_model.freezed.dart';
part 'casefaqquestion_model.g.dart';

@freezed
class CaseQuestionsResponse with _$CaseQuestionsResponse {
  const factory CaseQuestionsResponse({
    required int Status,
    required String Error,
    required String Info,
    required List<List<dynamic>> Data, // Handling two lists inside Data
  }) = _CaseQuestionsResponse;

  factory CaseQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CaseQuestionsResponseFromJson(json);
}

@freezed
class QuestionData with _$QuestionData {
  const factory QuestionData({
    required int id,
    required String Question, // For the first list
  }) = _QuestionData;

  factory QuestionData.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataFromJson(json);
}

@freezed
class CaseQuestion with _$CaseQuestion {
  const factory CaseQuestion({
    required int id,
    int? did, // Nullable for the second list
    String? Question, // For the second list
  }) = _CaseQuestion;

  factory CaseQuestion.fromJson(Map<String, dynamic> json) =>
      _$CaseQuestionFromJson(json);
}
