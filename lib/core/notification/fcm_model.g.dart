// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FcmModelImpl _$$FcmModelImplFromJson(Map<String, dynamic> json) =>
    _$FcmModelImpl(
      deviceId: json['deviceId'] as String?,
      typeId: json['typeId'] as String?,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      eventId: json['eventId'] as String?,
      eventName: json['eventName'] as String?,
      requestId: json['requestId'] as String?,
      chatRoomId: json['chatRoomId'] as String?,
      chatContent: json['chatContent'] as String?,
      applauseCount: json['applauseCount'] as String?,
      userFullName: json['userFullName'] as String?,
      userProfileImage: json['userProfileImage'] as String?,
      isGroup: json['isGroup'] as String?,
      rate: json['rate'] as String?,
      isEventGroup: json['isEventGroup'] as String?,
    );

Map<String, dynamic> _$$FcmModelImplToJson(_$FcmModelImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'typeId': instance.typeId,
      'userId': instance.userId,
      'type': instance.type,
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'requestId': instance.requestId,
      'chatRoomId': instance.chatRoomId,
      'chatContent': instance.chatContent,
      'applauseCount': instance.applauseCount,
      'userFullName': instance.userFullName,
      'userProfileImage': instance.userProfileImage,
      'isGroup': instance.isGroup,
      'rate': instance.rate,
      'isEventGroup': instance.isEventGroup,
    };
