// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/chat/model/index.dart';
import 'package:togodo/ui/chat/repo/repository/chat_event_repository.dart';
import 'package:togodo/ui/chat/repo/repository/chat_event_repository_impl.dart';
import 'package:togodo/ui/chat/services/connect_services.dart';
part 'web_socket_notifier.freezed.dart';

final webSocketProvider =
    StateNotifierProvider<WebSocketNotifier, WebSocketState>(
  WebSocketNotifier.new,
);

@freezed
class WebSocketState with _$WebSocketState {
  const factory WebSocketState({
    @Default([]) List<MessageTimelineModel> chatData,
    @Default([]) List<MessageTimelineModel> groupChatData,
    @Default([]) List<MessageTimelineModel> initData,
    @Default(false) bool loading,
    @Default(false) bool connectionStatus,
  }) = _WebSocketState;
}

class WebSocketNotifier extends StateNotifier<WebSocketState> {
  WebSocketNotifier(this._ref) : super(const WebSocketState());
  final Ref _ref;
  bool _isDisposed = false;
  late final ChatRepository _repository = _ref.read(chatRepositoryProvider);
  WebSocketService webSocketService = WebSocketService.instance;
  Future<void> refreshData() async {
    state = state.copyWith(
      loading: true,
      initData: [],
      chatData: [],
      connectionStatus: false,
      groupChatData: [],
    );
  }

  Future<void> connect({bool loading = true, String? token}) async {
    print("giden token: $token ");
    if (_isDisposed) return;
    state = state.copyWith(loading: loading);
    await webSocketService.connect(token!);
    await webSocketService.getAllChatdata(token);
    socketListen();
  }

  void socketListen() {
    if (_isDisposed) return;
    webSocketService.onData((event, rawMessage) async {
      //  try {
      if (event == "GetDirectMessageTimeline") {
        final message = rawMessage;

        state = state.copyWith(connectionStatus: true);

        final List<dynamic> argumentList = message;
        final messageModels = argumentList.map((msg) {
          return MessageTimelineModel.fromJson(
            msg as Map<String, dynamic>,
          );
        }).toList();

        // Verileri Hive'a kaydet
        /*   final chatBox = Hive.box<List<MessageTimelineModel>>('chatBox');
                await chatBox.put('chatData', messageModels); */

        // Güncellenmiş verilerle state'i güncelle
        state = state.copyWith(
          chatData:
              messageModels.where((element) => !element.isGroupChat!).toList(),
          groupChatData:
              messageModels.where((element) => element.isGroupChat!).toList(),
          loading: false,
        );
      }
      //} catch (error) {
      // Hata yönetimi
      //  state = state.copyWith(loading: false);
      //  print("errorda " + error.toString());
      //}
    }, (s) {});
  }

  Future<List<MessageTimelineModel>> getChatData() async {
    final chatBox = Hive.box<List<MessageTimelineModel>>('chatBox');
    final rawData = chatBox.get('chatData');

    if (rawData == null) {
      return <MessageTimelineModel>[];
    }

    return rawData.map<MessageTimelineModel>((item) {
      return MessageTimelineModel.fromJson(item as Map<String, dynamic>);
    }).toList();
  }

  Future<bool> createChatRoomWithGroup(String name, List<String> userId) {
    return _repository
        .createChatRoomWithGroup(
      name,
      userId,
    )
        .then((result) {
      result.ifSuccess((data) async {
        log('Pin Chat  successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> pinChat(String roomId) {
    return _repository.pinChat(roomId).then((result) {
      result.ifSuccess((data) async {
        log('Pin Chat  successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> leaveChatRoom(String roomId) {
    return _repository.leaveChatRoom(roomId).then((result) {
      result.ifSuccess((data) async {
        log('Leave Chat  successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> muteOrUnmuteChatRoom(String roomId) {
    return _repository.muteOrUnmuteChatRoom(roomId).then((result) {
      result.ifSuccess((data) async {
        log('Leave Chat  successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> addUserToGroupChat(String chatRoomId, String userId) {
    return _repository.addUserToGroupChat(chatRoomId, userId).then((result) {
      result.ifSuccess((data) async {
        log('Add USer Grup Chat  successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void updateMuted(String roomId) {
    if (_isDisposed) return;
    state = state.copyWith(
      groupChatData: state.groupChatData.map((e) {
        if (e.chatRoomId == roomId) {
          return e.copyWith(isMuted: !e.isMuted!);
        } else {
          return e;
        }
      }).toList(),
    );
  }

  Future<bool> updateGroupChatRoom(String chatRoomId, String name) {
    return _repository.updateGroupChatRoom(chatRoomId, name).then((result) {
      result.ifSuccess((data) async {
        log('Add USer Grup Chat  successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> removeGroupChatRoomUser(String chatRoomId, String userId) {
    return _repository
        .removeGroupChatRoomUser(chatRoomId, userId)
        .then((result) {
      result.ifSuccess((data) async {
        log('Leave Chat  successfully');
        removeUser(chatRoomId, userId);
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void removeUser(String chatRoomId, String userId) {
    if (_isDisposed) return;

    final groupChat = state.groupChatData
        .where(
          (element) => element.chatRoomId == chatRoomId,
        )
        .first;

    final newJoinedUsers =
        groupChat.joinedUsers?.where((user) => user.userId != userId).toList();

    state = state.copyWith(
      groupChatData: state.groupChatData
          .map(
            (chat) => chat.chatRoomId == chatRoomId
                ? chat.copyWith(joinedUsers: newJoinedUsers)
                : chat,
          )
          .toList(),
    );
  }

  void closeAndOpenWebSocket(String? token) {
    state = state.copyWith(connectionStatus: false);
    webSocketService.close();
    log('Chat WebSocket disposed');

    Future.delayed(
      const Duration(seconds: 1),
    );
    connect(token: token);
    log('Chat WebSocket opened');
    state = state.copyWith(connectionStatus: true);
  }

  void closeWebSocket() {
    if (_isDisposed) return;
    webSocketService.close();
    state = state.copyWith(connectionStatus: false);
  }

  @override
  void dispose() {
    _isDisposed = true;
    closeWebSocket();
    super.dispose();
  }
}
