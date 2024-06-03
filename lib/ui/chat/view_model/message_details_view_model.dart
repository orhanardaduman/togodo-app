// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/chat/model/index.dart';
import 'package:togodo/ui/chat/repo/repository/chat_event_repository.dart';
import 'package:togodo/ui/chat/repo/repository/chat_event_repository_impl.dart';
import 'package:togodo/ui/chat/services/connect_services.dart';
import 'package:togodo/ui/chat/services/post_service.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';
import 'package:togodo/ui/chat/widgets/video_editor/video_editor.dart';

part 'message_details_view_model.freezed.dart';

final messageDetailsProvider = StateNotifierProvider.family<
    MessageDetailsNotifier, MessageDetailsState, String>(
  MessageDetailsNotifier.new,
);

@freezed
class MessageDetailsState with _$MessageDetailsState {
  const factory MessageDetailsState({
    @Default([]) List<MessageInfoModel> chatData,
    @Default([]) List<File> mediaList,
    @Default(null) MessageInfoModel? replyModel,
    @Default(false) bool loading,
    @Default(false) bool isSubmit,
    @Default(false) bool isReply,
    @Default(false) bool isWriting,
    @Default(false) bool isVoiceRecord,
    @Default(false) bool connectionStatus,
    @Default(false) bool isGrupChat,
    @Default(0) int messageType,
  }) = _MessageDetailsState;
}

// 1 - Text Message / 2 - Image Message / 3 - File Message
class MessageDetailsNotifier extends StateNotifier<MessageDetailsState> {
  MessageDetailsNotifier(this._ref, this.roomId)
      : super(const MessageDetailsState());
  final Ref _ref;
  final picker = ImagePicker();
  PostService postService = PostService();
  final String roomId;
  bool _isDisposed = false;
  TextEditingController textEditingController = TextEditingController();
  late final ChatRepository _repository = _ref.read(chatRepositoryProvider);
  WebSocketService webSocketService = WebSocketService.instance;
  Future<void> connect({bool isSearchRoute = false}) async {
    print("detal connectde ${isSearchRoute}");

    if (_isDisposed) return;
    state = state.copyWith(loading: true);
    final userModelView = _ref.read(userViewModelProvider);
    await webSocketService.connect(userModelView.accessToken!);
    print("burda sinklemesi lazim room Id ${roomId}");
    await webSocketService.sink(isSearchRoute, roomId);

    socketListen();
  }

  Future<void> discoonect() async {
    await webSocketService.sinkDissconnect("dad");
  }

  void socketListen() {
    webSocketService.onData(
      (event, rawMessage) {
        if (event == "GetChatRoomMessage") {
          // ignore: avoid_dynamic_calls

          final message = rawMessage;
          log('Detay çalışıyor');
          state = state.copyWith(
            connectionStatus: true,
            messageType: 1,
          );
          final List<dynamic> argumentList = message;
          final messageModels = argumentList.map((msg) {
            return MessageInfoModel.fromJson(
              msg as Map<String,
                  dynamic>, // Use msg instead of message['arguments']
            );
          }).toList();

          state = state.copyWith(
            chatData: messageModels,
            loading: false,
            isWriting: messageModels.last.isWriting ?? false,
          );

          state = state.copyWith(loading: false);
        }
      },
      (dynamic error) {
        state = state.copyWith(loading: false);
        // handle the error
        log(error.toString());
      },
    );
  }

