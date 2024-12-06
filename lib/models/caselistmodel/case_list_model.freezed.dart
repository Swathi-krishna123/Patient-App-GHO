// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaseListModel _$CaseListModelFromJson(Map<String, dynamic> json) {
  return _CaseListModel.fromJson(json);
}

/// @nodoc
mixin _$CaseListModel {
  int get Status => throw _privateConstructorUsedError;
  String get Error => throw _privateConstructorUsedError;
  String get Info => throw _privateConstructorUsedError;
  @AllCasesListModelListConverter()
  List<List<AllCasesListModel>> get Data => throw _privateConstructorUsedError;

  /// Serializes this CaseListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CaseListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseListModelCopyWith<CaseListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseListModelCopyWith<$Res> {
  factory $CaseListModelCopyWith(
          CaseListModel value, $Res Function(CaseListModel) then) =
      _$CaseListModelCopyWithImpl<$Res, CaseListModel>;
  @useResult
  $Res call(
      {int Status,
      String Error,
      String Info,
      @AllCasesListModelListConverter() List<List<AllCasesListModel>> Data});
}

/// @nodoc
class _$CaseListModelCopyWithImpl<$Res, $Val extends CaseListModel>
    implements $CaseListModelCopyWith<$Res> {
  _$CaseListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseListModel
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
              as List<List<AllCasesListModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaseListModelImplCopyWith<$Res>
    implements $CaseListModelCopyWith<$Res> {
  factory _$$CaseListModelImplCopyWith(
          _$CaseListModelImpl value, $Res Function(_$CaseListModelImpl) then) =
      __$$CaseListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int Status,
      String Error,
      String Info,
      @AllCasesListModelListConverter() List<List<AllCasesListModel>> Data});
}

