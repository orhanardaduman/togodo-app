// ignore_for_file: use_build_context_synchronously

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
import 'package:togodo/ui/chat/model/index.dart';
import 'package:togodo/ui/chat/services/connect_services.dart';
import 'package:togodo/ui/chat/services/post_service.dart';
import 'package:togodo/ui/chat/widgets/video_editor/video_editor.dart';

import '../../../data/repository/home_repository.dart';
import '../../../data/repository/home_repository_impl.dart';
import '../../auth/viewmodel/user_view_model.dart';

part 'event_group_detail_view_model.freezed.dart';

final eventGroupDetailsProvider = StateNotifierProvider.family<
    EventGroupDetailNotifier, EventGroupDetailState, String>(
  EventGroupDetailNotifier.new,
);

@freezed
class EventGroupDetailState with _$EventGroupDetailState {
  const factory EventGroupDetailState({
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
  }) = _EventGroupDetailState;
}

// 1 - Text Message / 2 - Image Message / 3 - File Message
class EventGroupDetailNotifier extends StateNotifier<EventGroupDetailState> {
  EventGroupDetailNotifier(this._ref, this.roomId)
      : super(const EventGroupDetailState());
  final Ref _ref;
  final picker = ImagePicker();
  PostService postService = PostService();
  final String roomId;
  bool _isDisposed = false;
  TextEditingController textEditingController = TextEditingController();
  WebSocketService webSocketService = WebSocketService.instance;
  late final HomeRepository _homeRepository = _ref.read(homeRepositoryProvider);
  final ScrollController _controllerListView = ScrollController();

  Future<void> connect() async {
    if (_isDisposed) return;
    state = state.copyWith(loading: true);
    final userModelView = _ref.read(userViewModelProvider);
    await webSocketService.connect(userModelView.accessToken!);
    //await webSocketService.sink(false, roomId, userModelView.accessToken!);
    fetchOldMessages();
    socketListen();
  }

  void socketListen() {
    webSocketService.onData(
      (event, rawMessage) {
        print('Detay2 de denem ${event.toString()}');

        if (event == 'eventGroupChat-$roomId') {
          // ignore: avoid_dynamic_calls

          final message = rawMessage;
          if (rawMessage.toString().contains("type")) {
            final Map<String, dynamic> data = rawMessage;
            if (data["type"] == 'reaction') {
              final model =
                  state.chatData.firstWhere((e) => e.id == data["id"]);
              var index = state.chatData.indexOf(model);
              var jsonModel = model.toJson();
              jsonModel["messageReactions"] = data["reaction"];
              var newList = [...state.chatData];
              newList[index] = MessageInfoModel.fromJson(jsonModel);
              state = state.copyWith(
                chatData: newList,
              );
            } else if (data["type"] == 'delete') {
              final model =
                  state.chatData.firstWhere((e) => e.id == data["id"]);
              var index = state.chatData.indexOf(model);
              var newList = [...state.chatData];
              newList.removeAt(index);
              state = state.copyWith(
                chatData: newList,
              );
            }
          } else {
            final List<dynamic> argumentList = message;
            final messageModels = argumentList.map((msg) {
              return MessageInfoModel.fromJson(
                msg as Map<String,
                    dynamic>, // Use msg instead of message['arguments']
              );
            }).toList();

            print('Detay çalışıyor $messageModels');

            state = state.copyWith(
              chatData: [...state.chatData, ...messageModels],
              loading: false,
              isWriting: false,
            );

            state = state.copyWith(loading: false);
          }
        }
      },
      (dynamic error) {
        state = state.copyWith(loading: false);
        // handle the error
        log(error.toString());
      },
    );
  }

  void fetchOldMessages() async {
    final messages = await _homeRepository.getGroupMessages(roomId);
    if (messages.isSuccess) {
      state = state.copyWith(
        chatData: [
          ...messages.dataOrThrow,
        ],
      );
      _controllerListView.jumpTo(_controllerListView.position.maxScrollExtent);
    }
  }

  void updateGroupChat({bool isGroupChat = false}) {
    state = state.copyWith(isGrupChat: isGroupChat);
  }

  void updateVoidRecod() {
    state = state.copyWith(isVoiceRecord: !state.isVoiceRecord);
  }

  Future<void> sendMessage() async {
    if (_isDisposed) return;

    if (state.mediaList.ext.isNotNullOrEmpty ||
        textEditingController.text != '') {
      try {
        state = state.copyWith(isSubmit: true);
        final text = textEditingController.text;
        final chatRoomId = roomId;
        final file = state.mediaList;
        final replyMessageId =
            state.isReply ? state.replyModel!.messageId : null;
        final isReplied = state.isReply;
        final isGroup = state.isGrupChat;
        resetFile();
        state = state.copyWith(isSubmit: false);
        await postService.sendMessageNew(
          text,
          _ref.read(dioProvider),
          chatRoomId: chatRoomId,
          file: file,
          replyMessageId: replyMessageId,
          isReplied: isReplied,
          isGroup: isGroup,
        );
      } catch (e) {
        resetFile();
      }
    }
  }

  void resetFile() {
    textEditingController.clear();

    state = state.copyWith(
      mediaList: [],
      isReply: false,
      isSubmit: false,
      replyModel: null,
      loading: false,
    );
  }

  void updateState({bool isReply = false, MessageInfoModel? replyModel}) {
    state = state.copyWith(isReply: isReply, replyModel: replyModel);
  }

  Future<bool> reactionSend(String id, String reaction) {
    return _homeRepository.sendMessageReaction(id, reaction).then((result) {
      result.ifSuccess((data) async {
        log('Reaction send successfully');
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> deleteMessage(String id) {
    return _homeRepository.deleteMessage(id).then((result) {
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
        print(fileType);
        if (fileType == '2') {
          // Görüntü işleme
          final croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
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
          if (croppedFile != null) {
            state = state.copyWith(
              mediaList: List.from(state.mediaList)
                ..add(File(croppedFile!.path)),
            );
          }
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
    //TODO webSocketService.close2();

    state = state.copyWith(connectionStatus: false, loading: true);
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
