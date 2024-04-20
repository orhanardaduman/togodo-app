import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/services/post_service.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';
import 'package:togodo/ui/chat/widgets/video_editor/export_service.dart';
import 'package:video_editor/video_editor.dart';

class VideoEditor extends StatefulHookConsumerWidget {
  const VideoEditor({
    required this.file,
    required this.roomId,
    required this.isSearchRoute,
    super.key,
  });

  final File file;
  final String roomId;
  final bool isSearchRoute;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoEditorState();
}

class _VideoEditorState extends ConsumerState<VideoEditor> {
  final _exportingProgress = ValueNotifier<double>(0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;
  PostService postService = PostService();
  late final VideoEditorController _controller = VideoEditorController.file(
    widget.file,
    minDuration: const Duration(seconds: 1),
    maxDuration: const Duration(seconds: 10),
  );

  @override
  void initState() {
    super.initState();
    _controller
        .initialize(aspectRatio: 9 / 16)
        .then((_) => setState(() {}))
        .catchError(
      (error) {
        // handle minumum duration bigger than video duration error
        Navigator.pop(context);
      },
      test: (e) => e is VideoMinDurationError,
    );
  }

  @override
  void dispose() {
    _exportingProgress.dispose();
    _isExporting.dispose();
    disposeAsyncResources();
    super.dispose();
  }

  Future<void> disposeAsyncResources() async {
    await _controller.dispose();
    await ExportService.dispose();
  }

  void _showErrorSnackBar(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 1),
        ),
      );

  Future<void> _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;

    final config = VideoFFmpegVideoEditorConfig(
      _controller,
      // format: VideoExportFormat.gif,
      /*  commandBuilder: (config, videoPath, outputPath) {
        final filters = config.getExportFilters();
        /*   filters.add('hflip'); // add horizontal flip */

        return '-i $videoPath ${config.filtersCmd(filters)} -preset ultrafast $outputPath';
      }, */
    );

    await ExportService.runFFmpegCommand(
      await config.getExecuteConfig(),
      onProgress: (stats) {
        _exportingProgress.value =
            config.getFFmpegProgress(int.parse(stats.getTime().toString()));
      },
      onError: (e, s) => _showErrorSnackBar('Error on export video :('),
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;
        ref.read(messageDetailsProvider(widget.roomId).notifier)
          ..addMediaList([file])
          ..sendMessage(
            isSearchRoute: widget.isSearchRoute,
          ).then((value) => Navigator.pop(context));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      backgroundColor: theme.appColors.background,
      appBar: const CustomAppBar(),
      body: _controller.initialized
          ? SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CropGridViewer.preview(
                                          controller: _controller,
                                        ),
                                        AnimatedBuilder(
                                          animation: _controller.video,
                                          builder: (_, __) => AnimatedOpacity(
                                            opacity:
                                                _controller.isPlaying ? 0 : 1,
                                            duration: kThemeAnimationDuration,
                                            child: GestureDetector(
                                              onTap: _controller.video.play,
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CoverViewer(controller: _controller),
                                  ],
                                ),
                              ),
                              if (_controller.videoDuration.inSeconds > 10)
                                Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: _trimSlider(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration().buttonShadow,
                        child: CustomButton(
                          text: 'Gönder',
                          radius: 60,
                          bgColor: MainColors.primary,
                          onPressed: _exportVideo,
                          textWidget: ValueListenableBuilder(
                            valueListenable: _isExporting,
                            builder: (_, bool export, Widget? child) =>
                                AnimatedSize(
                              duration: kThemeAnimationDuration,
                              child: export
                                  ? child
                                  : PrimaryText(
                                      'Gönder',
                                      style:
                                          theme.textTheme.bodyMedium.copyWith(
                                        color: MainColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: _exportingProgress,
                              builder: (_, double value, __) => PrimaryText(
                                '${(value * 100).ceil()}%',
                                style: theme.textTheme.bodyMedium.copyWith(
                                  color: MainColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
      ].join(':');

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _controller.video,
        ]),
        builder: (_, __) {
          final duration = _controller.videoDuration.inSeconds;
          final pos = _controller.trimPosition * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(
              children: [
                Text(formatter(Duration(seconds: pos.toInt()))),
                const Expanded(child: SizedBox()),
                AnimatedOpacity(
                  opacity: _controller.isTrimming ? 1 : 0,
                  duration: kThemeAnimationDuration,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(formatter(_controller.startTrim)),
                      const SizedBox(width: 10),
                      Text(formatter(_controller.endTrim)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: height / 4),
        child: TrimSlider(
          controller: _controller,
          height: height,
          horizontalMargin: height / 4,
          child: TrimTimeline(
            controller: _controller,
            padding: const EdgeInsets.only(top: 10),
          ),
        ),
      ),
    ];
  }
}
