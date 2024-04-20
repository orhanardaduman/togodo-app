import 'package:togodo/data/model/result.dart';

abstract class ChatRepository {
  Future<Result<void>> createChatRoomWithGroup(
    String name,
    List<String> userId,
  );
  Future<Result<void>> addUserToGroupChat(String chatRoomId, String userId);
  Future<Result<void>> assignGroupChatManager(String chatRoomId, String userId);
  Future<Result<void>> removeGroupChatRoomUser(
    String chatRoomId,
    String userId,
  );
  Future<Result<void>> sendMessageRange(String eventId, List<String> userId);
  Future<Result<void>> deleteMessage(
    String messageId,
  );
  Future<Result<void>> sendMessageReaction(
    String messageId,
    String reaction,
  );
  Future<Result<void>> sendForwardMessageToRoom(
    String messageId,
    String chatRoomId,
  );
  Future<Result<void>> muteOrUnmuteChatRoom(
    String chatRoomId,
  );
  Future<Result<void>> leaveChatRoom(
    String chatRoomId,
  );
  Future<Result<void>> writingTo(
    String chatRoomId, {
    required bool isWriting,
  });

  Future<Result<void>> closeChatRoom();
  Future<Result<void>> pinChat(
    String chatRoomId,
  );
  Future<Result<void>> updateGroupChatRoom(
    String chatRoomId,
    String name,
  );
}
