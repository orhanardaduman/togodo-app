// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';

class MessagePopUpWidget extends HookConsumerWidget {
  const MessagePopUpWidget({
    required this.imgUrl,
    required this.name,
    required this.message,
    required this.chatRoomId,
    required this.userId,
    required this.isGroup,
    required this.type,
    super.key,
  });
  final String name;
  final String imgUrl;
  final String message;
  final String chatRoomId;
  final String userId;
  final String isGroup;
  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Dismissible(
            key: const Key('popup'),
            direction: DismissDirection.up, // Yukarı kaydırma yönü
            onDismissed: (direction) {
              // Pop-up'ı kaydırdıktan sonra ne yapılacağını belirtiyoruz.
              Navigator.of(context).pop();
            },
            child: GestureDetector(
              onTap: () async {
                await router.push(
                  ChatRoute(
                    userId: userId,
                    roomId: chatRoomId,
                    name: name,
                    imageUrl: imgUrl,
                    isOnline: false,
                    isGroup: isGroup == 'true',
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Container(
                height: 84,
                width: 400,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                decoration: BoxDecoration(
                  color: themeMode ? MainColors.dark2 : MainColors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    CustomAvatarImage(
                      imageUrl: imgUrl,
                      size: 48,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.bodyMedium
                                .copyWith(color: theme.appColors.text),
                            children: <TextSpan>[
                              TextSpan(
                                text: name,
                                style: theme.textTheme.bodyXLarge.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ' bir ileti gönderdi',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        PrimaryText(
                          formatMessageContent(message, l10n, type),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String formatMessageContent(String message, L10n l10n, String type) {
    switch (type) {
      case 'ImageMessage':
        return l10n.receivedPhoto;
      case 'VideoMessage':
        return l10n.receivedVideo;
      case 'EventShareMessage':
        return l10n.receivedEvent;
      case 'AudioMessage':
        return l10n.receivedAudio;
      case 'EventRequestMessage':
        return l10n.receivedEventInvitation;
      default:
        return message;
    }
  }
}
