import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/ui/chat/model/post_files.dart';
import 'package:togodo/ui/chat/model/post_info_model.dart';

part 'message_info_model.freezed.dart';
part 'message_info_model.g.dart';

@freezed
class MessageInfoModel with _$MessageInfoModel {
  const factory MessageInfoModel({
    String? id,
    String? chatRoomId,
    bool? isGroupChat,
    String? messageId,
    String? userId,
    String? userFullName,
    String? userName,
    String? userImageUrl,
    String? message,
    String? messageContentType,
    bool? isDeleted,
    bool? isReplied,
    String? repliedMessageId,
    DateTime? createdAt,
    bool? isOnline,
    bool? isCurrentUser,
    bool? isReacted,
    bool? isWriting,
    String? inviteId,
    bool? isMuted,
    bool? inviteStatus,
    bool? isSeen,
    bool? isForrwarded,
    String? videoThumbnail,
    String? videoResolution,
    bool? isSystemMessage,
    String? systemMessageType,
    String? systemMessageToUser,
    List<PostFiles>? messageFiles,
    List<MessageReactionsModel>? messageReactions,
    PostInfo? eventInfo,
  }) = _MessageInfoModel;

  factory MessageInfoModel.fromJson(Map<String, Object?> json) =>
      _$MessageInfoModelFromJson(json);
}

@freezed
class MessageReactionsModel with _$MessageReactionsModel {
  const factory MessageReactionsModel({
    String? userId,
    String? reaction,
  }) = _MessageReactionsModel;

  factory MessageReactionsModel.fromJson(Map<String, Object?> json) =>
      _$MessageReactionsModelFromJson(json);
}
/* 
class MessageInfoModelAdapter extends TypeAdapter<MessageInfoModel> {
  @override
  final int typeId = 3; // Bu, MessageInfoModel için benzersiz bir ID olmalı

  @override
  MessageInfoModel read(BinaryReader reader) {
    final jsonString = reader.readString();
    return MessageInfoModel.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  @override
  void write(BinaryWriter writer, MessageInfoModel obj) {
    final jsonString = json.encode(obj.toJson());
    writer.writeString(jsonString);
  }
}

class MessageReactionsModelAdapter extends TypeAdapter<MessageReactionsModel> {
  @override
  final int typeId =
      4; // Bu, MessageReactionsModel için benzersiz bir ID olmalı

  @override
  MessageReactionsModel read(BinaryReader reader) {
    final jsonString = reader.readString();
    return MessageReactionsModel.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  @override
  void write(BinaryWriter writer, MessageReactionsModel obj) {
    final jsonString = json.encode(obj.toJson());
    writer.writeString(jsonString);
  }
}
 */
