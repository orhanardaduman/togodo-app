// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageInfoModelImpl _$$MessageInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageInfoModelImpl(
      id: json['id'] as String?,
      chatRoomId: json['chatRoomId'] as String?,
      isGroupChat: json['isGroupChat'] as bool?,
      messageId: json['messageId'] as String?,
      userId: json['userId'] as String?,
      userFullName: json['userFullName'] as String?,
      userName: json['userName'] as String?,
      userImageUrl: json['userImageUrl'] as String?,
      message: json['message'] as String?,
      messageContentType: json['messageContentType'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isReplied: json['isReplied'] as bool?,
      repliedMessageId: json['repliedMessageId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isOnline: json['isOnline'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      isReacted: json['isReacted'] as bool?,
      isWriting: json['isWriting'] as bool?,
      inviteId: json['inviteId'] as String?,
      isMuted: json['isMuted'] as bool?,
      inviteStatus: json['inviteStatus'] as bool?,
      isSeen: json['isSeen'] as bool?,
      isForrwarded: json['isForrwarded'] as bool?,
      videoThumbnail: json['videoThumbnail'] as String?,
      videoResolution: json['videoResolution'] as String?,
      isSystemMessage: json['isSystemMessage'] as bool?,
      systemMessageType: json['systemMessageType'] as String?,
      systemMessageToUser: json['systemMessageToUser'] as String?,
      messageFiles: (json['messageFiles'] as List<dynamic>?)
          ?.map((e) => PostFiles.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageReactions: (json['messageReactions'] as List<dynamic>?)
          ?.map(
              (e) => MessageReactionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventInfo: json['eventInfo'] == null
          ? null
          : PostInfo.fromJson(json['eventInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageInfoModelImplToJson(
        _$MessageInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatRoomId': instance.chatRoomId,
      'isGroupChat': instance.isGroupChat,
      'messageId': instance.messageId,
      'userId': instance.userId,
      'userFullName': instance.userFullName,
      'userName': instance.userName,
      'userImageUrl': instance.userImageUrl,
      'message': instance.message,
      'messageContentType': instance.messageContentType,
      'isDeleted': instance.isDeleted,
      'isReplied': instance.isReplied,
      'repliedMessageId': instance.repliedMessageId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isOnline': instance.isOnline,
      'isCurrentUser': instance.isCurrentUser,
      'isReacted': instance.isReacted,
      'isWriting': instance.isWriting,
      'inviteId': instance.inviteId,
      'isMuted': instance.isMuted,
      'inviteStatus': instance.inviteStatus,
      'isSeen': instance.isSeen,
      'isForrwarded': instance.isForrwarded,
      'videoThumbnail': instance.videoThumbnail,
      'videoResolution': instance.videoResolution,
      'isSystemMessage': instance.isSystemMessage,
      'systemMessageType': instance.systemMessageType,
      'systemMessageToUser': instance.systemMessageToUser,
      'messageFiles': instance.messageFiles,
      'messageReactions': instance.messageReactions,
      'eventInfo': instance.eventInfo,
    };

_$MessageReactionsModelImpl _$$MessageReactionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageReactionsModelImpl(
      userId: json['userId'] as String?,
      reaction: json['reaction'] as String?,
    );

Map<String, dynamic> _$$MessageReactionsModelImplToJson(
        _$MessageReactionsModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'reaction': instance.reaction,
    };
