import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'usermodel.freezed.dart';
part 'usermodel.g.dart';

UserDetailsResponse userDetailsResponseFromJson(String str) =>
    UserDetailsResponse.fromJson(json.decode(str));

String userDetailsResponseToJson(UserDetailsResponse data) =>
    json.encode(data.toJson());

@freezed
class UserDetailsResponse with _$UserDetailsResponse {
  const factory UserDetailsResponse({
    dynamic Status,
    required dynamic Error,
    required dynamic Info,
    required dynamic Data,
  }) = _UserDetailsResponse;

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsResponseFromJson(json);
}

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    required dynamic LastName,
    required dynamic FirstName,
    required dynamic Phone,
    required dynamic eMail,
    dynamic Gendor,
    dynamic DOB,
    dynamic CountryID,
    dynamic Address1,
    dynamic Address2,
    dynamic City,
    dynamic State,
    dynamic ZipCode,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    required dynamic id,
    required dynamic nm,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required dynamic id,
    required dynamic msg,
    required dynamic src,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
