// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailsResponseImpl _$$UserDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailsResponseImpl(
      Status: json['Status'],
      Error: json['Error'],
      Info: json['Info'],
      Data: json['Data'],
    );

Map<String, dynamic> _$$UserDetailsResponseImplToJson(
        _$UserDetailsResponseImpl instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Error': instance.Error,
      'Info': instance.Info,
      'Data': instance.Data,
    };

_$UserDetailImpl _$$UserDetailImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailImpl(
      LastName: json['LastName'],
      FirstName: json['FirstName'],
      Phone: json['Phone'],
      eMail: json['eMail'],
      Gendor: json['Gendor'],
      DOB: json['DOB'],
      CountryID: json['CountryID'],
      Address1: json['Address1'],
      Address2: json['Address2'],
      City: json['City'],
      State: json['State'],
      ZipCode: json['ZipCode'],
    );

Map<String, dynamic> _$$UserDetailImplToJson(_$UserDetailImpl instance) =>
    <String, dynamic>{
      'LastName': instance.LastName,
      'FirstName': instance.FirstName,
      'Phone': instance.Phone,
      'eMail': instance.eMail,
      'Gendor': instance.Gendor,
      'DOB': instance.DOB,
      'CountryID': instance.CountryID,
      'Address1': instance.Address1,
      'Address2': instance.Address2,
      'City': instance.City,
      'State': instance.State,
      'ZipCode': instance.ZipCode,
    };

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: json['id'],
      nm: json['nm'],
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nm': instance.nm,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'],
      msg: json['msg'],
      src: json['src'],
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'msg': instance.msg,
      'src': instance.src,
    };
