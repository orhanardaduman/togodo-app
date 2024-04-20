// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_timeline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageTimelineModelImpl _$$MessageTimelineModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageTimelineModelImpl(
      chatRoomId: json['chatRoomId'] as String?,
      chatRoomName: json['chatRoomName'] as String?,
      userId: json['userId'] as String?,
      userFullName: json['userFullName'] as String?,
      userName: json['userName'] as String?,
      userImageUrl: json['userImageUrl'] as String?,
      lastMessage: json['lastMessage'] as String?,
      contentType: json['contentType'] as String?,
      lastMessageContentType: json['lastMessageContentType'] as String?,
      lastMessageTime: json['lastMessageTime'] == null
          ? null
          : DateTime.parse(json['lastMessageTime'] as String),
      isSeen: json['isSeen'] as bool?,
      isMuted: json['isMuted'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      isPinned: json['isPinned'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isWriting: json['isWriting'] as bool?,
      isReplied: json['isReplied'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      isOnline: json['isOnline'] as bool?,
      isGroupChat: json['isGroupChat'] as bool?,
      isSeenGroupChat: json['isSeenGroupChat'] as bool?,
      repliedMessageId: json['repliedMessageId'] as String?,
      unseenMessagesCount: json['unseenMessagesCount'] as int?,
      joinedUsers: (json['joinedUsers'] as List<dynamic>?)
          ?.map((e) => GroupJoinedUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageTimelineModelImplToJson(
        _$MessageTimelineModelImpl instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'chatRoomName': instance.chatRoomName,
      'userId': instance.userId,
      'userFullName': instance.userFullName,
      'userName': instance.userName,
      'userImageUrl': instance.userImageUrl,
      'lastMessage': instance.lastMessage,
      'contentType': instance.contentType,
      'lastMessageContentType': instance.lastMessageContentType,
      'lastMessageTime': instance.lastMessageTime?.toIso8601String(),
      'isSeen': instance.isSeen,
      'isMuted': instance.isMuted,
      'isDeleted': instance.isDeleted,
      'isPinned': instance.isPinned,
      'isBlocked': instance.isBlocked,
      'isWriting': instance.isWriting,
      'isReplied': instance.isReplied,
      'isCurrentUser': instance.isCurrentUser,
      'isOnline': instance.isOnline,
      'isGroupChat': instance.isGroupChat,
      'isSeenGroupChat': instance.isSeenGroupChat,
      'repliedMessageId': instance.repliedMessageId,
      'unseenMessagesCount': instance.unseenMessagesCount,
      'joinedUsers': instance.joinedUsers,
    };

_$GroupJoinedUsersImpl _$$GroupJoinedUsersImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupJoinedUsersImpl(
      userImageUrl: json['userImageUrl'] as String?,
      userId: json['userId'] as String?,
      userFullName: json['userFullName'] as String?,
      isManager: json['isManager'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$$GroupJoinedUsersImplToJson(
        _$GroupJoinedUsersImpl instance) =>
    <String, dynamic>{
      'userImageUrl': instance.userImageUrl,
      'userId': instance.userId,
      'userFullName': instance.userFullName,
      'isManager': instance.isManager,
      'isCurrentUser': instance.isCurrentUser,
      'userName': instance.userName,
    };
