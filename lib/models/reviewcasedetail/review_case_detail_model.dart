import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_case_detail_model.freezed.dart';
part 'review_case_detail_model.g.dart';

@freezed
class ReviewCaseDetail with _$ReviewCaseDetail {
  const factory ReviewCaseDetail({
    required int Status,
    required String Error,
    required String Info,
    required List<List<dynamic>>
        Data, // Adjusted to list of lists to handle dynamic types
  }) = _ReviewCaseDetail;

  factory ReviewCaseDetail.fromJson(Map<String, dynamic> json) =>
      _$ReviewCaseDetailFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required dynamic id,
    required String LastName,
    required String FirstName,
    required String Gender,
    dynamic CountryID,
    String? CellPhone,
    String? Occupation,
    String? MedicalSummary,
    int? doby,
    int? dobm,
    int? dobd,
    dynamic DOB,
    dynamic CaseStatus,
    dynamic StatusDesc,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
class Specialty with _$Specialty {
  const factory Specialty({
    int? id,
    String? SpecialtyName,
  }) = _Specialty;

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);
}

@freezed
class Medication with _$Medication {
  const factory Medication({
    int? id,
    String? MedicationName,
    int? mn,
    int? yr,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}

@freezed
class UploadedFiles with _$UploadedFiles {
  const factory UploadedFiles(
      {int? id,
      String? FileName,
      int? fd,
      String? fl,
      String? UploadedDate}) = _UploadedFiles;

  factory UploadedFiles.fromJson(Map<String, dynamic> json) =>
      _$UploadedFilesFromJson(json);
}