  Future<bool> closeChatRoom() {
    return _repository.closeChatRoom().then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void updateGroupChat({bool isGroupChat = false}) {
    state = state.copyWith(isGrupChat: isGroupChat);
  }

  void updateVoidRecod() {
    state = state.copyWith(isVoiceRecord: !state.isVoiceRecord);
  }

  Future<void> sendMessage({
    bool isSearchRoute = false,
  }) async {
    if (_isDisposed) return;

    if (state.mediaList.ext.isNotNullOrEmpty ||
        textEditingController.text != '') {
      try {
        state = state.copyWith(isSubmit: true);

        final response = await postService.sendMessage(
          textEditingController.text,
          _ref.read(dioProvider),
          chatRoomId: isSearchRoute ? null : roomId,
          receiverUserId: isSearchRoute ? roomId : null,
          file: state.mediaList,
          replyMessageId: state.isReply ? state.replyModel!.messageId : null,
          isReplied: state.isReply,
          isGroup: state.isGrupChat,
        );
        if (response) {
          resetFile();
          state = state.copyWith(isSubmit: false);
        }
      } catch (e) {
        resetFile();
      }
    }
  }

  void resetFile() {
    state = state.copyWith(
      mediaList: [],
      isReply: false,
      isSubmit: false,
      replyModel: null,
      loading: false,
    );
    textEditingController.clear();
  }

  void updateState({bool isReply = false, MessageInfoModel? replyModel}) {
    state = state.copyWith(isReply: isReply, replyModel: replyModel);
  }

  Future<bool> writingNow(
    String id, {
    bool isWriting = false,
  }) {
    return _repository
        .writingTo(
      id,
      isWriting: isWriting,
    )
        .then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> reactionSend(String id, String reaction) {
    return _repository.sendMessageReaction(id, reaction).then((result) {
      result.ifSuccess((data) async {
        log('Reaction send successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> deleteMessage(String id) {
    return _repository.deleteMessage(id).then((result) {
      result.ifSuccess((data) async {
        log('Message Remove successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<void> pickImage({
    required ImageSource source,
    BuildContext? context,
    String? roomId,
    bool isSearchRoute = false,
  }) async {
    state = state.copyWith(loading: true);
    try {
      if (state.mediaList.length >= 3) {
        state = state.copyWith(loading: false);
        showInSnackBar('En fazla 3 fotoğraf seçebilirsiniz!', context!);
        return;
      }

      final pickedFile = source == ImageSource.camera
          ? await picker.pickImage(source: source)
          : await picker.pickMedia();
      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        // Dosya türünü kontrol et
        final fileType = getFileType(pickedFile.path);
        if (fileType == '2') {
          // Görüntü işleme
          final croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Kırp',
                toolbarColor: MainColors.primary,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
              IOSUiSettings(),
            ],
          );
          state = state.copyWith(
            mediaList: List.from(state.mediaList)..add(File(croppedFile!.path)),
          );
        } else if (fileType == '3') {
          // Video dosyası seçildiyse, doğrudan bu dosyayı kullan
          await Navigator.of(context!).push(
            MaterialPageRoute<VideoEditor>(
              builder: (context) => VideoEditor(
                file: File(pickedFile.path),
                roomId: roomId!,
                isSearchRoute: isSearchRoute,
              ),
            ),
          );
        } else {
          //Desteklenmeyen bir dosya türü
          showInSnackBar('Yalnızca görüntü dosyaları desteklenir!', context!);
        }
      }
    } catch (e) {
      state = state.copyWith(loading: false);
      showInSnackBar('Bir hata oluştu: $e', context!);
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  void addMediaList(List<File> files) {
    state = state.copyWith(
      mediaList: List.from(state.mediaList)..addAll(files),
    );
  }

  void removeMedia(int index) {
    state =
        state.copyWith(mediaList: List.from(state.mediaList)..removeAt(index));
  }

  void closeAndOpenWebSocket() {
    webSocketService.close();
    log('Chat Details WebSocket disposed');
    Future.delayed(const Duration(seconds: 1), connect);
    log('Chat Details WebSocket opened');
  }

  void closeChatWebSocket() {
    closeChatRoom();
    webSocketService.close();

    _ref.read(webSocketProvider.notifier).connect();
    log('Chat Details WebSocket disposed');
    state = state.copyWith(connectionStatus: false);
  }

  @override
  void dispose() {
    _isDisposed = true;
    closeChatWebSocket();

    super.dispose();
  }

  void showInSnackBar(String value, BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}

String getFileType(String filePath) {
  final extension = filePath.split('.').last.toLowerCase();

  // Resim uzantılarını kontrol et
  final imageExtensions = <String>['jpg', 'jpeg', 'png', 'gif', 'bmp', 'tiff'];
  if (imageExtensions.contains(extension)) {
    return '2';
  }

  // Video uzantılarını kontrol et
  final videoExtensions = <String>['mp4', 'mov', 'wmv', 'avi', 'flv', 'mkv'];
  if (videoExtensions.contains(extension)) {
    return '3';
  }

  // Ses uzantılarını kontrol et
  final audioExtensions = <String>[
    'mp3',
    'wav',
    'aac',
    'm4a',
    'flac',
    'ogg',
    'wma',
  ];
  if (audioExtensions.contains(extension)) {
    return '5';
  }

  // Bilinmeyen dosya türü
  return 'unknown';
}
