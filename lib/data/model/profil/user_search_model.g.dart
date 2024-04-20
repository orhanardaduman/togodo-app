// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSearchModelImpl _$$UserSearchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSearchModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      type: json['type'] as int?,
      isFriend: json['isFriend'] as bool?,
      inviteStatus: json['inviteStatus'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      isFollowed: json['isFollowed'] as bool?,
      isAccepted: json['isAccepted'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isRequest: json['isRequest'] as bool?,
      isHide: json['isHide'] as bool?,
    );

Map<String, dynamic> _$$UserSearchModelImplToJson(
        _$UserSearchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'type': instance.type,
      'isFriend': instance.isFriend,
      'inviteStatus': instance.inviteStatus,
      'isCurrentUser': instance.isCurrentUser,
      'isFollowed': instance.isFollowed,
      'isAccepted': instance.isAccepted,
      'isBlocked': instance.isBlocked,
      'isRequest': instance.isRequest,
      'isHide': instance.isHide,
    };
