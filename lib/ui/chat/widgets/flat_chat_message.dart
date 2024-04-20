import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/chat/model/index.dart';
import 'package:togodo/ui/chat/utils/chat_constants.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_audio.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_direct_message.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_event_request.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_media.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_reply.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_text.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_video.dart';
import 'package:togodo/ui/chat/widgets/popup_menu_widget.dart';

enum MessageType { sent, received }

enum MessageBoxType { reply, normal, rePost }

enum MessageContent {
  image,
  text,
  video,
  audio,
  file,
  location,
  contact,
  eventRequest,
  directMessage
}

late BuildContext bottomSheetContext;

class FlatChatMessage extends StatefulHookConsumerWidget {
  const FlatChatMessage({
    required this.onDeleted,
    required this.messages,
    this.isGroup = false,
    super.key,
    this.messageType,
    this.messageContent,
    this.imageUrl,
    this.backgroundColor,
    this.messageBoxType = MessageBoxType.normal,
    this.onReaction,
    this.replyModel,
    this.textColor,
    this.showTime,
    this.minWidth,
    this.maxWidth,
    this.onSwipe,
  });
  final MessageType? messageType;
  final MessageBoxType messageBoxType;
  final MessageContent? messageContent;
  final List<PostFiles>? imageUrl;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? showTime;
  final double? maxWidth;
  final double? minWidth;
  final void Function()? onSwipe;
  final MessageInfoModel? replyModel;
  final void Function()? onDeleted;
  final void Function(String)? onReaction;
  final bool isGroup;
  final MessageInfoModel messages;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FlatChatMessageState();
}

