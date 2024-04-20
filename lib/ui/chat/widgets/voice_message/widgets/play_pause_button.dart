import 'package:flutter/material.dart';
import 'package:togodo/ui/chat/widgets/voice_message/voice_controller.dart';
import 'package:togodo/ui/chat/widgets/voice_message/widgets/loading_widget.dart';

/// A widget representing a play/pause button.
///
/// This button can be used to control the playback of a media player.
class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    required this.controller,
    required this.color,
    required this.size,
    super.key,
  });

  /// The size of the button.
  final double size;

  /// The controller for the voice message view.
  final VoiceController controller;

  /// The color of the button.
  final Color color;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: controller.isDownloadError

            /// faild loading audio
            ? controller.play
            : controller.isPlaying

                /// playing or pause
                ? controller.pausePlaying
                : controller.play,
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: controller.isDownloading
              ? LoadingWidget(
                  progress: controller.downloadProgress,
                  onClose: () {
                    controller.cancelDownload();
                  },
                )
              : Icon(
                  /// faild to load audio
                  controller.isDownloadError

                      /// show refresh icon
                      ? Icons.refresh

                      /// playing or pause
                      : controller.isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,

                  /// icon color
                  color: Colors.white,
                ),
        ),
      );
}
