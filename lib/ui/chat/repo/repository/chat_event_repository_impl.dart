import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/ui/chat/repo/remote/chat_data_source.dart';
import 'package:togodo/ui/chat/repo/repository/chat_event_repository.dart';

final chatRepositoryProvider = Provider(ChatRepositoryImpl.new);

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._reader);

  final ProviderRef<dynamic> _reader;

  late final ChatDataSource _dataSource = _reader.read(chatDataSourceProvider);

  @override
  Future<Result<void>> createChatRoomWithGroup(
    String name,
    List<String> userId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.createChatRoomWithGroup(
        {
          'name': name,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> addUserToGroupChat(
    String chatRoomId,
    String userId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.addUserToGroupChat(
        {
          'chatRoomId': chatRoomId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> assignGroupChatManager(
    String chatRoomId,
    String userId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.assignGroupChatManager(
        {
          'chatRoomId': chatRoomId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> removeGroupChatRoomUser(
    String chatRoomId,
    String userId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.removeGroupChatRoomUser(
        {
          'chatRoomId': chatRoomId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> sendMessageRange(
    String eventId,
    List<String> userId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.sendMessageRange(
        {
          'eventId': eventId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> deleteMessage(
    String messageId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.deleteMessage(
        {
          'messageId': messageId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> sendMessageReaction(
    String messageId,
    String reaction,
  ) {
    return Result.guardFuture(
      () async => _dataSource.sendMessageReaction(
        {
          'messageId': messageId,
          'reaction': reaction,
        },
      ),
    );
  }

  @override
  Future<Result<void>> sendForwardMessageToRoom(
    String messageId,
    String chatRoomId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.sendForwardMessageToRoom(
        {
          'messageId': messageId,
          'chatRoomId': chatRoomId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> muteOrUnmuteChatRoom(
    String chatRoomId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.muteOrUnmuteChatRoom(
        {
          'chatRoomId': chatRoomId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> leaveChatRoom(
    String chatRoomId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.leaveChatRoom(
        {
          'chatRoomId': chatRoomId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> writingTo(
    String chatRoomId, {
    required bool isWriting,
  }) {
    return Result.guardFuture(
      () async => _dataSource.writingTo(
        {
          'chatRoomId': chatRoomId,
          'isWriting': isWriting,
        },
      ),
    );
  }

  @override
  Future<Result<void>> closeChatRoom() {
    return Result.guardFuture(
      () async => _dataSource.closeChatRoom({}),
    );
  }

  @override
  Future<Result<void>> pinChat(
    String chatRoomId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.pinChat(
        {
          'chatRoomId': chatRoomId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> updateGroupChatRoom(
    String chatRoomId,
    String name,
  ) {
    return Result.guardFuture(
      () async => _dataSource.updateGroupChatRoom(
        {
          'chatRoomId': chatRoomId,
          'name': name,
        },
      ),
    );
  }
}
