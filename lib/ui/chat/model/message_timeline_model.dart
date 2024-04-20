import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_timeline_model.freezed.dart';
part 'message_timeline_model.g.dart';

@freezed
class MessageTimelineModel with _$MessageTimelineModel {
  const factory MessageTimelineModel({
    String? chatRoomId,
    String? chatRoomName,
    String? userId,
    String? userFullName,
    String? userName,
    String? userImageUrl,
    String? lastMessage,
    String? contentType,
    String? lastMessageContentType,
    DateTime? lastMessageTime,
    bool? isSeen,
    bool? isMuted,
    bool? isDeleted,
    bool? isPinned,
    bool? isBlocked,
    bool? isWriting,
    bool? isReplied,
    bool? isCurrentUser,
    bool? isOnline,
    bool? isGroupChat,
    bool? isSeenGroupChat,
    String? repliedMessageId,
    int? unseenMessagesCount,
    List<GroupJoinedUsers>? joinedUsers,
  }) = _MessageTimelineModel;

  factory MessageTimelineModel.fromJson(Map<String, Object?> json) =>
      _$MessageTimelineModelFromJson(json);
}

@freezed
class GroupJoinedUsers with _$GroupJoinedUsers {
  const factory GroupJoinedUsers({
    String? userImageUrl,
    String? userId,
    String? userFullName,
    bool? isManager,
    bool? isCurrentUser,
    String? userName,
  }) = _GroupJoinedUsers;

  factory GroupJoinedUsers.fromJson(Map<String, Object?> json) =>
      _$GroupJoinedUsersFromJson(json);
}/* 

class MessageTimelineModelAdapter extends TypeAdapter<MessageTimelineModel> {
  @override
  final typeId = 0;

  @override
  MessageTimelineModel read(BinaryReader reader) {
    final jsonString = reader.readString();
    return MessageTimelineModel.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  @override
  void write(BinaryWriter writer, MessageTimelineModel obj) {
    final jsonString = json.encode(obj.toJson());
    writer.writeString(jsonString);
  }
}

class GroupJoinedUsersAdapter extends TypeAdapter<GroupJoinedUsers> {
  @override
  final int typeId = 1; // Bu, GroupJoinedUsers için benzersiz bir ID olmalı

  @override
  GroupJoinedUsers read(BinaryReader reader) {
    final jsonString = reader.readString();
    return GroupJoinedUsers.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  @override
  void write(BinaryWriter writer, GroupJoinedUsers obj) {
    final jsonString = json.encode(obj.toJson());
    writer.writeString(jsonString);
  }
}
 */
