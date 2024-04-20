import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/ui/chat/model/post_files.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_text.dart';
import 'package:togodo/ui/chat/widgets/flat_chat_message.dart';
import 'package:togodo/ui/chat/widgets/video_editor/video_player.dart';

class ChatVideoContent extends HookConsumerWidget {
  const ChatVideoContent({
    required this.isGroup,
    required this.isReading,
    required this.fullName,
    required this.messageType,
    required this.videoThumbnail,
    super.key,
    this.showTime,
    this.time,
    this.textColor,
    this.message,
    this.post,
  });
  final List<PostFiles>? post;
  final String? message;
  final bool isGroup;
  final bool isReading;
  final String fullName;
  final MessageType messageType;
  final bool? showTime;
  final String? time;
  final String videoThumbnail;
  final Color? textColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return post.ext.isNullOrEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVideoThumbnail(
                videoPath: post!.first.filePath!,
                videoThumbnail: videoThumbnail,
              ),
              if (message != null && message!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ChatTextContent(
                    isGroup: isGroup,
                    isReading: isReading,
                    fullName: fullName,
                    messageType: messageType,
                    showTime: showTime,
                    time: time,
                    textColor: textColor,
                    message: message,
                  ),
                ),
            ],
          );
  }
}
