// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_accounts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccountsModelImpl _$$UserAccountsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAccountsModelImpl(
      name: json['name'] as String?,
      id: json['id'] as String?,
      firebaseId: json['firebaseId'] as String?,
      pp: json['pp'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserAccountsModelImplToJson(
        _$UserAccountsModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'firebaseId': instance.firebaseId,
      'pp': instance.pp,
      'token': instance.token,
    };
