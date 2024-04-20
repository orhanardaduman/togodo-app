import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

ChewieController useAssetChewieController({
  required String asset,
  String? package,
  String? thumbnail,
  String? resolution,
  bool autoPlay = false,
  bool looping = false,
  bool isMuted = false,
  bool isControl = false,
}) {
  return use(
    _AssetChewieControllerHook(
      asset: asset,
      package: package,
      autoPlay: autoPlay,
      thumbnail: thumbnail,
      isControl: isControl,
      resolution: resolution,
      looping: looping,
      isMuted: isMuted,
      keys: [
        asset,
        package,
        autoPlay,
        isControl,
        thumbnail,
        resolution,
        isMuted,
        looping,
      ],
    ),
  );
}

class _AssetChewieControllerHook extends Hook<ChewieController> {
  const _AssetChewieControllerHook({
    required this.asset,
    required this.autoPlay,
    required this.looping,
    required this.isMuted,
    required this.isControl,
    this.package,
    this.resolution,
    this.thumbnail,
    super.keys,
  });

  final String asset;
  final String? package;
  final String? thumbnail;
  final String? resolution;
  final bool autoPlay;
  final bool looping;
  final bool isMuted;
  final bool isControl;

  @override
  _AssetChewieControllerHookState createState() =>
      _AssetChewieControllerHookState();
}

class _AssetChewieControllerHookState
    extends HookState<ChewieController, _AssetChewieControllerHook> {
  late final VideoPlayerController _videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(hook.asset));
  ChewieController? _chewieController;

  @override
  void initHook() {
    _initControllers();
  }

  Future<void> _initControllers() async {
    try {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        looping: hook.looping,
        showControls: hook.isControl,
      );

      await _videoPlayerController.initialize();
      setState(() {
        if (hook.looping) _videoPlayerController.play();
        if (hook.autoPlay) _videoPlayerController.play();
      });
    } catch (e) {
      // Hata işleme kısmı. Uygulamanızın bağlamına göre uygun bir şekilde hataları işleyebilirsiniz.
      log('Video initialization error: $e');
    }
  }

  @override
  ChewieController build(BuildContext context) {
    return _chewieController!;
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
