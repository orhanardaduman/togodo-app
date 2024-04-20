// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventRequestModelImpl _$$EventRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventRequestModelImpl(
      requestId: json['requestId'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      date: json['date'] as String?,
      requestStatus: json['requestStatus'] as bool?,
      friend: json['friend'] == null
          ? null
          : Friend.fromJson(json['friend'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventRequestModelImplToJson(
        _$EventRequestModelImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'date': instance.date,
      'requestStatus': instance.requestStatus,
      'friend': instance.friend,
    };

_$FriendImpl _$$FriendImplFromJson(Map<String, dynamic> json) => _$FriendImpl(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$FriendImplToJson(_$FriendImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
    };
