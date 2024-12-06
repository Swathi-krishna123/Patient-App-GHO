// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_review_patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateReviewPatientModel _$CreateReviewPatientModelFromJson(
    Map<String, dynamic> json) {
  return _CreateReviewPatientModel.fromJson(json);
}

/// @nodoc
mixin _$CreateReviewPatientModel {
  int get Status => throw _privateConstructorUsedError;
  String get Error => throw _privateConstructorUsedError;
  String get Info => throw _privateConstructorUsedError;
  @PatientModelListConverter()
  List<List<PatientModel>> get Data => throw _privateConstructorUsedError;

  /// Serializes this CreateReviewPatientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReviewPatientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReviewPatientModelCopyWith<CreateReviewPatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewPatientModelCopyWith<$Res> {
  factory $CreateReviewPatientModelCopyWith(CreateReviewPatientModel value,
          $Res Function(CreateReviewPatientModel) then) =
      _$CreateReviewPatientModelCopyWithImpl<$Res, CreateReviewPatientModel>;
  @useResult
  $Res call(
      {int Status,
      String Error,
      String Info,
      @PatientModelListConverter() List<List<PatientModel>> Data});
}

/// @nodoc
class _$CreateReviewPatientModelCopyWithImpl<$Res,
        $Val extends CreateReviewPatientModel>
    implements $CreateReviewPatientModelCopyWith<$Res> {
  _$CreateReviewPatientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReviewPatientModel
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
              as List<List<PatientModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReviewPatientModelImplCopyWith<$Res>
    implements $CreateReviewPatientModelCopyWith<$Res> {
  factory _$$CreateReviewPatientModelImplCopyWith(
          _$CreateReviewPatientModelImpl value,
          $Res Function(_$CreateReviewPatientModelImpl) then) =
      __$$CreateReviewPatientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int Status,
      String Error,
      String Info,
      @PatientModelListConverter() List<List<PatientModel>> Data});
}

/// @nodoc
class __$$CreateReviewPatientModelImplCopyWithImpl<$Res>
    extends _$CreateReviewPatientModelCopyWithImpl<$Res,
        _$CreateReviewPatientModelImpl>
    implements _$$CreateReviewPatientModelImplCopyWith<$Res> {
  __$$CreateReviewPatientModelImplCopyWithImpl(
      _$CreateReviewPatientModelImpl _value,
      $Res Function(_$CreateReviewPatientModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReviewPatientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = null,
    Object? Error = null,
    Object? Info = null,
    Object? Data = null,
  }) {
    return _then(_$CreateReviewPatientModelImpl(
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
              as List<List<PatientModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReviewPatientModelImpl implements _CreateReviewPatientModel {
  _$CreateReviewPatientModelImpl(
      {required this.Status,
      required this.Error,
      required this.Info,
      @PatientModelListConverter()
      required final List<List<PatientModel>> Data})
      : _Data = Data;

  factory _$CreateReviewPatientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReviewPatientModelImplFromJson(json);

  @override
  final int Status;
  @override
  final String Error;
  @override
  final String Info;
  final List<List<PatientModel>> _Data;
  @override
  @PatientModelListConverter()
  List<List<PatientModel>> get Data {
    if (_Data is EqualUnmodifiableListView) return _Data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_Data);
  }

  @override
  String toString() {
    return 'CreateReviewPatientModel(Status: $Status, Error: $Error, Info: $Info, Data: $Data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReviewPatientModelImpl &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.Error, Error) || other.Error == Error) &&
            (identical(other.Info, Info) || other.Info == Info) &&
            const DeepCollectionEquality().equals(other._Data, _Data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Status, Error, Info,
      const DeepCollectionEquality().hash(_Data));

  /// Create a copy of CreateReviewPatientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReviewPatientModelImplCopyWith<_$CreateReviewPatientModelImpl>
      get copyWith => __$$CreateReviewPatientModelImplCopyWithImpl<
          _$CreateReviewPatientModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReviewPatientModelImplToJson(
      this,
    );
  }
}

abstract class _CreateReviewPatientModel implements CreateReviewPatientModel {
  factory _CreateReviewPatientModel(
          {required final int Status,
          required final String Error,
          required final String Info,
          @PatientModelListConverter()
          required final List<List<PatientModel>> Data}) =
      _$CreateReviewPatientModelImpl;

  factory _CreateReviewPatientModel.fromJson(Map<String, dynamic> json) =
      _$CreateReviewPatientModelImpl.fromJson;

  @override
  int get Status;
  @override
  String get Error;
  @override
  String get Info;
  @override
  @PatientModelListConverter()
  List<List<PatientModel>> get Data;

  /// Create a copy of CreateReviewPatientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReviewPatientModelImplCopyWith<_$CreateReviewPatientModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) {
  return _PatientModel.fromJson(json);
}

/// @nodoc
mixin _$PatientModel {
  String get id => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;

  /// Serializes this PatientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientModelCopyWith<PatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientModelCopyWith<$Res> {
  factory $PatientModelCopyWith(
          PatientModel value, $Res Function(PatientModel) then) =
      _$PatientModelCopyWithImpl<$Res, PatientModel>;
  @useResult
  $Res call({String id, String? msg});
}

/// @nodoc
class _$PatientModelCopyWithImpl<$Res, $Val extends PatientModel>
    implements $PatientModelCopyWith<$Res> {
  _$PatientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientModelImplCopyWith<$Res>
    implements $PatientModelCopyWith<$Res> {
  factory _$$PatientModelImplCopyWith(
          _$PatientModelImpl value, $Res Function(_$PatientModelImpl) then) =
      __$$PatientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? msg});
}

/// @nodoc
class __$$PatientModelImplCopyWithImpl<$Res>
    extends _$PatientModelCopyWithImpl<$Res, _$PatientModelImpl>
    implements _$$PatientModelImplCopyWith<$Res> {
  __$$PatientModelImplCopyWithImpl(
      _$PatientModelImpl _value, $Res Function(_$PatientModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? msg = freezed,
  }) {
    return _then(_$PatientModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientModelImpl implements _PatientModel {
  _$PatientModelImpl({required this.id, this.msg});

  factory _$PatientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? msg;

  @override
  String toString() {
    return 'PatientModel(id: $id, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, msg);

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientModelImplCopyWith<_$PatientModelImpl> get copyWith =>
      __$$PatientModelImplCopyWithImpl<_$PatientModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientModelImplToJson(
      this,
    );
  }
}

abstract class _PatientModel implements PatientModel {
  factory _PatientModel({required final String id, final String? msg}) =
      _$PatientModelImpl;

  factory _PatientModel.fromJson(Map<String, dynamic> json) =
      _$PatientModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get msg;

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientModelImplCopyWith<_$PatientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
