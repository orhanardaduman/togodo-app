import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/ui/chat/model/post_files.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_text.dart';
import 'package:togodo/ui/chat/widgets/flat_chat_message.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/custom_gallery_image.dart';

class ChatMediaContent extends HookConsumerWidget {
  const ChatMediaContent({
    required this.isGroup,
    required this.isReading,
    required this.fullName,
    required this.messageType,
    super.key,
    this.showTime,
    this.time,
    this.textColor,
    this.message,
    this.imageUrl,
  });
  final List<PostFiles>? imageUrl;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomGalleryImage(
          key: UniqueKey(),
          imageUrls: imageUrl!.map((e) => e.filePath!).toList(),
          numOfShowImages: imageUrl!.length,
          titleGallery: 'Resimler',
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
