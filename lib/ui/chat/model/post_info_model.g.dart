// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostInfoImpl _$$PostInfoImplFromJson(Map<String, dynamic> json) =>
    _$PostInfoImpl(
      eventId: json['eventId'] as String?,
      userName: json['userName'] as String?,
      userFullName: json['userFullName'] as String?,
      userImageUrl: json['userImageUrl'] as String?,
      eventContent: json['eventContent'] as String?,
      eventImageUrl: json['eventImageUrl'] as String?,
      eventDate: json['eventDate'] as String?,
      eventName: json['eventName'] as String?,
      eventLocation: json['eventLocation'] as String?,
    );

Map<String, dynamic> _$$PostInfoImplToJson(_$PostInfoImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'userName': instance.userName,
      'userFullName': instance.userFullName,
      'userImageUrl': instance.userImageUrl,
      'eventContent': instance.eventContent,
      'eventImageUrl': instance.eventImageUrl,
      'eventDate': instance.eventDate,
      'eventName': instance.eventName,
      'eventLocation': instance.eventLocation,
    };
