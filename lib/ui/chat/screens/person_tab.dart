// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/component/shimmer/comment_shimmer.dart';
import 'package:togodo/core/extension/capitalize_extension.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/model/message_timeline_model.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';
import 'package:togodo/ui/chat/widgets/index.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class TabFirst extends HookConsumerWidget {
  const TabFirst({
    required this.theme,
    required this.router,
    super.key,
  });

  final AppTheme theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(webSocketProvider);
    final notifier = ref.watch(webSocketProvider.notifier);
    final language = ref.watch(languageProvider);
    final l10n = useL10n();
    return messages.chatData.ext.isNotNullOrEmpty
        ? MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: messages.chatData.length,
              padding: const EdgeInsets.only(bottom: 130),
              itemBuilder: (context, index) {
                final message = messages.chatData[index];
                final onlineColor = (message.isOnline ?? false)
                    ? theme.appColors.themeColor
                    : theme.appColors.secondText;
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.4,
                    children: [
                      CustomSlidableAction(
                        onPressed: (BuildContext context) {
                          notifier.leaveChatRoom(
                            message.chatRoomId!,
                          );
                        },
                        backgroundColor: MainColors.transparentRed,
                        foregroundColor: MainColors.red,
                        child: Assets.icons.bold.delete.svg(
                          color: MainColors.red,
                        ),
                      ),
                      CustomSlidableAction(
                        onPressed: (BuildContext context) {
                          notifier.pinChat(
                            message.chatRoomId!,
                          );
                        },
                        backgroundColor: MainColors.transparentBlue,
                        foregroundColor: MainColors.grey50,
                        child: Assets.icons.bold.pinned.svg(
                          color: MainColors.primary,
                        ),
                      ),
                    ],
                  ),

                  child: _chatItem(
                    message,
                    onlineColor,
                    l10n,
                    language,
                  ), // Kaydırılabilir kartın içeriği burada yer alır,
                );
              },
            ),
          )
        : messages.loading
            ? loadingIndicator(
                isDark: theme.mode == ThemeMode.dark,
              )
            : NoMessages(theme: theme, l10n: l10n);
  }

  FlatChatItem _chatItem(
    MessageTimelineModel message,
    Color onlineColor,
    L10n l10n,
    String language,
  ) {
    return FlatChatItem(
      onPressed: () {
        router.push(
          ChatRoute(
            userId: message.userId!,
            roomId: message.chatRoomId,
            name: message.chatRoomName ??
                message.userFullName!.capitalizeLetter(),
            imageUrl: message.userImageUrl!,
            isOnline: message.isOnline ?? false,
          ),
        );
      },
      name: message.userFullName!.capitalizeLetter(),
      profileImage: FlatProfileImage(
        imageUrl: message.userImageUrl,
        onlineIndicator: false,
        outlineColor: onlineColor,
        onlineColor: onlineColor,
        outlineIndicator: true,
      ),
      message: (message.isDeleted ?? false)
          ? l10n.messageDeleted
          : formatMessageContent(message, l10n),
      isWriting: message.isWriting ?? false,
      multiLineMessage: true,
      counter: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if ((message.unseenMessagesCount ?? 0) > 0)
            FlatCounter(
              text: '${message.unseenMessagesCount}',
            ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 95,
            child: PrimaryText(
              message.lastMessageTime!.formatAsChatTime(language),
              maxLines: 1,
              style: theme.textTheme.bodySmall.copyWith(
                color: MainColors.grey300,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingIndicator({required bool isDark}) {
    return Column(
      children: List.generate(
        5,
        (index) => MessageCustomShimmer(
          isDark: isDark,
        ),
      ),
    );
  }

  String formatMessageContent(MessageTimelineModel message, L10n l10n) {
    switch (message.lastMessageContentType) {
      case '2':
        return message.isCurrentUser! ? l10n.sentPhoto : l10n.receivedPhoto;
      case '3':
        return message.isCurrentUser! ? l10n.sentVideo : l10n.receivedVideo;
      case '4':
        return message.isCurrentUser! ? l10n.sentEvent : l10n.receivedEvent;
      case '5':
        return message.isCurrentUser! ? l10n.sentAudio : l10n.receivedAudio;
      case '6':
        return message.isCurrentUser!
            ? l10n.sentEventInvitation
            : l10n.receivedEventInvitation;
      default:
        return message.lastMessage ?? '';
    }
  }
}