/// @nodoc
class __$$CaseListModelImplCopyWithImpl<$Res>
    extends _$CaseListModelCopyWithImpl<$Res, _$CaseListModelImpl>
    implements _$$CaseListModelImplCopyWith<$Res> {
  __$$CaseListModelImplCopyWithImpl(
      _$CaseListModelImpl _value, $Res Function(_$CaseListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CaseListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = null,
    Object? Error = null,
    Object? Info = null,
    Object? Data = null,
  }) {
    return _then(_$CaseListModelImpl(
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
              as List<List<AllCasesListModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseListModelImpl implements _CaseListModel {
  _$CaseListModelImpl(
      {required this.Status,
      required this.Error,
      required this.Info,
      @AllCasesListModelListConverter()
      required final List<List<AllCasesListModel>> Data})
      : _Data = Data;

  factory _$CaseListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseListModelImplFromJson(json);

  @override
  final int Status;
  @override
  final String Error;
  @override
  final String Info;
  final List<List<AllCasesListModel>> _Data;
  @override
  @AllCasesListModelListConverter()
  List<List<AllCasesListModel>> get Data {
    if (_Data is EqualUnmodifiableListView) return _Data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_Data);
  }

  @override
  String toString() {
    return 'CaseListModel(Status: $Status, Error: $Error, Info: $Info, Data: $Data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseListModelImpl &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.Error, Error) || other.Error == Error) &&
            (identical(other.Info, Info) || other.Info == Info) &&
            const DeepCollectionEquality().equals(other._Data, _Data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Status, Error, Info,
      const DeepCollectionEquality().hash(_Data));

  /// Create a copy of CaseListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseListModelImplCopyWith<_$CaseListModelImpl> get copyWith =>
      __$$CaseListModelImplCopyWithImpl<_$CaseListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseListModelImplToJson(
      this,
    );
  }
}

abstract class _CaseListModel implements CaseListModel {
  factory _CaseListModel(
      {required final int Status,
      required final String Error,
      required final String Info,
      @AllCasesListModelListConverter()
      required final List<List<AllCasesListModel>> Data}) = _$CaseListModelImpl;

  factory _CaseListModel.fromJson(Map<String, dynamic> json) =
      _$CaseListModelImpl.fromJson;

  @override
  int get Status;
  @override
  String get Error;
  @override
  String get Info;
  @override
  @AllCasesListModelListConverter()
  List<List<AllCasesListModel>> get Data;

  /// Create a copy of CaseListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseListModelImplCopyWith<_$CaseListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AllCasesListModel _$AllCasesListModelFromJson(Map<String, dynamic> json) {
  return _AllCasesListModel.fromJson(json);
}

/// @nodoc
mixin _$AllCasesListModel {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get FirstName => throw _privateConstructorUsedError;
  dynamic get LastName => throw _privateConstructorUsedError;
  dynamic get Gender => throw _privateConstructorUsedError;
  dynamic get ReviewStatus => throw _privateConstructorUsedError;
  dynamic get Status => throw _privateConstructorUsedError;
  dynamic get RequestDate => throw _privateConstructorUsedError;

  /// Serializes this AllCasesListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllCasesListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllCasesListModelCopyWith<AllCasesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCasesListModelCopyWith<$Res> {
  factory $AllCasesListModelCopyWith(
          AllCasesListModel value, $Res Function(AllCasesListModel) then) =
      _$AllCasesListModelCopyWithImpl<$Res, AllCasesListModel>;
  @useResult
  $Res call(
      {dynamic id,
      dynamic FirstName,
      dynamic LastName,
      dynamic Gender,
      dynamic ReviewStatus,
      dynamic Status,
      dynamic RequestDate});
}

/// @nodoc
class _$AllCasesListModelCopyWithImpl<$Res, $Val extends AllCasesListModel>
    implements $AllCasesListModelCopyWith<$Res> {
  _$AllCasesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllCasesListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? FirstName = freezed,
    Object? LastName = freezed,
    Object? Gender = freezed,
    Object? ReviewStatus = freezed,
    Object? Status = freezed,
    Object? RequestDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FirstName: freezed == FirstName
          ? _value.FirstName
          : FirstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      LastName: freezed == LastName
          ? _value.LastName
          : LastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Gender: freezed == Gender
          ? _value.Gender
          : Gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ReviewStatus: freezed == ReviewStatus
          ? _value.ReviewStatus
          : ReviewStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Status: freezed == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      RequestDate: freezed == RequestDate
          ? _value.RequestDate
          : RequestDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllCasesListModelImplCopyWith<$Res>
    implements $AllCasesListModelCopyWith<$Res> {
  factory _$$AllCasesListModelImplCopyWith(_$AllCasesListModelImpl value,
          $Res Function(_$AllCasesListModelImpl) then) =
      __$$AllCasesListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      dynamic FirstName,
      dynamic LastName,
      dynamic Gender,
      dynamic ReviewStatus,
      dynamic Status,
      dynamic RequestDate});
}

/// @nodoc
class __$$AllCasesListModelImplCopyWithImpl<$Res>
    extends _$AllCasesListModelCopyWithImpl<$Res, _$AllCasesListModelImpl>
    implements _$$AllCasesListModelImplCopyWith<$Res> {
  __$$AllCasesListModelImplCopyWithImpl(_$AllCasesListModelImpl _value,
      $Res Function(_$AllCasesListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllCasesListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? FirstName = freezed,
    Object? LastName = freezed,
    Object? Gender = freezed,
    Object? ReviewStatus = freezed,
    Object? Status = freezed,
    Object? RequestDate = freezed,
  }) {
    return _then(_$AllCasesListModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FirstName: freezed == FirstName
          ? _value.FirstName
          : FirstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      LastName: freezed == LastName
          ? _value.LastName
          : LastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Gender: freezed == Gender
          ? _value.Gender
          : Gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ReviewStatus: freezed == ReviewStatus
          ? _value.ReviewStatus
          : ReviewStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Status: freezed == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      RequestDate: freezed == RequestDate
          ? _value.RequestDate
          : RequestDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllCasesListModelImpl implements _AllCasesListModel {
  _$AllCasesListModelImpl(
      {required this.id,
      this.FirstName,
      this.LastName,
      this.Gender,
      this.ReviewStatus,
      this.Status,
      this.RequestDate});

  factory _$AllCasesListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllCasesListModelImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic FirstName;
  @override
  final dynamic LastName;
  @override
  final dynamic Gender;
  @override
  final dynamic ReviewStatus;
  @override
  final dynamic Status;
  @override
  final dynamic RequestDate;

  @override
  String toString() {
    return 'AllCasesListModel(id: $id, FirstName: $FirstName, LastName: $LastName, Gender: $Gender, ReviewStatus: $ReviewStatus, Status: $Status, RequestDate: $RequestDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllCasesListModelImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.FirstName, FirstName) &&
            const DeepCollectionEquality().equals(other.LastName, LastName) &&
            const DeepCollectionEquality().equals(other.Gender, Gender) &&
            const DeepCollectionEquality()
                .equals(other.ReviewStatus, ReviewStatus) &&
            const DeepCollectionEquality().equals(other.Status, Status) &&
            const DeepCollectionEquality()
                .equals(other.RequestDate, RequestDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(FirstName),
      const DeepCollectionEquality().hash(LastName),
      const DeepCollectionEquality().hash(Gender),
      const DeepCollectionEquality().hash(ReviewStatus),
      const DeepCollectionEquality().hash(Status),
      const DeepCollectionEquality().hash(RequestDate));

  /// Create a copy of AllCasesListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllCasesListModelImplCopyWith<_$AllCasesListModelImpl> get copyWith =>
      __$$AllCasesListModelImplCopyWithImpl<_$AllCasesListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllCasesListModelImplToJson(
      this,
    );
  }
}

abstract class _AllCasesListModel implements AllCasesListModel {
  factory _AllCasesListModel(
      {required final dynamic id,
      final dynamic FirstName,
      final dynamic LastName,
      final dynamic Gender,
      final dynamic ReviewStatus,
      final dynamic Status,
      final dynamic RequestDate}) = _$AllCasesListModelImpl;

  factory _AllCasesListModel.fromJson(Map<String, dynamic> json) =
      _$AllCasesListModelImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get FirstName;
  @override
  dynamic get LastName;
  @override
  dynamic get Gender;
  @override
  dynamic get ReviewStatus;
  @override
  dynamic get Status;
  @override
  dynamic get RequestDate;

  /// Create a copy of AllCasesListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllCasesListModelImplCopyWith<_$AllCasesListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
