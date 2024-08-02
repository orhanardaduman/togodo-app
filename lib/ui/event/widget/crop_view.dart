import 'dart:io';
import 'dart:ui' as ui;

import 'package:crop/crop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';

class CropView extends StatefulHookConsumerWidget {
  const CropView(
    this.img,
    this.onSave, {
    super.key,
  });
  final String? img;
  final Function(ui.Image? cropeed, String aspectRatio) onSave;
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _CropViewState();
}

class _CropViewState extends ConsumerState<CropView> {
  final controller = CropController(aspectRatio: 9 / 16);
  BoxShape shape = BoxShape.rectangle;
  ui.Image? imageData;
  bool isFit = true;
  bool isInProcess = false;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    getImageData();
    super.initState();
  }

  getImageData() async {
    final file = File(
      widget.img ?? '',
    );
    imageData = await decodeImageFromList(file.readAsBytesSync());

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    return Scaffold(
      backgroundColor: theme.appColors.background,
      /*   floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.rotation = 0;
          controller.offset = Offset(0, 0);
          controller.scale = 0;
        },
      ),*/
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: l10n.edit,
              hasEdit: true,
              actions: [
                TextButton(
                  onPressed: () async {
                    if (!isInProcess) {
                      isInProcess = true;
                      final response = await controller.crop(pixelRatio: 5);
                      /*   final data = await response?.toByteData(
                        format: ui.ImageByteFormat.png,
                      );*/
                      widget.onSave(
                          response, controller.aspectRatio.toString());
                      isInProcess = false;
                    }
                  },
                  child: PrimaryText(
                    l10n.save_button,
                    style: theme.textTheme.bodyXLarge.copyWith(
                      color: theme.appColors.themeColor,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: controller.aspectRatio,
                child: LayoutBuilder(
                  builder: (context, snapshot) {
                    return Crop(
                      backgroundColor: Colors.transparent,
                      onChanged: (decomposition) {
                        if (decomposition.rotation != 0.0) {
                          controller.rotation = 0;
                        }
                      },
                      controller: controller,
                      shape: shape,
                      helper: shape == BoxShape.rectangle
                          ? Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                            )
                          : null,
                      child: Container(
                        color: Colors.transparent,
                        width: !isFit
                            ? MediaQuery.of(context).size.width
                            : (snapshot.maxHeight * controller.aspectRatio),
                        height: !isFit
                            ? MediaQuery.of(context).size.height
                            : (snapshot.maxWidth * controller.aspectRatio),
                        child: Image.file(
                          File(
                            widget.img ?? '',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (!isFit) {
                      if (imageData != null) {
                        controller
                          ..offset = Offset.zero
                          ..rotation = 0
                          ..scale = 0;
                      }
                    } else {
                      controller
                        ..offset = Offset.zero
                        ..rotation = 0
                        ..scale = 0;
                    }
                    setState(() {
                      isFit = !isFit;
                    });
                  },
                  icon: Icon(
                    isFit ? Icons.fullscreen : Icons.fullscreen_exit,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (cxt) {
                        return Theme(
                          data: ThemeData.light(),
                          child: CupertinoActionSheet(
                            actions: [
                              CupertinoActionSheetAction(
                                child: Text(
                                  l10n.original,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  if (imageData != null) {
                                    controller
                                      ..aspectRatio =
                                          imageData!.width / imageData!.height
                                      ..offset = Offset.zero
                                      ..rotation = 0
                                      ..scale = 0;
                                    setState(() {
                                      isFit = false;
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text(
                                  l10n.homePageSize,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  controller
                                    ..aspectRatio = 9 / 16
                                    ..offset = Offset.zero
                                    ..rotation = 0
                                    ..scale = 0;
                                  setState(() {
                                    isFit = true;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text(
                                  '4:5',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  controller
                                    ..aspectRatio = 4 / 5
                                    ..offset = Offset.zero
                                    ..rotation = 0
                                    ..scale = 0;
                                  setState(() {
                                    isFit = true;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: Text(
                                l10n.cancel,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Text(
                    l10n.editAlt,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller
                      ..offset = Offset.zero
                      ..rotation = 0
                      ..scale = 0;

                    setState(() {
                      isFit = false;
                    });
                  },
                  icon: const Icon(
                    Icons.restore,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