class _FlatChatMessageState extends ConsumerState<FlatChatMessage>
    with TickerProviderStateMixin {
  Alignment stackMessageAlignment() {
    if (widget.messageType == null ||
        widget.messageType == MessageType.received) {
      return Alignment.centerLeft;
    } else {
      return Alignment.centerRight;
    }
  }

  MainAxisAlignment messageMainAlignment() {
    if (widget.messageType == null ||
        widget.messageType == MessageType.received) {
      return MainAxisAlignment.start;
    } else {
      return MainAxisAlignment.end;
    }
  }

  CrossAxisAlignment messageAlignment() {
    if (widget.messageType == null ||
        widget.messageType == MessageType.received) {
      return CrossAxisAlignment.start;
    } else {
      return CrossAxisAlignment.end;
    }
  }

  double topLeftRadius() {
    if (widget.messageType == null ||
        widget.messageType == MessageType.received) {
      return 0;
    } else {
      return 12;
    }
  }

  double topRightRadius() {
    if (widget.messageType == null ||
        widget.messageType == MessageType.received) {
      return 12;
    } else {
      return 0;
    }
  }

  Color messageBgColor(BuildContext context, AppTheme theme) {
    if (widget.messageType == null ||
        widget.messageType == MessageType.received) {
      return theme.appColors.divider.withOpacity(0.1);
    } else {
      return theme.appColors.themeColor.withOpacity(0.6);
    }
  }

  @override
  void initState() {
    super.initState();
    bottomSheetContext = context;
  }

  Future<void> vibrate() async {
    if (widget.messageType == MessageType.sent) {
      await vibrate();
    }
  }

  // on message tile swipe usually for reply
  void onSwipe() => widget.onSwipe!.call();

  List<PopupMenuEntry<dynamic>> messageTileOptions({
    bool isCurrentUser = false,
  }) {
    return [
      PopupMenuWidget(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _reactWidget(
              Reactions.Heart,
              widget.onReaction,
            ),
            _reactWidget(
              Reactions.Wow,
              widget.onReaction,
            ),
            _reactWidget(
              Reactions.Like,
              widget.onReaction,
            ),
            _reactWidget(
              Reactions.Angry,
              widget.onReaction,
            ),
            _reactWidget(
              Reactions.Sad,
              widget.onReaction,
            ),
          ],
        ),
      ),
      _menuItem('Yanıtla'),
      if (isCurrentUser) _menuItem('Sil'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return Stack(
      alignment: stackMessageAlignment(),
      children: [
        Column(
          crossAxisAlignment: messageAlignment(),
          mainAxisAlignment: messageMainAlignment(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: widget.showTime! ? 8 : 0,
                horizontal: 24,
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                onLongPressStart: (details) {
                  vibrates();
                  showMessageTilePopUpMenu(
                    context,
                    details.globalPosition,
                    messageTileOptions(
                      isCurrentUser: widget.messages.isCurrentUser ?? false,
                    ),
                    theme,
                    ref,
                    widget.onDeleted,
                    onSwipe,
                  );
                },
                child: Stack(
                  alignment: stackMessageAlignment(),
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minWidth: widget.minWidth ??
                            (context.isSmallScrn ? 280.0 : 300.0),
                        maxWidth: widget.messageContent ==
                                    MessageContent.eventRequest &&
                                widget.messages.inviteStatus == null
                            ? context.sized.width
                            : (widget.maxWidth ??
                                (context.isSmallScrn ? 295.0 : 300.0)),
                      ),
                      decoration: MessageContent.audio ==
                                  widget.messageContent ||
                              widget.messageContent ==
                                  MessageContent.eventRequest ||
                              MessageContent.directMessage ==
                                  widget.messageContent
                          ? null
                          : BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight:
                                    widget.messageType == MessageType.received
                                        ? const Radius.circular(20)
                                        : const Radius.circular(8),
                                topLeft:
                                    widget.messageType == MessageType.received
                                        ? const Radius.circular(8)
                                        : const Radius.circular(20),
                                bottomLeft: const Radius.circular(20),
                                bottomRight: const Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.backgroundColor ??
                                      messageBgColor(context, theme),
                                  spreadRadius: 0.5,
                                  blurRadius: 0.5,
                                  offset: const Offset(0, 0.5),
                                ),
                              ],
                            ),
                      padding: MessageContent.image == widget.messageContent ||
                              MessageBoxType.rePost == widget.messageBoxType
                          ? const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            )
                          : MessageContent.audio == widget.messageContent
                              ? EdgeInsets.zero
                              : const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 24,
                                ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (MessageContent.directMessage ==
                              widget.messageContent)
                            ChatDirectMessageContent(
                              data: EventModel(
                                id: widget.messages.eventInfo!.eventId,
                                name: widget.messages.eventInfo!.eventName,
                                date: widget.messages.eventInfo!.eventDate,
                                location:
                                    widget.messages.eventInfo!.eventLocation,
                                description:
                                    widget.messages.eventInfo!.eventContent,
                                imageUrl:
                                    widget.messages.eventInfo!.eventImageUrl,
                                vendorDetails: VendorDetails(
                                  name: widget.messages.eventInfo!.userFullName,
                                  imageUrl:
                                      widget.messages.eventInfo!.userImageUrl,
                                ),
                              ),
                            ),
                          if (MessageBoxType.reply == widget.messageBoxType &&
                              widget.replyModel != null)
                            ChatReplyContent(
                              replyModel: widget.replyModel,
                            ),
                          if (MessageBoxType.reply == widget.messageBoxType)
                            context.sized.emptySizedHeightBoxLow,
                          if (MessageContent.image == widget.messageContent)
                            ChatMediaContent(
                              isGroup: widget.isGroup,
                              isReading: widget.messages.isSeen ?? false,
                              fullName: widget.messages.userFullName ?? '',
                              messageType: widget.messageType!,
                              showTime: widget.showTime,
                              time: widget.messages.createdAt!
                                  .formatCreatedHours(),
                              textColor: widget.textColor,
                              message: widget.messages.message,
                              imageUrl: widget.imageUrl,
                            )
                          else if (MessageContent.video ==
                              widget.messageContent)
                            ChatVideoContent(
                              isGroup: widget.isGroup,
                              isReading: widget.messages.isSeen ?? false,
                              fullName: widget.messages.userFullName ?? '',
                              videoThumbnail:
                                  widget.messages.videoThumbnail ?? '',
                              messageType: widget.messageType!,
                              showTime: widget.showTime,
                              time: widget.messages.createdAt!
                                  .formatCreatedHours(),
                              textColor: widget.textColor,
                              message: widget.messages.message,
                              post: widget.imageUrl,
                            )
                          else if (MessageContent.audio ==
                              widget.messageContent)
                            ChatAudioContent(
                              isGroup: widget.isGroup,
                              isReading: widget.messages.isSeen ?? false,
                              fullName: widget.messages.userFullName ?? '',
                              videoThumbnail:
                                  widget.messages.videoThumbnail ?? '',
                              messageType: widget.messageType!,
                              showTime: widget.showTime,
                              time: widget.messages.createdAt!
                                  .formatCreatedHours(),
                              textColor: widget.textColor,
                              message: widget.messages.message,
                              post: widget.imageUrl,
                              bgColor: messageBgColor(context, theme),
                            )
                          else if (MessageContent.eventRequest ==
                              widget.messageContent)
                            ChatEventRequestContent(
                              fullName: widget.messages.userFullName ?? '',
                              userId: widget.messages.userId ?? '',
                              eventInfo: widget.messages.eventInfo!,
                              inviteId: widget.messages.inviteId ?? '',
                              inviteStatus: widget.messages.inviteStatus,
                              isCurrentUser:
                                  widget.messages.isCurrentUser ?? false,
                            )
                          else
                            ChatTextContent(
                              isGroup: widget.isGroup,
                              isReading: widget.messages.isSeen ?? false,
                              fullName: widget.messages.userFullName ?? '',
                              messageType: widget.messageType!,
                              showTime: widget.showTime,
                              time: widget.messages.createdAt!
                                  .formatCreatedHours(),
                              textColor: widget.textColor,
                              message: widget.messages.message,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.messageContent != MessageContent.eventRequest ||
                widget.messages.inviteStatus != null)
              Row(
                mainAxisAlignment: messageMainAlignment(),
              ),
          ],
        ),
        if (widget.messages.messageReactions != null)
          widget.messageType == MessageType.received
              ? Positioned(
                  bottom: -5,
                  left: 28,
                  child: Wrap(
                    children: widget.messages.messageReactions!
                        .map(
                          (e) => _reactWidget(
                            e.reaction ?? '',
                            widget.onReaction,
                          ),
                        )
                        .toList(),
                  ),
                )
              : Positioned(
                  bottom: -5,
                  right: 28,
                  child: Wrap(
                    children: widget.messages.messageReactions!
                        .map(
                          (e) => _reactWidget(
                            e.reaction ?? '',
                            widget.onReaction,
                          ),
                        )
                        .toList(),
                  ),
                ),
      ],
    );
  }
}

PopupMenuItem<dynamic> _menuItem(String text) {
  return PopupMenuItem(
    padding: const EdgeInsets.only(
      left: 30,
      bottom: 3,
      top: 5,
      right: 10,
    ),
    value: text,
    child: Text(text),
  );
}

Widget _reactWidget(
  String reaction,
  void Function(String)? onPressed,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 3,
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onPressed!(reaction),
      child: Text(
        reaction,
        style: const TextStyle(fontSize: 22),
      ),
    ),
  );
}
