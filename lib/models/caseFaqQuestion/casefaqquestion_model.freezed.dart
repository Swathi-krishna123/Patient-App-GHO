// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'casefaqquestion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaseQuestionsResponse _$CaseQuestionsResponseFromJson(
    Map<String, dynamic> json) {
  return _CaseQuestionsResponse.fromJson(json);
}

/// @nodoc
mixin _$CaseQuestionsResponse {
  int get Status => throw _privateConstructorUsedError;
  String get Error => throw _privateConstructorUsedError;
  String get Info => throw _privateConstructorUsedError;
  List<List<dynamic>> get Data => throw _privateConstructorUsedError;

  /// Serializes this CaseQuestionsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CaseQuestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseQuestionsResponseCopyWith<CaseQuestionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseQuestionsResponseCopyWith<$Res> {
  factory $CaseQuestionsResponseCopyWith(CaseQuestionsResponse value,
          $Res Function(CaseQuestionsResponse) then) =
      _$CaseQuestionsResponseCopyWithImpl<$Res, CaseQuestionsResponse>;
  @useResult
  $Res call({int Status, String Error, String Info, List<List<dynamic>> Data});
}

/// @nodoc
class _$CaseQuestionsResponseCopyWithImpl<$Res,
        $Val extends CaseQuestionsResponse>
    implements $CaseQuestionsResponseCopyWith<$Res> {
  _$CaseQuestionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseQuestionsResponse
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
abstract class _$$CaseQuestionsResponseImplCopyWith<$Res>
    implements $CaseQuestionsResponseCopyWith<$Res> {
  factory _$$CaseQuestionsResponseImplCopyWith(
          _$CaseQuestionsResponseImpl value,
          $Res Function(_$CaseQuestionsResponseImpl) then) =
      __$$CaseQuestionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int Status, String Error, String Info, List<List<dynamic>> Data});
}

