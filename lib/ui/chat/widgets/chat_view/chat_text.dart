import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/widgets/flat_chat_message.dart';

class ChatTextContent extends HookConsumerWidget {
  const ChatTextContent({
    required this.isGroup,
    required this.isReading,
    required this.fullName,
    required this.messageType,
    super.key,
    this.showTime,
    this.time,
    this.textColor,
    this.message,
  });
  final String? message;
  final bool isGroup;
  final bool isReading;
  final String fullName;
  final MessageType messageType;
  final bool? showTime;
  final String? time;
  final Color? textColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return message == ''
        ? SizedBox.fromSize()
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 194,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isGroup && messageType == MessageType.received)
                      PrimaryText(
                        fullName,
                        style: theme.textTheme.bodyMedium.copyWith(
                          color: MainColors.primary,
                        ),
                      ),
                    PrimaryText(
                      message ?? '',
                      style: theme.textTheme.bodyXLarge.copyWith(
                        color: textColor ?? messageTextColor(context, theme),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              messageTime(theme),
              if (showTime!) const SizedBox(width: 4),
              if (MessageType.sent == messageType && showTime!)
                Icon(
                  isReading ? Icons.done_all : Icons.check,
                  size: 16,
                  color: MainColors.white,
                ),
            ],
          );
  }

  Text messageTime(AppTheme theme) {
    if (showTime != null && showTime!) {
      return Text(
        time ?? '00:00',
        style: TextStyle(
          fontSize: 10,
          color: theme.appColors.text,
        ),
      );
    } else {
      return const Text('');
    }
  }

  Color messageTextColor(BuildContext context, AppTheme theme) {
    if (messageType == MessageType.received) {
      return theme.mode == ThemeMode.dark ? Colors.white : Colors.black;
    } else {
      return Colors.white;
    }
  }
}
