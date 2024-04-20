// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_friend_invite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventFriendInviteModelImpl _$$EventFriendInviteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventFriendInviteModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      type: json['type'] as int?,
      inviteStatus: json['inviteStatus'] as bool?,
      isFriend: json['isFriend'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      isAccepted: json['isAccepted'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isFriendRequest: json['isFriendRequest'] as bool?,
      isRequest: json['isRequest'] as bool?,
    );

Map<String, dynamic> _$$EventFriendInviteModelImplToJson(
        _$EventFriendInviteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'type': instance.type,
      'inviteStatus': instance.inviteStatus,
      'isFriend': instance.isFriend,
      'isCurrentUser': instance.isCurrentUser,
      'isAccepted': instance.isAccepted,
      'isBlocked': instance.isBlocked,
      'isFriendRequest': instance.isFriendRequest,
      'isRequest': instance.isRequest,
    };
