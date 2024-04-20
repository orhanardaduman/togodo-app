// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      id: json['id'] as String?,
      facebook: json['facebook'] as bool?,
      apple: json['apple'] as bool?,
      email: json['email'] as bool?,
      twitter: json['twitter'] as bool?,
      google: json['google'] as bool?,
      otp: json['otp'] as bool?,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facebook': instance.facebook,
      'apple': instance.apple,
      'email': instance.email,
      'twitter': instance.twitter,
      'google': instance.google,
      'otp': instance.otp,
    };
