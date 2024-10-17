// ignore_for_file: deprecated_member_use_from_same_package

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/model/index.dart';
import 'package:togodo/ui/chat/widgets/index.dart';
import 'package:togodo/ui/group/view_model/event_group_detail_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

import '../../auth/viewmodel/user_view_model.dart';
import '../../chat/widgets/chat_send/chat_file_container.dart';
import '../../chat/widgets/chat_send/chat_reply_container.dart';

class GroupChatMessages extends StatefulHookConsumerWidget {
  const GroupChatMessages({
    required this.groupId,
    required this.focusNode,
    super.key,
  });
  final String groupId;
  final FocusNode focusNode;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatRoomMessageState();
}

class _ChatRoomMessageState extends ConsumerState<GroupChatMessages>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _controllerListView = ScrollController();
  Map<String, GlobalKey> messageKeys = {};

  @override
  void dispose() {
    _controllerListView.dispose();

    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = ref.watch(eventGroupDetailsProvider(widget.groupId));
    final viewModelNotifier =
        ref.read(eventGroupDetailsProvider(widget.groupId).notifier);
    final userModel = ref.watch(userViewModelProvider).tokenModel?.userId;

    final theme = ref.watch(appThemeProvider);
    final language = ref.watch(languageProvider);
    final router = useRouter();
    final sortedData = [...viewModel.chatData]..sort((a, b) {
        final dateA = a.createdAt!;
        final dateB = b.createdAt!;
        return dateB.compareTo(dateA);
      });

    final uniqueDays = sortedData
        .map((element) => element.createdAt!.formatAsChatTime(language))
        .toSet()
        .toList();
    final l10n = useL10n();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (viewModel.chatData.ext.isNullOrEmpty && !viewModel.loading)
          const SizedBox.shrink()
        else
          SizedBox(
            height: sortedData.length > 3
                ? MediaQuery.of(context).size.height * .25
                : null,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  reverse: true,
                  controller: _controllerListView,
                  shrinkWrap: sortedData.length > 3 ? false : true,
                  physics: sortedData.length > 3
                      ? ClampingScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  itemCount: sortedData.length,
                  itemBuilder: (context, index) {
                    final element = sortedData[index];
                    final replyModel = sortedData.firstWhereOrNull(
                      (e) => e.messageId == element.repliedMessageId,
                    );
                    Widget? groupTitle;
                    Widget? infoTitle;
                    if (uniqueDays.contains(
                          sortedData[index]
                              .createdAt!
                              .formatAsChatTime(language),
                        ) &&
                        (index == sortedData.length - 1
                            ? true
                            : sortedData[index]
                                    .createdAt!
                                    .formatAsChatTime(language) !=
                                sortedData[index + 1]
                                    .createdAt!
                                    .formatAsChatTime(language))) {
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
                      final message = element.systemMessageType ==
                              'GroupCreated'
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
                                    child: chatMessageItem(
                                      element,
                                      replyModel,
                                      userModel,
                                    ),
                                  )
                                else
                                  SwipeTo(
                                    onRightSwipe: (details) {
                                      fncSwipe(element);
                                    },
                                    child: chatMessageItem(
                                      element,
                                      replyModel,
                                      userModel,
                                    ),
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
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: viewModel.sending,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      PrimaryText(
                        l10n.sending,
                      ),
                      JumpingDots(
                        color: MainColors.primary,
                        radius: 5,
                        numberOfDots: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (viewModel.mediaList.isNotEmpty)
              ChatFileContainer(
                eventViewModel: viewModel,
                eventViewModelNotifier: viewModelNotifier,
              ),
            if (viewModel.isReply)
              ChatReplyContainer(
                eventViewModelNotifier: viewModelNotifier,
                eventViewModel: viewModel,
              ),
            if (viewModel.isReply)
              const SizedBox(
                height: 24,
              ),
            FlatMessageInputBoxItem(
              roomId: widget.groupId,
              focusNode: widget.focusNode,
              isSearchRoute: false,
              isNew: true,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        )
      ],
    );
  }

  void fncSwipe(
    MessageInfoModel element,
  ) {
    widget.focusNode.requestFocus();
    return ref
        .read(
          eventGroupDetailsProvider(widget.groupId).notifier,
        )
        .updateState(
          isReply: true,
          replyModel: element,
        );
  }

  FlatChatMessage chatMessageItem(
    MessageInfoModel messages,
    MessageInfoModel? replyModel,
    String? currentUserId,
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
      isGroup: true,
      onSwipe: () {
        widget.focusNode.requestFocus();
        ref
            .read(eventGroupDetailsProvider(widget.groupId).notifier)
            .updateState(isReply: true, replyModel: messages);
      },
      onReaction: (String reaction) {
        ref
            .read(eventGroupDetailsProvider(widget.groupId).notifier)
            .reactionSend(messages.messageId!, reaction);
        Navigator.pop(context);
      },
      onDeleted: () {
        ref
            .read(eventGroupDetailsProvider(widget.groupId).notifier)
            .deleteMessage(messages.messageId!);
        Navigator.pop(context);
      },
      messageContent: messageContent,
      imageUrl: messageContent == MessageContent.image ||
              messageContent == MessageContent.video ||
              messageContent == MessageContent.audio
          ? messages.messageFiles!
          : null,
      messageType: messages.userId == currentUserId
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
