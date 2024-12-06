import 'package:freezed_annotation/freezed_annotation.dart';

part 'case_list_model.freezed.dart';
part 'case_list_model.g.dart';

@freezed
class CaseListModel with _$CaseListModel {
  factory CaseListModel({
    required int Status,
    required String Error,
    required String Info,
    @AllCasesListModelListConverter()
    required List<List<AllCasesListModel>> Data,
  }) = _CaseListModel;

  factory CaseListModel.fromJson(Map<String, dynamic> json) =>
      _$CaseListModelFromJson(json);
}

@freezed
class AllCasesListModel with _$AllCasesListModel {
  factory AllCasesListModel({
    required dynamic id,
    dynamic FirstName,
    dynamic LastName,
    dynamic Gender,
    dynamic ReviewStatus,
    dynamic Status,
    dynamic RequestDate,
  }) = _AllCasesListModel;

  factory AllCasesListModel.fromJson(Map<String, dynamic> json) =>
      _$AllCasesListModelFromJson(json);
}

class AllCasesListModelListConverter
    implements JsonConverter<List<List<AllCasesListModel>>, List<dynamic>> {
  const AllCasesListModelListConverter();

  @override
  List<List<AllCasesListModel>> fromJson(List<dynamic> json) {
    return json
        .map((e) => (e as List<dynamic>)
            .map((i) => AllCasesListModel.fromJson(i as Map<String, dynamic>))
            .toList())
        .toList();
  }

  @override
  List<dynamic> toJson(List<List<AllCasesListModel>> object) {
    return object.map((e) => e.map((i) => i.toJson()).toList()).toList();
  }
}
