import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/ui/chat/model/post_files.dart';
import 'package:togodo/ui/chat/widgets/chat_view/chat_text.dart';
import 'package:togodo/ui/chat/widgets/flat_chat_message.dart';
import 'package:togodo/ui/chat/widgets/voice_message/voice_controller.dart';
import 'package:togodo/ui/chat/widgets/voice_message/voice_message_view.dart';

class ChatAudioContent extends StatefulHookConsumerWidget {
  const ChatAudioContent({
    required this.isGroup,
    required this.isReading,
    required this.fullName,
    required this.messageType,
    required this.videoThumbnail,
    required this.bgColor,
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
  final Color bgColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatAudioContentState();
}

class _ChatAudioContentState extends ConsumerState<ChatAudioContent> {
  late VoiceController voiceController;
  @override
  void initState() {
    super.initState();
    print("file path ${widget.post!.first.filePath}");
    voiceController = VoiceController(
      audioSrc: widget.post!.first.filePath!,
      maxDuration: const Duration(seconds: 10),
      isFile: false,
      randoms: _setRandoms(),
      onComplete: () {},
      onPause: () {},
      onPlaying: () {},
      onError: (err) {},
    );
  }

  List<double>? _setRandoms() {
    final randoms = <double>[];

    for (var i = 0; i < 38; i++) {
      randoms.add(5.74.w() * Random().nextDouble() + .26.w());
    }
    return randoms;
  }

  @override
  void dispose() {
    voiceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.post.ext.isNullOrEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVoiceMessageView(
                backgroundColor: widget.bgColor,
                activeSliderColor: MainColors.primary,
                circlesColor: MainColors.primary,
                controller: voiceController,
              ),
              if (widget.message != null && widget.message!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ChatTextContent(
                    isGroup: widget.isGroup,
                    isReading: widget.isReading,
                    fullName: widget.fullName,
                    messageType: widget.messageType,
                    showTime: widget.showTime,
                    time: widget.time,
                    textColor: widget.textColor,
                    message: widget.message,
                  ),
                ),
            ],
          );
  }
}

/// Get screen media.
final MediaQueryData media =
    // ignore: deprecated_member_use
    MediaQueryData.fromView(WidgetsBinding.instance.window);

/// This extention help us to make widget responsive.
extension NumberParsing on num {
  double w() => this * media.size.width / 100;

  double h() => this * media.size.height / 100;
}
