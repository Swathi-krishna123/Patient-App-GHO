// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usermodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDetailsResponse _$UserDetailsResponseFromJson(Map<String, dynamic> json) {
  return _UserDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$UserDetailsResponse {
  dynamic get Status => throw _privateConstructorUsedError;
  dynamic get Error => throw _privateConstructorUsedError;
  dynamic get Info => throw _privateConstructorUsedError;
  dynamic get Data => throw _privateConstructorUsedError;

  /// Serializes this UserDetailsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailsResponseCopyWith<UserDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsResponseCopyWith<$Res> {
  factory $UserDetailsResponseCopyWith(
          UserDetailsResponse value, $Res Function(UserDetailsResponse) then) =
      _$UserDetailsResponseCopyWithImpl<$Res, UserDetailsResponse>;
  @useResult
  $Res call({dynamic Status, dynamic Error, dynamic Info, dynamic Data});
}

/// @nodoc
class _$UserDetailsResponseCopyWithImpl<$Res, $Val extends UserDetailsResponse>
    implements $UserDetailsResponseCopyWith<$Res> {
  _$UserDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = freezed,
    Object? Error = freezed,
    Object? Info = freezed,
    Object? Data = freezed,
  }) {
    return _then(_value.copyWith(
      Status: freezed == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Error: freezed == Error
          ? _value.Error
          : Error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Info: freezed == Info
          ? _value.Info
          : Info // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Data: freezed == Data
          ? _value.Data
          : Data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailsResponseImplCopyWith<$Res>
    implements $UserDetailsResponseCopyWith<$Res> {
  factory _$$UserDetailsResponseImplCopyWith(_$UserDetailsResponseImpl value,
          $Res Function(_$UserDetailsResponseImpl) then) =
      __$$UserDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic Status, dynamic Error, dynamic Info, dynamic Data});
}

/// @nodoc
class __$$UserDetailsResponseImplCopyWithImpl<$Res>
    extends _$UserDetailsResponseCopyWithImpl<$Res, _$UserDetailsResponseImpl>
    implements _$$UserDetailsResponseImplCopyWith<$Res> {
  __$$UserDetailsResponseImplCopyWithImpl(_$UserDetailsResponseImpl _value,
      $Res Function(_$UserDetailsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Status = freezed,
    Object? Error = freezed,
    Object? Info = freezed,
    Object? Data = freezed,
  }) {
    return _then(_$UserDetailsResponseImpl(
      Status: freezed == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Error: freezed == Error
          ? _value.Error
          : Error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Info: freezed == Info
          ? _value.Info
          : Info // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Data: freezed == Data
          ? _value.Data
          : Data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailsResponseImpl implements _UserDetailsResponse {
  const _$UserDetailsResponseImpl(
      {this.Status,
      required this.Error,
      required this.Info,
      required this.Data});

  factory _$UserDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsResponseImplFromJson(json);

  @override
  final dynamic Status;
  @override
  final dynamic Error;
  @override
  final dynamic Info;
  @override
  final dynamic Data;

  @override
  String toString() {
    return 'UserDetailsResponse(Status: $Status, Error: $Error, Info: $Info, Data: $Data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsResponseImpl &&
            const DeepCollectionEquality().equals(other.Status, Status) &&
            const DeepCollectionEquality().equals(other.Error, Error) &&
            const DeepCollectionEquality().equals(other.Info, Info) &&
            const DeepCollectionEquality().equals(other.Data, Data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(Status),
      const DeepCollectionEquality().hash(Error),
      const DeepCollectionEquality().hash(Info),
      const DeepCollectionEquality().hash(Data));

  /// Create a copy of UserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsResponseImplCopyWith<_$UserDetailsResponseImpl> get copyWith =>
      __$$UserDetailsResponseImplCopyWithImpl<_$UserDetailsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _UserDetailsResponse implements UserDetailsResponse {
  const factory _UserDetailsResponse(
      {final dynamic Status,
      required final dynamic Error,
      required final dynamic Info,
      required final dynamic Data}) = _$UserDetailsResponseImpl;

  factory _UserDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$UserDetailsResponseImpl.fromJson;

  @override
  dynamic get Status;
  @override
  dynamic get Error;
  @override
  dynamic get Info;
  @override
  dynamic get Data;

  /// Create a copy of UserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailsResponseImplCopyWith<_$UserDetailsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return _UserDetail.fromJson(json);
}

/// @nodoc
mixin _$UserDetail {
  dynamic get LastName => throw _privateConstructorUsedError;
  dynamic get FirstName => throw _privateConstructorUsedError;
  dynamic get Phone => throw _privateConstructorUsedError;
  dynamic get eMail => throw _privateConstructorUsedError;
  dynamic get Gendor => throw _privateConstructorUsedError;
  dynamic get DOB => throw _privateConstructorUsedError;
  dynamic get CountryID => throw _privateConstructorUsedError;
  dynamic get Address1 => throw _privateConstructorUsedError;
  dynamic get Address2 => throw _privateConstructorUsedError;
  dynamic get City => throw _privateConstructorUsedError;
  dynamic get State => throw _privateConstructorUsedError;
  dynamic get ZipCode => throw _privateConstructorUsedError;

  /// Serializes this UserDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailCopyWith<UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailCopyWith<$Res> {
  factory $UserDetailCopyWith(
          UserDetail value, $Res Function(UserDetail) then) =
      _$UserDetailCopyWithImpl<$Res, UserDetail>;
  @useResult
  $Res call(
      {dynamic LastName,
      dynamic FirstName,
      dynamic Phone,
      dynamic eMail,
      dynamic Gendor,
      dynamic DOB,
      dynamic CountryID,
      dynamic Address1,
      dynamic Address2,
      dynamic City,
      dynamic State,
      dynamic ZipCode});
}

/// @nodoc
class _$UserDetailCopyWithImpl<$Res, $Val extends UserDetail>
    implements $UserDetailCopyWith<$Res> {
  _$UserDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LastName = freezed,
    Object? FirstName = freezed,
    Object? Phone = freezed,
    Object? eMail = freezed,
    Object? Gendor = freezed,
    Object? DOB = freezed,
    Object? CountryID = freezed,
    Object? Address1 = freezed,
    Object? Address2 = freezed,
    Object? City = freezed,
    Object? State = freezed,
    Object? ZipCode = freezed,
  }) {
    return _then(_value.copyWith(
      LastName: freezed == LastName
          ? _value.LastName
          : LastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FirstName: freezed == FirstName
          ? _value.FirstName
          : FirstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Phone: freezed == Phone
          ? _value.Phone
          : Phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      eMail: freezed == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Gendor: freezed == Gendor
          ? _value.Gendor
          : Gendor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      DOB: freezed == DOB
          ? _value.DOB
          : DOB // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CountryID: freezed == CountryID
          ? _value.CountryID
          : CountryID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Address1: freezed == Address1
          ? _value.Address1
          : Address1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Address2: freezed == Address2
          ? _value.Address2
          : Address2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      City: freezed == City
          ? _value.City
          : City // ignore: cast_nullable_to_non_nullable
              as dynamic,
      State: freezed == State
          ? _value.State
          : State // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ZipCode: freezed == ZipCode
          ? _value.ZipCode
          : ZipCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailImplCopyWith<$Res>
    implements $UserDetailCopyWith<$Res> {
  factory _$$UserDetailImplCopyWith(
          _$UserDetailImpl value, $Res Function(_$UserDetailImpl) then) =
      __$$UserDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic LastName,
      dynamic FirstName,
      dynamic Phone,
      dynamic eMail,
      dynamic Gendor,
      dynamic DOB,
      dynamic CountryID,
      dynamic Address1,
      dynamic Address2,
      dynamic City,
      dynamic State,
      dynamic ZipCode});
}

/// @nodoc
class __$$UserDetailImplCopyWithImpl<$Res>
    extends _$UserDetailCopyWithImpl<$Res, _$UserDetailImpl>
    implements _$$UserDetailImplCopyWith<$Res> {
  __$$UserDetailImplCopyWithImpl(
      _$UserDetailImpl _value, $Res Function(_$UserDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LastName = freezed,
    Object? FirstName = freezed,
    Object? Phone = freezed,
    Object? eMail = freezed,
    Object? Gendor = freezed,
    Object? DOB = freezed,
    Object? CountryID = freezed,
    Object? Address1 = freezed,
    Object? Address2 = freezed,
    Object? City = freezed,
    Object? State = freezed,
    Object? ZipCode = freezed,
  }) {
    return _then(_$UserDetailImpl(
      LastName: freezed == LastName
          ? _value.LastName
          : LastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FirstName: freezed == FirstName
          ? _value.FirstName
          : FirstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Phone: freezed == Phone
          ? _value.Phone
          : Phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      eMail: freezed == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Gendor: freezed == Gendor
          ? _value.Gendor
          : Gendor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      DOB: freezed == DOB
          ? _value.DOB
          : DOB // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CountryID: freezed == CountryID
          ? _value.CountryID
          : CountryID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Address1: freezed == Address1
          ? _value.Address1
          : Address1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Address2: freezed == Address2
          ? _value.Address2
          : Address2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      City: freezed == City
          ? _value.City
          : City // ignore: cast_nullable_to_non_nullable
              as dynamic,
      State: freezed == State
          ? _value.State
          : State // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ZipCode: freezed == ZipCode
          ? _value.ZipCode
          : ZipCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailImpl implements _UserDetail {
  const _$UserDetailImpl(
      {required this.LastName,
      required this.FirstName,
      required this.Phone,
      required this.eMail,
      this.Gendor,
      this.DOB,
      this.CountryID,
      this.Address1,
      this.Address2,
      this.City,
      this.State,
      this.ZipCode});

  factory _$UserDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailImplFromJson(json);

  @override
  final dynamic LastName;
  @override
  final dynamic FirstName;
  @override
  final dynamic Phone;
  @override
  final dynamic eMail;
  @override
  final dynamic Gendor;
  @override
  final dynamic DOB;
  @override
  final dynamic CountryID;
  @override
  final dynamic Address1;
  @override
  final dynamic Address2;
  @override
  final dynamic City;
  @override
  final dynamic State;
  @override
  final dynamic ZipCode;

  @override
  String toString() {
    return 'UserDetail(LastName: $LastName, FirstName: $FirstName, Phone: $Phone, eMail: $eMail, Gendor: $Gendor, DOB: $DOB, CountryID: $CountryID, Address1: $Address1, Address2: $Address2, City: $City, State: $State, ZipCode: $ZipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailImpl &&
            const DeepCollectionEquality().equals(other.LastName, LastName) &&
            const DeepCollectionEquality().equals(other.FirstName, FirstName) &&
            const DeepCollectionEquality().equals(other.Phone, Phone) &&
            const DeepCollectionEquality().equals(other.eMail, eMail) &&
            const DeepCollectionEquality().equals(other.Gendor, Gendor) &&
            const DeepCollectionEquality().equals(other.DOB, DOB) &&
            const DeepCollectionEquality().equals(other.CountryID, CountryID) &&
            const DeepCollectionEquality().equals(other.Address1, Address1) &&
            const DeepCollectionEquality().equals(other.Address2, Address2) &&
            const DeepCollectionEquality().equals(other.City, City) &&
            const DeepCollectionEquality().equals(other.State, State) &&
            const DeepCollectionEquality().equals(other.ZipCode, ZipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(LastName),
      const DeepCollectionEquality().hash(FirstName),
      const DeepCollectionEquality().hash(Phone),
      const DeepCollectionEquality().hash(eMail),
      const DeepCollectionEquality().hash(Gendor),
      const DeepCollectionEquality().hash(DOB),
      const DeepCollectionEquality().hash(CountryID),
      const DeepCollectionEquality().hash(Address1),
      const DeepCollectionEquality().hash(Address2),
      const DeepCollectionEquality().hash(City),
      const DeepCollectionEquality().hash(State),
      const DeepCollectionEquality().hash(ZipCode));

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailImplCopyWith<_$UserDetailImpl> get copyWith =>
      __$$UserDetailImplCopyWithImpl<_$UserDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailImplToJson(
      this,
    );
  }
}

abstract class _UserDetail implements UserDetail {
  const factory _UserDetail(
      {required final dynamic LastName,
      required final dynamic FirstName,
      required final dynamic Phone,
      required final dynamic eMail,
      final dynamic Gendor,
      final dynamic DOB,
      final dynamic CountryID,
      final dynamic Address1,
      final dynamic Address2,
      final dynamic City,
      final dynamic State,
      final dynamic ZipCode}) = _$UserDetailImpl;

  factory _UserDetail.fromJson(Map<String, dynamic> json) =
      _$UserDetailImpl.fromJson;

  @override
  dynamic get LastName;
  @override
  dynamic get FirstName;
  @override
  dynamic get Phone;
  @override
  dynamic get eMail;
  @override
  dynamic get Gendor;
  @override
  dynamic get DOB;
  @override
  dynamic get CountryID;
  @override
  dynamic get Address1;
  @override
  dynamic get Address2;
  @override
  dynamic get City;
  @override
  dynamic get State;
  @override
  dynamic get ZipCode;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailImplCopyWith<_$UserDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get nm => throw _privateConstructorUsedError;

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({dynamic id, dynamic nm});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nm = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nm: freezed == nm
          ? _value.nm
          : nm // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, dynamic nm});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nm = freezed,
  }) {
    return _then(_$CountryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nm: freezed == nm
          ? _value.nm
          : nm // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl implements _Country {
  const _$CountryImpl({required this.id, required this.nm});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic nm;

  @override
  String toString() {
    return 'Country(id: $id, nm: $nm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nm, nm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nm));

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {required final dynamic id, required final dynamic nm}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get nm;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get msg => throw _privateConstructorUsedError;
  dynamic get src => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({dynamic id, dynamic msg, dynamic src});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? msg = freezed,
    Object? src = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as dynamic,
      src: freezed == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, dynamic msg, dynamic src});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? msg = freezed,
    Object? src = freezed,
  }) {
    return _then(_$MessageImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as dynamic,
      src: freezed == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({required this.id, required this.msg, required this.src});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic msg;
  @override
  final dynamic src;

  @override
  String toString() {
    return 'Message(id: $id, msg: $msg, src: $src)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.msg, msg) &&
            const DeepCollectionEquality().equals(other.src, src));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(msg),
      const DeepCollectionEquality().hash(src));

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final dynamic id,
      required final dynamic msg,
      required final dynamic src}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get msg;
  @override
  dynamic get src;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