/// @nodoc
class __$$CaseQuestionsResponseImplCopyWithImpl<$Res>
    extends _$CaseQuestionsResponseCopyWithImpl<$Res,
        _$CaseQuestionsResponseImpl>
    implements _$$CaseQuestionsResponseImplCopyWith<$Res> {
  __$$CaseQuestionsResponseImplCopyWithImpl(_$CaseQuestionsResponseImpl _value,
      $Res Function(_$CaseQuestionsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CaseQuestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = null,
    Object? Error = null,
    Object? Info = null,
    Object? Data = null,
  }) {
    return _then(_$CaseQuestionsResponseImpl(
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
class _$CaseQuestionsResponseImpl implements _CaseQuestionsResponse {
  const _$CaseQuestionsResponseImpl(
      {required this.Status,
      required this.Error,
      required this.Info,
      required final List<List<dynamic>> Data})
      : _Data = Data;

  factory _$CaseQuestionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseQuestionsResponseImplFromJson(json);

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
    return 'CaseQuestionsResponse(Status: $Status, Error: $Error, Info: $Info, Data: $Data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseQuestionsResponseImpl &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.Error, Error) || other.Error == Error) &&
            (identical(other.Info, Info) || other.Info == Info) &&
            const DeepCollectionEquality().equals(other._Data, _Data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Status, Error, Info,
      const DeepCollectionEquality().hash(_Data));

  /// Create a copy of CaseQuestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseQuestionsResponseImplCopyWith<_$CaseQuestionsResponseImpl>
      get copyWith => __$$CaseQuestionsResponseImplCopyWithImpl<
          _$CaseQuestionsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseQuestionsResponseImplToJson(
      this,
    );
  }
}

abstract class _CaseQuestionsResponse implements CaseQuestionsResponse {
  const factory _CaseQuestionsResponse(
      {required final int Status,
      required final String Error,
      required final String Info,
      required final List<List<dynamic>> Data}) = _$CaseQuestionsResponseImpl;

  factory _CaseQuestionsResponse.fromJson(Map<String, dynamic> json) =
      _$CaseQuestionsResponseImpl.fromJson;

  @override
  int get Status;
  @override
  String get Error;
  @override
  String get Info;
  @override
  List<List<dynamic>> get Data;

  /// Create a copy of CaseQuestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseQuestionsResponseImplCopyWith<_$CaseQuestionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) {
  return _QuestionData.fromJson(json);
}

/// @nodoc
mixin _$QuestionData {
  int get id => throw _privateConstructorUsedError;
  String get Question => throw _privateConstructorUsedError;

  /// Serializes this QuestionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionDataCopyWith<QuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDataCopyWith<$Res> {
  factory $QuestionDataCopyWith(
          QuestionData value, $Res Function(QuestionData) then) =
      _$QuestionDataCopyWithImpl<$Res, QuestionData>;
  @useResult
  $Res call({int id, String Question});
}

/// @nodoc
class _$QuestionDataCopyWithImpl<$Res, $Val extends QuestionData>
    implements $QuestionDataCopyWith<$Res> {
  _$QuestionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? Question = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      Question: null == Question
          ? _value.Question
          : Question // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionDataImplCopyWith<$Res>
    implements $QuestionDataCopyWith<$Res> {
  factory _$$QuestionDataImplCopyWith(
          _$QuestionDataImpl value, $Res Function(_$QuestionDataImpl) then) =
      __$$QuestionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String Question});
}

/// @nodoc
class __$$QuestionDataImplCopyWithImpl<$Res>
    extends _$QuestionDataCopyWithImpl<$Res, _$QuestionDataImpl>
    implements _$$QuestionDataImplCopyWith<$Res> {
  __$$QuestionDataImplCopyWithImpl(
      _$QuestionDataImpl _value, $Res Function(_$QuestionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? Question = null,
  }) {
    return _then(_$QuestionDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      Question: null == Question
          ? _value.Question
          : Question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionDataImpl implements _QuestionData {
  const _$QuestionDataImpl({required this.id, required this.Question});

  factory _$QuestionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionDataImplFromJson(json);

  @override
  final int id;
  @override
  final String Question;

  @override
  String toString() {
    return 'QuestionData(id: $id, Question: $Question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.Question, Question) ||
                other.Question == Question));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, Question);

  /// Create a copy of QuestionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionDataImplCopyWith<_$QuestionDataImpl> get copyWith =>
      __$$QuestionDataImplCopyWithImpl<_$QuestionDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionDataImplToJson(
      this,
    );
  }
}

abstract class _QuestionData implements QuestionData {
  const factory _QuestionData(
      {required final int id,
      required final String Question}) = _$QuestionDataImpl;

  factory _QuestionData.fromJson(Map<String, dynamic> json) =
      _$QuestionDataImpl.fromJson;

  @override
  int get id;
  @override
  String get Question;

  /// Create a copy of QuestionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionDataImplCopyWith<_$QuestionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CaseQuestion _$CaseQuestionFromJson(Map<String, dynamic> json) {
  return _CaseQuestion.fromJson(json);
}

/// @nodoc
mixin _$CaseQuestion {
  int get id => throw _privateConstructorUsedError;
  int? get did =>
      throw _privateConstructorUsedError; // Nullable for the second list
  String? get Question => throw _privateConstructorUsedError;

  /// Serializes this CaseQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CaseQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseQuestionCopyWith<CaseQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseQuestionCopyWith<$Res> {
  factory $CaseQuestionCopyWith(
          CaseQuestion value, $Res Function(CaseQuestion) then) =
      _$CaseQuestionCopyWithImpl<$Res, CaseQuestion>;
  @useResult
  $Res call({int id, int? did, String? Question});
}

/// @nodoc
class _$CaseQuestionCopyWithImpl<$Res, $Val extends CaseQuestion>
    implements $CaseQuestionCopyWith<$Res> {
  _$CaseQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? did = freezed,
    Object? Question = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      did: freezed == did
          ? _value.did
          : did // ignore: cast_nullable_to_non_nullable
              as int?,
      Question: freezed == Question
          ? _value.Question
          : Question // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaseQuestionImplCopyWith<$Res>
    implements $CaseQuestionCopyWith<$Res> {
  factory _$$CaseQuestionImplCopyWith(
          _$CaseQuestionImpl value, $Res Function(_$CaseQuestionImpl) then) =
      __$$CaseQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int? did, String? Question});
}

/// @nodoc
class __$$CaseQuestionImplCopyWithImpl<$Res>
    extends _$CaseQuestionCopyWithImpl<$Res, _$CaseQuestionImpl>
    implements _$$CaseQuestionImplCopyWith<$Res> {
  __$$CaseQuestionImplCopyWithImpl(
      _$CaseQuestionImpl _value, $Res Function(_$CaseQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CaseQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? did = freezed,
    Object? Question = freezed,
  }) {
    return _then(_$CaseQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      did: freezed == did
          ? _value.did
          : did // ignore: cast_nullable_to_non_nullable
              as int?,
      Question: freezed == Question
          ? _value.Question
          : Question // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseQuestionImpl implements _CaseQuestion {
  const _$CaseQuestionImpl({required this.id, this.did, this.Question});

  factory _$CaseQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseQuestionImplFromJson(json);

  @override
  final int id;
  @override
  final int? did;
// Nullable for the second list
  @override
  final String? Question;

  @override
  String toString() {
    return 'CaseQuestion(id: $id, did: $did, Question: $Question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.did, did) || other.did == did) &&
            (identical(other.Question, Question) ||
                other.Question == Question));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, did, Question);

  /// Create a copy of CaseQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseQuestionImplCopyWith<_$CaseQuestionImpl> get copyWith =>
      __$$CaseQuestionImplCopyWithImpl<_$CaseQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseQuestionImplToJson(
      this,
    );
  }
}

abstract class _CaseQuestion implements CaseQuestion {
  const factory _CaseQuestion(
      {required final int id,
      final int? did,
      final String? Question}) = _$CaseQuestionImpl;

  factory _CaseQuestion.fromJson(Map<String, dynamic> json) =
      _$CaseQuestionImpl.fromJson;

  @override
  int get id;
  @override
  int? get did; // Nullable for the second list
  @override
  String? get Question;

  /// Create a copy of CaseQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseQuestionImplCopyWith<_$CaseQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
