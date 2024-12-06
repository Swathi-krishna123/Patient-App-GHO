// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_case_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewCaseDetail _$ReviewCaseDetailFromJson(Map<String, dynamic> json) {
  return _ReviewCaseDetail.fromJson(json);
}

/// @nodoc
mixin _$ReviewCaseDetail {
  int get Status => throw _privateConstructorUsedError;
  String get Error => throw _privateConstructorUsedError;
  String get Info => throw _privateConstructorUsedError;
  List<List<dynamic>> get Data => throw _privateConstructorUsedError;

  /// Serializes this ReviewCaseDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewCaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCaseDetailCopyWith<ReviewCaseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCaseDetailCopyWith<$Res> {
  factory $ReviewCaseDetailCopyWith(
          ReviewCaseDetail value, $Res Function(ReviewCaseDetail) then) =
      _$ReviewCaseDetailCopyWithImpl<$Res, ReviewCaseDetail>;
  @useResult
  $Res call({int Status, String Error, String Info, List<List<dynamic>> Data});
}

/// @nodoc
class _$ReviewCaseDetailCopyWithImpl<$Res, $Val extends ReviewCaseDetail>
    implements $ReviewCaseDetailCopyWith<$Res> {
  _$ReviewCaseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewCaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = null,
    Object? Error = null,
    Object? Info = null,
    Object? Data = null,
  }) {
    return _then(_value.copyWith(
      Status: null == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as int,
      Error: null == Error
          ? _value.Error
          : Error // ignore: cast_nullable_to_non_nullable
              as String,
      Info: null == Info
          ? _value.Info
          : Info // ignore: cast_nullable_to_non_nullable
              as String,
      Data: null == Data
          ? _value.Data
          : Data // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewCaseDetailImplCopyWith<$Res>
    implements $ReviewCaseDetailCopyWith<$Res> {
  factory _$$ReviewCaseDetailImplCopyWith(_$ReviewCaseDetailImpl value,
          $Res Function(_$ReviewCaseDetailImpl) then) =
      __$$ReviewCaseDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int Status, String Error, String Info, List<List<dynamic>> Data});
}

/// @nodoc
class __$$ReviewCaseDetailImplCopyWithImpl<$Res>
    extends _$ReviewCaseDetailCopyWithImpl<$Res, _$ReviewCaseDetailImpl>
    implements _$$ReviewCaseDetailImplCopyWith<$Res> {
  __$$ReviewCaseDetailImplCopyWithImpl(_$ReviewCaseDetailImpl _value,
      $Res Function(_$ReviewCaseDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewCaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = null,
    Object? Error = null,
    Object? Info = null,
    Object? Data = null,
  }) {
    return _then(_$ReviewCaseDetailImpl(
      Status: null == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as int,
      Error: null == Error
          ? _value.Error
          : Error // ignore: cast_nullable_to_non_nullable
              as String,
      Info: null == Info
          ? _value.Info
          : Info // ignore: cast_nullable_to_non_nullable
              as String,
      Data: null == Data
          ? _value._Data
          : Data // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewCaseDetailImpl implements _ReviewCaseDetail {
  const _$ReviewCaseDetailImpl(
      {required this.Status,
      required this.Error,
      required this.Info,
      required final List<List<dynamic>> Data})
      : _Data = Data;

  factory _$ReviewCaseDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCaseDetailImplFromJson(json);

  @override
  final int Status;
  @override
  final String Error;
  @override
  final String Info;
  final List<List<dynamic>> _Data;
  @override
  List<List<dynamic>> get Data {
    if (_Data is EqualUnmodifiableListView) return _Data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_Data);
  }

  @override
  String toString() {
    return 'ReviewCaseDetail(Status: $Status, Error: $Error, Info: $Info, Data: $Data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCaseDetailImpl &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.Error, Error) || other.Error == Error) &&
            (identical(other.Info, Info) || other.Info == Info) &&
            const DeepCollectionEquality().equals(other._Data, _Data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Status, Error, Info,
      const DeepCollectionEquality().hash(_Data));

  /// Create a copy of ReviewCaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCaseDetailImplCopyWith<_$ReviewCaseDetailImpl> get copyWith =>
      __$$ReviewCaseDetailImplCopyWithImpl<_$ReviewCaseDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCaseDetailImplToJson(
      this,
    );
  }
}

abstract class _ReviewCaseDetail implements ReviewCaseDetail {
  const factory _ReviewCaseDetail(
      {required final int Status,
      required final String Error,
      required final String Info,
      required final List<List<dynamic>> Data}) = _$ReviewCaseDetailImpl;

  factory _ReviewCaseDetail.fromJson(Map<String, dynamic> json) =
      _$ReviewCaseDetailImpl.fromJson;

  @override
  int get Status;
  @override
  String get Error;
  @override
  String get Info;
  @override
  List<List<dynamic>> get Data;

  /// Create a copy of ReviewCaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCaseDetailImplCopyWith<_$ReviewCaseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  dynamic get id => throw _privateConstructorUsedError;
  String get LastName => throw _privateConstructorUsedError;
  String get FirstName => throw _privateConstructorUsedError;
  String get Gender => throw _privateConstructorUsedError;
  dynamic get CountryID => throw _privateConstructorUsedError;
  String? get CellPhone => throw _privateConstructorUsedError;
  String? get Occupation => throw _privateConstructorUsedError;
  String? get MedicalSummary => throw _privateConstructorUsedError;
  int? get doby => throw _privateConstructorUsedError;
  int? get dobm => throw _privateConstructorUsedError;
  int? get dobd => throw _privateConstructorUsedError;
  dynamic get DOB => throw _privateConstructorUsedError;
  dynamic get CaseStatus => throw _privateConstructorUsedError;
  dynamic get StatusDesc => throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {dynamic id,
      String LastName,
      String FirstName,
      String Gender,
      dynamic CountryID,
      String? CellPhone,
      String? Occupation,
      String? MedicalSummary,
      int? doby,
      int? dobm,
      int? dobd,
      dynamic DOB,
      dynamic CaseStatus,
      dynamic StatusDesc});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? LastName = null,
    Object? FirstName = null,
    Object? Gender = null,
    Object? CountryID = freezed,
    Object? CellPhone = freezed,
    Object? Occupation = freezed,
    Object? MedicalSummary = freezed,
    Object? doby = freezed,
    Object? dobm = freezed,
    Object? dobd = freezed,
    Object? DOB = freezed,
    Object? CaseStatus = freezed,
    Object? StatusDesc = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      LastName: null == LastName
          ? _value.LastName
          : LastName // ignore: cast_nullable_to_non_nullable
              as String,
      FirstName: null == FirstName
          ? _value.FirstName
          : FirstName // ignore: cast_nullable_to_non_nullable
              as String,
      Gender: null == Gender
          ? _value.Gender
          : Gender // ignore: cast_nullable_to_non_nullable
              as String,
      CountryID: freezed == CountryID
          ? _value.CountryID
          : CountryID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CellPhone: freezed == CellPhone
          ? _value.CellPhone
          : CellPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      Occupation: freezed == Occupation
          ? _value.Occupation
          : Occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      MedicalSummary: freezed == MedicalSummary
          ? _value.MedicalSummary
          : MedicalSummary // ignore: cast_nullable_to_non_nullable
              as String?,
      doby: freezed == doby
          ? _value.doby
          : doby // ignore: cast_nullable_to_non_nullable
              as int?,
      dobm: freezed == dobm
          ? _value.dobm
          : dobm // ignore: cast_nullable_to_non_nullable
              as int?,
      dobd: freezed == dobd
          ? _value.dobd
          : dobd // ignore: cast_nullable_to_non_nullable
              as int?,
      DOB: freezed == DOB
          ? _value.DOB
          : DOB // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CaseStatus: freezed == CaseStatus
          ? _value.CaseStatus
          : CaseStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      StatusDesc: freezed == StatusDesc
          ? _value.StatusDesc
          : StatusDesc // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      String LastName,
      String FirstName,
      String Gender,
      dynamic CountryID,
      String? CellPhone,
      String? Occupation,
      String? MedicalSummary,
      int? doby,
      int? dobm,
      int? dobd,
      dynamic DOB,
      dynamic CaseStatus,
      dynamic StatusDesc});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? LastName = null,
    Object? FirstName = null,
    Object? Gender = null,
    Object? CountryID = freezed,
    Object? CellPhone = freezed,
    Object? Occupation = freezed,
    Object? MedicalSummary = freezed,
    Object? doby = freezed,
    Object? dobm = freezed,
    Object? dobd = freezed,
    Object? DOB = freezed,
    Object? CaseStatus = freezed,
    Object? StatusDesc = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      LastName: null == LastName
          ? _value.LastName
          : LastName // ignore: cast_nullable_to_non_nullable
              as String,
      FirstName: null == FirstName
          ? _value.FirstName
          : FirstName // ignore: cast_nullable_to_non_nullable
              as String,
      Gender: null == Gender
          ? _value.Gender
          : Gender // ignore: cast_nullable_to_non_nullable
              as String,
      CountryID: freezed == CountryID
          ? _value.CountryID
          : CountryID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CellPhone: freezed == CellPhone
          ? _value.CellPhone
          : CellPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      Occupation: freezed == Occupation
          ? _value.Occupation
          : Occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      MedicalSummary: freezed == MedicalSummary
          ? _value.MedicalSummary
          : MedicalSummary // ignore: cast_nullable_to_non_nullable
              as String?,
      doby: freezed == doby
          ? _value.doby
          : doby // ignore: cast_nullable_to_non_nullable
              as int?,
      dobm: freezed == dobm
          ? _value.dobm
          : dobm // ignore: cast_nullable_to_non_nullable
              as int?,
      dobd: freezed == dobd
          ? _value.dobd
          : dobd // ignore: cast_nullable_to_non_nullable
              as int?,
      DOB: freezed == DOB
          ? _value.DOB
          : DOB // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CaseStatus: freezed == CaseStatus
          ? _value.CaseStatus
          : CaseStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      StatusDesc: freezed == StatusDesc
          ? _value.StatusDesc
          : StatusDesc // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {required this.id,
      required this.LastName,
      required this.FirstName,
      required this.Gender,
      this.CountryID,
      this.CellPhone,
      this.Occupation,
      this.MedicalSummary,
      this.doby,
      this.dobm,
      this.dobd,
      this.DOB,
      this.CaseStatus,
      this.StatusDesc});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final dynamic id;
  @override
  final String LastName;
  @override
  final String FirstName;
  @override
  final String Gender;
  @override
  final dynamic CountryID;
  @override
  final String? CellPhone;
  @override
  final String? Occupation;
  @override
  final String? MedicalSummary;
  @override
  final int? doby;
  @override
  final int? dobm;
  @override
  final int? dobd;
  @override
  final dynamic DOB;
  @override
  final dynamic CaseStatus;
  @override
  final dynamic StatusDesc;

  @override
  String toString() {
    return 'UserInfo(id: $id, LastName: $LastName, FirstName: $FirstName, Gender: $Gender, CountryID: $CountryID, CellPhone: $CellPhone, Occupation: $Occupation, MedicalSummary: $MedicalSummary, doby: $doby, dobm: $dobm, dobd: $dobd, DOB: $DOB, CaseStatus: $CaseStatus, StatusDesc: $StatusDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.LastName, LastName) ||
                other.LastName == LastName) &&
            (identical(other.FirstName, FirstName) ||
                other.FirstName == FirstName) &&
            (identical(other.Gender, Gender) || other.Gender == Gender) &&
            const DeepCollectionEquality().equals(other.CountryID, CountryID) &&
            (identical(other.CellPhone, CellPhone) ||
                other.CellPhone == CellPhone) &&
            (identical(other.Occupation, Occupation) ||
                other.Occupation == Occupation) &&
            (identical(other.MedicalSummary, MedicalSummary) ||
                other.MedicalSummary == MedicalSummary) &&
            (identical(other.doby, doby) || other.doby == doby) &&
            (identical(other.dobm, dobm) || other.dobm == dobm) &&
            (identical(other.dobd, dobd) || other.dobd == dobd) &&
            const DeepCollectionEquality().equals(other.DOB, DOB) &&
            const DeepCollectionEquality()
                .equals(other.CaseStatus, CaseStatus) &&
            const DeepCollectionEquality()
                .equals(other.StatusDesc, StatusDesc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      LastName,
      FirstName,
      Gender,
      const DeepCollectionEquality().hash(CountryID),
      CellPhone,
      Occupation,
      MedicalSummary,
      doby,
      dobm,
      dobd,
      const DeepCollectionEquality().hash(DOB),
      const DeepCollectionEquality().hash(CaseStatus),
      const DeepCollectionEquality().hash(StatusDesc));

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final dynamic id,
      required final String LastName,
      required final String FirstName,
      required final String Gender,
      final dynamic CountryID,
      final String? CellPhone,
      final String? Occupation,
      final String? MedicalSummary,
      final int? doby,
      final int? dobm,
      final int? dobd,
      final dynamic DOB,
      final dynamic CaseStatus,
      final dynamic StatusDesc}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  dynamic get id;
  @override
  String get LastName;
  @override
  String get FirstName;
  @override
  String get Gender;
  @override
  dynamic get CountryID;
  @override
  String? get CellPhone;
  @override
  String? get Occupation;
  @override
  String? get MedicalSummary;
  @override
  int? get doby;
  @override
  int? get dobm;
  @override
  int? get dobd;
  @override
  dynamic get DOB;
  @override
  dynamic get CaseStatus;
  @override
  dynamic get StatusDesc;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Specialty _$SpecialtyFromJson(Map<String, dynamic> json) {
  return _Specialty.fromJson(json);
}

