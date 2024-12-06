// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speciality_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpecialityModel _$SpecialityModelFromJson(Map<String, dynamic> json) {
  return _SpecialityModel.fromJson(json);
}

/// @nodoc
mixin _$SpecialityModel {
  int get Status => throw _privateConstructorUsedError;
  String get Error => throw _privateConstructorUsedError;
  String get Info => throw _privateConstructorUsedError;
  @SpecialityListModelConverter()
  List<List<SpecialityListModel>> get Data =>
      throw _privateConstructorUsedError;

  /// Serializes this SpecialityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialityModelCopyWith<SpecialityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialityModelCopyWith<$Res> {
  factory $SpecialityModelCopyWith(
          SpecialityModel value, $Res Function(SpecialityModel) then) =
      _$SpecialityModelCopyWithImpl<$Res, SpecialityModel>;
  @useResult
  $Res call(
      {int Status,
      String Error,
      String Info,
      @SpecialityListModelConverter() List<List<SpecialityListModel>> Data});
}

/// @nodoc
class _$SpecialityModelCopyWithImpl<$Res, $Val extends SpecialityModel>
    implements $SpecialityModelCopyWith<$Res> {
  _$SpecialityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialityModel
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
              as List<List<SpecialityListModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialityModelImplCopyWith<$Res>
    implements $SpecialityModelCopyWith<$Res> {
  factory _$$SpecialityModelImplCopyWith(_$SpecialityModelImpl value,
          $Res Function(_$SpecialityModelImpl) then) =
      __$$SpecialityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int Status,
      String Error,
      String Info,
      @SpecialityListModelConverter() List<List<SpecialityListModel>> Data});
}

/// @nodoc
class __$$SpecialityModelImplCopyWithImpl<$Res>
    extends _$SpecialityModelCopyWithImpl<$Res, _$SpecialityModelImpl>
    implements _$$SpecialityModelImplCopyWith<$Res> {
  __$$SpecialityModelImplCopyWithImpl(
      _$SpecialityModelImpl _value, $Res Function(_$SpecialityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = null,
    Object? Error = null,
    Object? Info = null,
    Object? Data = null,
  }) {
    return _then(_$SpecialityModelImpl(
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
              as List<List<SpecialityListModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialityModelImpl implements _SpecialityModel {
  _$SpecialityModelImpl(
      {required this.Status,
      required this.Error,
      required this.Info,
      @SpecialityListModelConverter()
      required final List<List<SpecialityListModel>> Data})
      : _Data = Data;

  factory _$SpecialityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialityModelImplFromJson(json);

  @override
  final int Status;
  @override
  final String Error;
  @override
  final String Info;
  final List<List<SpecialityListModel>> _Data;
  @override
  @SpecialityListModelConverter()
  List<List<SpecialityListModel>> get Data {
    if (_Data is EqualUnmodifiableListView) return _Data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_Data);
  }

  @override
  String toString() {
    return 'SpecialityModel(Status: $Status, Error: $Error, Info: $Info, Data: $Data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialityModelImpl &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.Error, Error) || other.Error == Error) &&
            (identical(other.Info, Info) || other.Info == Info) &&
            const DeepCollectionEquality().equals(other._Data, _Data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Status, Error, Info,
      const DeepCollectionEquality().hash(_Data));

  /// Create a copy of SpecialityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialityModelImplCopyWith<_$SpecialityModelImpl> get copyWith =>
      __$$SpecialityModelImplCopyWithImpl<_$SpecialityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialityModelImplToJson(
      this,
    );
  }
}

abstract class _SpecialityModel implements SpecialityModel {
  factory _SpecialityModel(
          {required final int Status,
          required final String Error,
          required final String Info,
          @SpecialityListModelConverter()
          required final List<List<SpecialityListModel>> Data}) =
      _$SpecialityModelImpl;

  factory _SpecialityModel.fromJson(Map<String, dynamic> json) =
      _$SpecialityModelImpl.fromJson;

  @override
  int get Status;
  @override
  String get Error;
  @override
  String get Info;
  @override
  @SpecialityListModelConverter()
  List<List<SpecialityListModel>> get Data;

  /// Create a copy of SpecialityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialityModelImplCopyWith<_$SpecialityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpecialityListModel _$SpecialityListModelFromJson(Map<String, dynamic> json) {
  return _SpecialityListModel.fromJson(json);
}

/// @nodoc
mixin _$SpecialityListModel {
  int get id => throw _privateConstructorUsedError;
  String? get nm => throw _privateConstructorUsedError;

  /// Serializes this SpecialityListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialityListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialityListModelCopyWith<SpecialityListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialityListModelCopyWith<$Res> {
  factory $SpecialityListModelCopyWith(
          SpecialityListModel value, $Res Function(SpecialityListModel) then) =
      _$SpecialityListModelCopyWithImpl<$Res, SpecialityListModel>;
  @useResult
  $Res call({int id, String? nm});
}

/// @nodoc
class _$SpecialityListModelCopyWithImpl<$Res, $Val extends SpecialityListModel>
    implements $SpecialityListModelCopyWith<$Res> {
  _$SpecialityListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialityListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nm = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nm: freezed == nm
          ? _value.nm
          : nm // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialityListModelImplCopyWith<$Res>
    implements $SpecialityListModelCopyWith<$Res> {
  factory _$$SpecialityListModelImplCopyWith(_$SpecialityListModelImpl value,
          $Res Function(_$SpecialityListModelImpl) then) =
      __$$SpecialityListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? nm});
}

/// @nodoc
class __$$SpecialityListModelImplCopyWithImpl<$Res>
    extends _$SpecialityListModelCopyWithImpl<$Res, _$SpecialityListModelImpl>
    implements _$$SpecialityListModelImplCopyWith<$Res> {
  __$$SpecialityListModelImplCopyWithImpl(_$SpecialityListModelImpl _value,
      $Res Function(_$SpecialityListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialityListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nm = freezed,
  }) {
    return _then(_$SpecialityListModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nm: freezed == nm
          ? _value.nm
          : nm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialityListModelImpl implements _SpecialityListModel {
  _$SpecialityListModelImpl({required this.id, this.nm});

  factory _$SpecialityListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialityListModelImplFromJson(json);

  @override
  final int id;
  @override
  final String? nm;

  @override
  String toString() {
    return 'SpecialityListModel(id: $id, nm: $nm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialityListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nm, nm) || other.nm == nm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nm);

  /// Create a copy of SpecialityListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialityListModelImplCopyWith<_$SpecialityListModelImpl> get copyWith =>
      __$$SpecialityListModelImplCopyWithImpl<_$SpecialityListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialityListModelImplToJson(
      this,
    );
  }
}

abstract class _SpecialityListModel implements SpecialityListModel {
  factory _SpecialityListModel({required final int id, final String? nm}) =
      _$SpecialityListModelImpl;

  factory _SpecialityListModel.fromJson(Map<String, dynamic> json) =
      _$SpecialityListModelImpl.fromJson;

  @override
  int get id;
  @override
  String? get nm;

  /// Create a copy of SpecialityListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialityListModelImplCopyWith<_$SpecialityListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
