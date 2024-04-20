// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenModelImpl _$$TokenModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenModelImpl(
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
      profileImageUrl: json['profileImageUrl'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$TokenModelImplToJson(_$TokenModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'profileImageUrl': instance.profileImageUrl,
      'userId': instance.userId,
      'name': instance.name,
    };

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      accessToken: json['accessToken'] as String?,
      birthdayDate: json['birthdayDate'] as String?,
      firebaseUid: json['firebaseUid'] as String?,
      notReadingCount: json['notReadingCount'] as int?,
      completionRate: json['completionRate'] as int?,
      titleCompletion: json['titleCompletion'] as bool?,
      eMail: json['eMail'] as String?,
      userType: json['userType'] as int?,
      socialMediaCompletion: json['socialMediaCompletion'] as bool?,
      tagCompletion: json['tagCompletion'] as bool?,
      bioCompletion: json['bioCompletion'] as bool?,
      expiration: json['expiration'] as String?,
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'birthdayDate': instance.birthdayDate,
      'firebaseUid': instance.firebaseUid,
      'notReadingCount': instance.notReadingCount,
      'completionRate': instance.completionRate,
      'titleCompletion': instance.titleCompletion,
      'eMail': instance.eMail,
      'userType': instance.userType,
      'socialMediaCompletion': instance.socialMediaCompletion,
      'tagCompletion': instance.tagCompletion,
      'bioCompletion': instance.bioCompletion,
      'expiration': instance.expiration,
    };
