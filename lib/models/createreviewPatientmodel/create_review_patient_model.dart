import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_review_patient_model.freezed.dart';
part 'create_review_patient_model.g.dart';

@freezed
class CreateReviewPatientModel with _$CreateReviewPatientModel {
  factory CreateReviewPatientModel({
    required int Status,
    required String Error,
    required String Info,
    @PatientModelListConverter() required List<List<PatientModel>> Data,
  }) = _CreateReviewPatientModel;

  factory CreateReviewPatientModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewPatientModelFromJson(json);
}

@freezed
class PatientModel with _$PatientModel {
  factory PatientModel({
    required String id,
    String? msg,
  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
}

class PatientModelListConverter
    implements JsonConverter<List<List<PatientModel>>, List<dynamic>> {
  const PatientModelListConverter();

  @override
  List<List<PatientModel>> fromJson(List<dynamic> json) {
    return json
        .map((e) => (e as List<dynamic>)
            .map((i) => PatientModel.fromJson(i as Map<String, dynamic>))
            .toList())
        .toList();
  }

  @override
  List<dynamic> toJson(List<List<PatientModel>> object) {
    return object.map((e) => e.map((i) => i.toJson()).toList()).toList();
  }
}
