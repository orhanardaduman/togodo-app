// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      requestId: json['requestId'] as String?,
      request: json['request'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'requestId': instance.requestId,
      'request': instance.request,
      'user': instance.user,
      'event': instance.event,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      friendId: json['friendId'] as String?,
      friendName: json['friendName'] as String?,
      friendImageUrl: json['friendImageUrl'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'friendId': instance.friendId,
      'friendName': instance.friendName,
      'friendImageUrl': instance.friendImageUrl,
    };

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
