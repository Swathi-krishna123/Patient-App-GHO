import 'package:freezed_annotation/freezed_annotation.dart';

part 'speciality_model.freezed.dart';
part 'speciality_model.g.dart';

@freezed
class SpecialityModel with _$SpecialityModel {
  factory SpecialityModel({
    required int Status,
    required String Error,
    required String Info,
    @SpecialityListModelConverter()
    required List<List<SpecialityListModel>> Data,
  }) = _SpecialityModel;

  factory SpecialityModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialityModelFromJson(json);
}

@freezed
class SpecialityListModel with _$SpecialityListModel {
  factory SpecialityListModel({
    required int id,
    String? nm,
  }) = _SpecialityListModel;

  factory SpecialityListModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialityListModelFromJson(json);
}

class SpecialityListModelConverter
    implements JsonConverter<List<List<SpecialityListModel>>, List<dynamic>> {
  const SpecialityListModelConverter();

  @override
  List<List<SpecialityListModel>> fromJson(List<dynamic> json) {
    return json
        .map((e) => (e as List<dynamic>)
            .map((i) => SpecialityListModel.fromJson(i as Map<String, dynamic>))
            .toList())
        .toList();
  }

  @override
  List<dynamic> toJson(List<List<SpecialityListModel>> object) {
    return object.map((e) => e.map((i) => i.toJson()).toList()).toList();
  }
}
