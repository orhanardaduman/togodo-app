import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/model/message_timeline_model.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';

class TabSecond extends HookConsumerWidget {
  const TabSecond({
    required this.theme,
    required this.router,
    super.key,
  });

  final AppTheme theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(webSocketProvider).groupChatData;
    final l10n = useL10n();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.5, vertical: 24),
      child: Wrap(
        spacing: context.isSmallScrn ? 12 : 29, // Yatay aralık
        runSpacing: 19, // Dikey aralık
        children: [
          SizedBox(
            width: context.isSmallScrn ? 90 : 95,
            child: GestureDetector(
              onTap: () {
                router.push(const NewGroupRoute());
              },
              child: Column(
                children: [
                  Assets.icons.bold.addGroup.svg(
                    width: context.isSmallScrn ? 90 : 95,
                  ),
                  const SizedBox(height: 5),
                  containerText(l10n.createGroup),
                ],
              ),
            ),
          ),
          ...List<Widget>.generate(
            messages.length,
            (index) {
              final message = messages[index];
              return InkWell(
                onTap: () {
                  router.push(
                    ChatRoute(
                      userId: message.userId!,
                      roomId: message.chatRoomId,
                      name: message.userFullName!,
                      imageUrl: message.userImageUrl!,
                      isOnline: message.isOnline ?? false,
                      isGroup: true,
                    ),
                  );
                },
                child: Column(
                  children: [
                    GroupContainer(joinedUsers: message.joinedUsers),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: context.isSmallScrn ? 90 : 95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (message.isSeenGroupChat ?? false)
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: MainColors.primary,
                              ),
                            ),
                          const SizedBox(width: 3),
                          containerText('${message.chatRoomName}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  PrimaryText containerText(String text) {
    return PrimaryText(
      text,
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyMedium.copyWith(
        color: MainColors.chatColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class GroupContainer extends HookConsumerWidget {
  const GroupContainer({required this.joinedUsers, super.key});
  final List<GroupJoinedUsers>? joinedUsers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.isSmallScrn ? 90 : 95,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: MainColors.dark3,
      ),
      child: Stack(
        children: List.generate(
          (joinedUsers?.length ?? 0) > 3 ? 4 : joinedUsers!.length,
          (index) {
            final user = joinedUsers![index];
            var imageSize = index == 0.0 ? 45.0 : 23.0;
            var topPosition = 12.0;
            var leftPosition = 9.0;

            if (index == 1) {
              topPosition = 38;
              leftPosition = 52;
              imageSize = 35;
            } else if (index == 2) {
              topPosition = 60;
              leftPosition = 20;
              imageSize = 29;
            } else if (index == 3) {
              topPosition = 12;
              leftPosition = 56;
              imageSize = 23;
            }

            return Positioned(
              top: topPosition,
              left: leftPosition,
              child: Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.userImageUrl ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