/// @nodoc
mixin _$Specialty {
  int? get id => throw _privateConstructorUsedError;
  String? get SpecialtyName => throw _privateConstructorUsedError;

  /// Serializes this Specialty to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Specialty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialtyCopyWith<Specialty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialtyCopyWith<$Res> {
  factory $SpecialtyCopyWith(Specialty value, $Res Function(Specialty) then) =
      _$SpecialtyCopyWithImpl<$Res, Specialty>;
  @useResult
  $Res call({int? id, String? SpecialtyName});
}

/// @nodoc
class _$SpecialtyCopyWithImpl<$Res, $Val extends Specialty>
    implements $SpecialtyCopyWith<$Res> {
  _$SpecialtyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Specialty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? SpecialtyName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      SpecialtyName: freezed == SpecialtyName
          ? _value.SpecialtyName
          : SpecialtyName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialtyImplCopyWith<$Res>
    implements $SpecialtyCopyWith<$Res> {
  factory _$$SpecialtyImplCopyWith(
          _$SpecialtyImpl value, $Res Function(_$SpecialtyImpl) then) =
      __$$SpecialtyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? SpecialtyName});
}

/// @nodoc
class __$$SpecialtyImplCopyWithImpl<$Res>
    extends _$SpecialtyCopyWithImpl<$Res, _$SpecialtyImpl>
    implements _$$SpecialtyImplCopyWith<$Res> {
  __$$SpecialtyImplCopyWithImpl(
      _$SpecialtyImpl _value, $Res Function(_$SpecialtyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Specialty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? SpecialtyName = freezed,
  }) {
    return _then(_$SpecialtyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      SpecialtyName: freezed == SpecialtyName
          ? _value.SpecialtyName
          : SpecialtyName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialtyImpl implements _Specialty {
  const _$SpecialtyImpl({this.id, this.SpecialtyName});

  factory _$SpecialtyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialtyImplFromJson(json);

  @override
  final int? id;
  @override
  final String? SpecialtyName;

  @override
  String toString() {
    return 'Specialty(id: $id, SpecialtyName: $SpecialtyName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialtyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.SpecialtyName, SpecialtyName) ||
                other.SpecialtyName == SpecialtyName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, SpecialtyName);

  /// Create a copy of Specialty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialtyImplCopyWith<_$SpecialtyImpl> get copyWith =>
      __$$SpecialtyImplCopyWithImpl<_$SpecialtyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialtyImplToJson(
      this,
    );
  }
}

abstract class _Specialty implements Specialty {
  const factory _Specialty({final int? id, final String? SpecialtyName}) =
      _$SpecialtyImpl;

  factory _Specialty.fromJson(Map<String, dynamic> json) =
      _$SpecialtyImpl.fromJson;

  @override
  int? get id;
  @override
  String? get SpecialtyName;

  /// Create a copy of Specialty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialtyImplCopyWith<_$SpecialtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Medication _$MedicationFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
mixin _$Medication {
  int? get id => throw _privateConstructorUsedError;
  String? get MedicationName => throw _privateConstructorUsedError;
  int? get mn => throw _privateConstructorUsedError;
  int? get yr => throw _privateConstructorUsedError;

  /// Serializes this Medication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationCopyWith<Medication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCopyWith<$Res> {
  factory $MedicationCopyWith(
          Medication value, $Res Function(Medication) then) =
      _$MedicationCopyWithImpl<$Res, Medication>;
  @useResult
  $Res call({int? id, String? MedicationName, int? mn, int? yr});
}

/// @nodoc
class _$MedicationCopyWithImpl<$Res, $Val extends Medication>
    implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? MedicationName = freezed,
    Object? mn = freezed,
    Object? yr = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      MedicationName: freezed == MedicationName
          ? _value.MedicationName
          : MedicationName // ignore: cast_nullable_to_non_nullable
              as String?,
      mn: freezed == mn
          ? _value.mn
          : mn // ignore: cast_nullable_to_non_nullable
              as int?,
      yr: freezed == yr
          ? _value.yr
          : yr // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicationImplCopyWith<$Res>
    implements $MedicationCopyWith<$Res> {
  factory _$$MedicationImplCopyWith(
          _$MedicationImpl value, $Res Function(_$MedicationImpl) then) =
      __$$MedicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? MedicationName, int? mn, int? yr});
}

/// @nodoc
class __$$MedicationImplCopyWithImpl<$Res>
    extends _$MedicationCopyWithImpl<$Res, _$MedicationImpl>
    implements _$$MedicationImplCopyWith<$Res> {
  __$$MedicationImplCopyWithImpl(
      _$MedicationImpl _value, $Res Function(_$MedicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? MedicationName = freezed,
    Object? mn = freezed,
    Object? yr = freezed,
  }) {
    return _then(_$MedicationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      MedicationName: freezed == MedicationName
          ? _value.MedicationName
          : MedicationName // ignore: cast_nullable_to_non_nullable
              as String?,
      mn: freezed == mn
          ? _value.mn
          : mn // ignore: cast_nullable_to_non_nullable
              as int?,
      yr: freezed == yr
          ? _value.yr
          : yr // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicationImpl implements _Medication {
  const _$MedicationImpl({this.id, this.MedicationName, this.mn, this.yr});

  factory _$MedicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationImplFromJson(json);

  @override
  final int? id;
  @override
  final String? MedicationName;
  @override
  final int? mn;
  @override
  final int? yr;

  @override
  String toString() {
    return 'Medication(id: $id, MedicationName: $MedicationName, mn: $mn, yr: $yr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.MedicationName, MedicationName) ||
                other.MedicationName == MedicationName) &&
            (identical(other.mn, mn) || other.mn == mn) &&
            (identical(other.yr, yr) || other.yr == yr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, MedicationName, mn, yr);

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      __$$MedicationImplCopyWithImpl<_$MedicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationImplToJson(
      this,
    );
  }
}

abstract class _Medication implements Medication {
  const factory _Medication(
      {final int? id,
      final String? MedicationName,
      final int? mn,
      final int? yr}) = _$MedicationImpl;

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$MedicationImpl.fromJson;

  @override
  int? get id;
  @override
  String? get MedicationName;
  @override
  int? get mn;
  @override
  int? get yr;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadedFiles _$UploadedFilesFromJson(Map<String, dynamic> json) {
  return _UploadedFiles.fromJson(json);
}

/// @nodoc
mixin _$UploadedFiles {
  int? get id => throw _privateConstructorUsedError;
  String? get FileName => throw _privateConstructorUsedError;
  int? get fd => throw _privateConstructorUsedError;
  String? get fl => throw _privateConstructorUsedError;
  String? get UploadedDate => throw _privateConstructorUsedError;

  /// Serializes this UploadedFiles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadedFiles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadedFilesCopyWith<UploadedFiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedFilesCopyWith<$Res> {
  factory $UploadedFilesCopyWith(
          UploadedFiles value, $Res Function(UploadedFiles) then) =
      _$UploadedFilesCopyWithImpl<$Res, UploadedFiles>;
  @useResult
  $Res call(
      {int? id, String? FileName, int? fd, String? fl, String? UploadedDate});
}

/// @nodoc
class _$UploadedFilesCopyWithImpl<$Res, $Val extends UploadedFiles>
    implements $UploadedFilesCopyWith<$Res> {
  _$UploadedFilesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadedFiles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? FileName = freezed,
    Object? fd = freezed,
    Object? fl = freezed,
    Object? UploadedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      FileName: freezed == FileName
          ? _value.FileName
          : FileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fd: freezed == fd
          ? _value.fd
          : fd // ignore: cast_nullable_to_non_nullable
              as int?,
      fl: freezed == fl
          ? _value.fl
          : fl // ignore: cast_nullable_to_non_nullable
              as String?,
      UploadedDate: freezed == UploadedDate
          ? _value.UploadedDate
          : UploadedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadedFilesImplCopyWith<$Res>
    implements $UploadedFilesCopyWith<$Res> {
  factory _$$UploadedFilesImplCopyWith(
          _$UploadedFilesImpl value, $Res Function(_$UploadedFilesImpl) then) =
      __$$UploadedFilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? FileName, int? fd, String? fl, String? UploadedDate});
}

/// @nodoc
class __$$UploadedFilesImplCopyWithImpl<$Res>
    extends _$UploadedFilesCopyWithImpl<$Res, _$UploadedFilesImpl>
    implements _$$UploadedFilesImplCopyWith<$Res> {
  __$$UploadedFilesImplCopyWithImpl(
      _$UploadedFilesImpl _value, $Res Function(_$UploadedFilesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadedFiles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? FileName = freezed,
    Object? fd = freezed,
    Object? fl = freezed,
    Object? UploadedDate = freezed,
  }) {
    return _then(_$UploadedFilesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      FileName: freezed == FileName
          ? _value.FileName
          : FileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fd: freezed == fd
          ? _value.fd
          : fd // ignore: cast_nullable_to_non_nullable
              as int?,
      fl: freezed == fl
          ? _value.fl
          : fl // ignore: cast_nullable_to_non_nullable
              as String?,
      UploadedDate: freezed == UploadedDate
          ? _value.UploadedDate
          : UploadedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadedFilesImpl implements _UploadedFiles {
  const _$UploadedFilesImpl(
      {this.id, this.FileName, this.fd, this.fl, this.UploadedDate});

  factory _$UploadedFilesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadedFilesImplFromJson(json);

  @override
  final int? id;
  @override
  final String? FileName;
  @override
  final int? fd;
  @override
  final String? fl;
  @override
  final String? UploadedDate;

  @override
  String toString() {
    return 'UploadedFiles(id: $id, FileName: $FileName, fd: $fd, fl: $fl, UploadedDate: $UploadedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadedFilesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.FileName, FileName) ||
                other.FileName == FileName) &&
            (identical(other.fd, fd) || other.fd == fd) &&
            (identical(other.fl, fl) || other.fl == fl) &&
            (identical(other.UploadedDate, UploadedDate) ||
                other.UploadedDate == UploadedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, FileName, fd, fl, UploadedDate);

  /// Create a copy of UploadedFiles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadedFilesImplCopyWith<_$UploadedFilesImpl> get copyWith =>
      __$$UploadedFilesImplCopyWithImpl<_$UploadedFilesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadedFilesImplToJson(
      this,
    );
  }
}

abstract class _UploadedFiles implements UploadedFiles {
  const factory _UploadedFiles(
      {final int? id,
      final String? FileName,
      final int? fd,
      final String? fl,
      final String? UploadedDate}) = _$UploadedFilesImpl;

  factory _UploadedFiles.fromJson(Map<String, dynamic> json) =
      _$UploadedFilesImpl.fromJson;

  @override
  int? get id;
  @override
  String? get FileName;
  @override
  int? get fd;
  @override
  String? get fl;
  @override
  String? get UploadedDate;

  /// Create a copy of UploadedFiles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadedFilesImplCopyWith<_$UploadedFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
