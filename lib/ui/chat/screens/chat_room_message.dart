// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/model/index.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';
import 'package:togodo/ui/chat/widgets/chat_send/chat_file_container.dart';
import 'package:togodo/ui/chat/widgets/chat_send/chat_reply_container.dart';
import 'package:togodo/ui/chat/widgets/index.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class ChatRoomMessage extends StatefulHookConsumerWidget {
  const ChatRoomMessage({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    required this.isGroup,
    required this.isSearchRoute,
    required this.roomId,
    this.isNotificationRoute = false,
    super.key,
  });
  final String userId;
  final String name;
  final String imageUrl;
  final bool isOnline;
  final bool isNotificationRoute;
  final bool isGroup;
  final bool isSearchRoute;
  final String roomId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatRoomMessageState();
}

class _ChatRoomMessageState extends ConsumerState<ChatRoomMessage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _controller = ScrollController();
  final ScrollController _controllerListView = ScrollController();
  FocusNode focusNode = FocusNode();
  Map<String, GlobalKey> messageKeys = {};
  @override
  void dispose() {
    _controller.dispose();
    _controllerListView.dispose();

    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = ref.watch(messageDetailsProvider(widget.roomId));
    final viewModelNotifier =
        ref.read(messageDetailsProvider(widget.roomId).notifier);
    final theme = ref.watch(appThemeProvider);
    final language = ref.watch(languageProvider);
    final router = useRouter();
    final onlineColor = widget.isOnline
        ? theme.appColors.themeColor
        : theme.appColors.secondText;

    final sortedData = [...viewModel.chatData]..sort((a, b) {
        final dateA = a.createdAt!;
        final dateB = b.createdAt!;
        return dateA.compareTo(dateB);
      });

    final uniqueDays = sortedData
        .map((element) => element.createdAt!.formatAsChatTime(language))
        .toSet()
        .toList();
    final l10n = useL10n();
    return FlatPageWrapper(
      onRefresh: viewModelNotifier.closeAndOpenWebSocket,
      backgroundColor: theme.appColors.background,
      controller: _controller,
      scrollType: ScrollType.floatingHeader,
      reverseBodyList: true,
      header: FlatPageHeader(
        backgroundColor: theme.appColors.background,
        isWriting: viewModel.isWriting,
        prefixWidget: InkWell(
          onTap: () {
            viewModelNotifier.closeChatWebSocket();
            if (!widget.isNotificationRoute) {
              router.pop();
            } else {
              router.push(
                ChatHomeRoute(isNotificationRoute: widget.isNotificationRoute),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20), // Sol boşluk
            child: Assets.icons.lightOutline.arrowLeft.svg(
              width: 28,
              height: 28,
              color: theme.appColors.text,
            ),
          ),
        ),
        title: widget.isGroup ? l10n.group : widget.name,
        suffixWidget: widget.isGroup
            ? InkWell(
                onTap: () {
                  router.push(
                    GroupDetailsRoute(
                      roomId: widget.roomId,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20), // Sol boşluk
                  child: Assets.icons.light.moreCircle.svg(
                    width: 28,
                    height: 28,
                    color: theme.appColors.text,
                  ),
                ),
              )
            : FlatProfileImage(
                size: 35,
                onlineIndicator: true,
                outlineIndicator: false,
                outlineColor: onlineColor,
                onlineColor: onlineColor,
                imageUrl: widget.imageUrl,
                onPressed: () {
                  router.push(
                    UserProfileRoute(
                      userId: widget.userId,
                    ),
                  );
                },
              ),
      ),
      footer: Column(
        children: [
          if (viewModel.mediaList.isNotEmpty)
            ChatFileContainer(
              viewModelNotifier: viewModelNotifier,
              viewModel: viewModel,
            ),
          if (viewModel.isReply)
            ChatReplyContainer(
              viewModelNotifier: viewModelNotifier,
              viewModel: viewModel,
            ),
          if (viewModel.isReply)
            const SizedBox(
              height: 24,
            ),
          FlatMessageInputBoxItem(
            roomId: widget.roomId,
            focusNode: focusNode,
            isSearchRoute: widget.isSearchRoute,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      children: [
        if (viewModel.chatData.ext.isNullOrEmpty && !viewModel.loading)
          const SizedBox.shrink()
        else
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                shrinkWrap: true,
                controller: _controllerListView,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sortedData.length,
                itemBuilder: (context, index) {
                  final element = sortedData[index];
                  final replyModel = sortedData.firstWhereOrNull(
                    (e) => e.messageId == element.repliedMessageId,
                  );
                  Widget? groupTitle;
                  Widget? infoTitle;
                  if (uniqueDays.contains(
                    element.createdAt!.formatAsChatTime(language),
                  )) {
                    uniqueDays
                        .remove(element.createdAt!.formatAsChatTime(language));
                    groupTitle = Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.appColors.text.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: PrimaryText(
                              element.createdAt!.formatAsChatTime(language),
                              style: theme.textTheme.bodyXSmall.copyWith(
                                color: theme.appColors.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (element.isSystemMessage ?? false) {
                    final message = element.systemMessageType == 'GroupCreated'
                        ? '${element.userFullName} ${l10n.groupCreated}'
                        : element.systemMessageType == 'GroupAddUser'
                            ? '${element.userFullName} ${l10n.groupUserAdded}'
                            : element.systemMessageType == 'GroupRemoveUser'
                                ? '${element.userFullName} ${l10n.groupUserRemoved}'
                                : '${element.userFullName} ${l10n.groupUserLeft}';

                    infoTitle = Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.appColors.text.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: PrimaryText(
                              message,
                              style: theme.textTheme.bodyXSmall.copyWith(
                                color: theme.appColors.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Column(
                    key: GlobalObjectKey(element.messageId!),
                    children: [
                      if (groupTitle != null) groupTitle,
                      if (infoTitle != null) infoTitle,
                      if (infoTitle == null)
                        InkWell(
                          onTap: () {
                            if (replyModel != null) {
                              Scrollable.ensureVisible(
                                GlobalObjectKey(replyModel.messageId!)
                                    .currentContext!,
                                duration: const Duration(
                                  seconds: 1,
                                ), // duration for scrolling time
                                alignment:
                                    .5, // 0 mean, scroll to the top, 0.5 mean, half
                                curve: Curves.easeInOutCubic,
                              );
                            }
                          },
                          child: Column(
                            children: [
                              if (element.isCurrentUser ?? false)
                                SwipeTo(
                                  onLeftSwipe: (details) {
                                    fncSwipe(element);
                                  },
                                  child: chatMessageItem(element, replyModel),
                                )
                              else
                                SwipeTo(
                                  onRightSwipe: (details) {
                                    fncSwipe(element);
                                  },
                                  child: chatMessageItem(element, replyModel),
                                ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  void fncSwipe(
    MessageInfoModel element,
  ) {
    focusNode.requestFocus();
    return ref
        .read(
          messageDetailsProvider(widget.roomId).notifier,
        )
        .updateState(
          isReply: true,
          replyModel: element,
        );
  }

  FlatChatMessage chatMessageItem(
    MessageInfoModel messages,
    MessageInfoModel? replyModel,
  ) {
    final messageContent = messages.messageContentType == '1'
        ? MessageContent.text
        : messages.messageContentType == '2'
            ? MessageContent.image
            : messages.messageContentType == '3'
                ? MessageContent.video
                : messages.messageContentType == '6'
                    ? MessageContent.eventRequest
                    : messages.messageContentType == '5'
                        ? MessageContent.audio
                        : MessageContent.directMessage;
    return FlatChatMessage(
      messages: messages,
      isGroup: widget.isGroup,
      onSwipe: () {
        focusNode.requestFocus();
        ref
            .read(messageDetailsProvider(widget.roomId).notifier)
            .updateState(isReply: true, replyModel: messages);
      },
      onReaction: (String reaction) {
        ref
            .read(messageDetailsProvider(widget.roomId).notifier)
            .reactionSend(messages.messageId!, reaction);
        Navigator.pop(context);
      },
      onDeleted: () {
        ref
            .read(messageDetailsProvider(widget.roomId).notifier)
            .deleteMessage(messages.messageId!);
        Navigator.pop(context);
      },
      messageContent: messageContent,
      imageUrl: messageContent == MessageContent.image ||
              messageContent == MessageContent.video ||
              messageContent == MessageContent.audio
          ? messages.messageFiles!
          : null,
      messageType: messages.isCurrentUser ?? false
          ? MessageType.sent
          : MessageType.received,
      replyModel: replyModel,
      messageBoxType: (messages.isReplied ?? false)
          ? MessageBoxType.reply
          : messages.eventInfo != null
              ? MessageBoxType.rePost
              : MessageBoxType.normal,
      showTime: true,
    );
  }
}
