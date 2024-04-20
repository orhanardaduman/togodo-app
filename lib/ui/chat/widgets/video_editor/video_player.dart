// ignore_for_file: deprecated_member_use_from_same_package

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/image/custom_cached_image.dart';
import 'package:togodo/core/hook/use_asset_video_player_controller.dart';
import 'package:togodo/gen/assets.gen.dart';

class CustomVideoThumbnail extends StatefulHookConsumerWidget {
  const CustomVideoThumbnail({
    required this.videoPath,
    required this.videoThumbnail,
    super.key,
  });
  final String videoPath;
  final String videoThumbnail;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomVideoThumbnailState();
}

class _CustomVideoThumbnailState extends ConsumerState<CustomVideoThumbnail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.videoThumbnail != ''
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<MyVideoPlayer>(
                    builder: (context) => MyVideoPlayer(
                      videoPath: widget.videoPath,
                    ),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                    ),
                    child: CustomCachedImage(
                      imageUrl: widget.videoThumbnail,
                    ),
                  ),
                  Assets.icons.bulk.play.svg(
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 300,
                  ),
                ),
                const CircularProgressIndicator(),
              ],
            ),
    );
  }
}

class MyVideoPlayer extends HookConsumerWidget {
  const MyVideoPlayer({
    required this.videoPath,
    super.key,
  });
  final String videoPath;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chewieController = useAssetChewieController(
      asset: videoPath,
      isControl: true,
      autoPlay: true,
    );
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: chewieController.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  // Videonun oynatılmasını başlat veya duraklat

                  if (!chewieController.videoPlayerController.value.isPlaying) {
                    chewieController.videoPlayerController.play();
                  } else {
                    chewieController.videoPlayerController.pause();
                  }
                },
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
