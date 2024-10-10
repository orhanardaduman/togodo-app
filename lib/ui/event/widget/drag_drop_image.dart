import 'dart:ui' as ui;

import 'package:blur/blur.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:reorderables/reorderables.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';

class CreateEventDragDropImage extends StatefulHookConsumerWidget {
  const CreateEventDragDropImage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEventDragDropImageState();
}

class _CreateEventDragDropImageState
    extends ConsumerState<CreateEventDragDropImage> {
  List<int> items = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    final model = ref.read(createEventModelProvider.notifier);

    return ReorderableWrap(
      runSpacing: 21,
      spacing: context.isSmallScrn ? 6 : 15,
      onReorder: _onReorder,
      children: items.map((item) => _buildItem(context, item, model)).toList(),
    );
  }

  Widget _buildItem(
    BuildContext context,
    int item,
    CreateEventViewModel model,
  ) {
    return Draggable(
      data: item,
      feedback: _buildItemBox(item, isDragging: true),
      childWhenDragging: _buildItemBox(item, isVisible: false),
      child: DragTarget<int>(
        onWillAccept: (int? data) {
          return data != item;
        },
        onAccept: (int data) {
          model.updateIndex(data, item);
        },
        builder: (context, candidateData, rejectedData) {
          return _buildItemBox(
            item,
          );
        },
      ),
    );
  }

  Widget _buildItemBox(
    int item, {
    bool isDragging = false,
    bool isVisible = true,
  }) {
    // imageUrl listesinin null olup olmadığını ve
    // index'in list uzunluğunu aşmadığını kontrol et.

    return CustomImageBox(
      index: item,
      key: ValueKey('value$item'),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
    // MediaModel ve Images listelerindeki öğeleri güncelleme
  }
}

class CustomImageBox extends HookConsumerWidget {
  const CustomImageBox({
    super.key,
    this.index,
  });

  final int? index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(createEventModelProvider.notifier);
    final modelView = ref.watch(createEventModelProvider);
    final theme = ref.watch(appThemeProvider);
    ImageProvider? imageProvider;
    Future<ui.Image>? imageData;
    // ignore: unused_local_variable
    var isUrl = false;
    // Network listesinden uygun nesneyi al

    SelectedAssetsModel? getAssets() {
      return modelView.selectedAssetsAll
          ?.firstWhereOrNull((element) => element.index == index);
    }

    // Duruma göre imageProvider'ı belirle
    final assets = getAssets();

    if (assets != null && assets.localImage != null) {
      // Network listesinde nesne yoksa ama media listesinde varsa, onu kullan
      imageProvider = FileImage(assets.localImage!);
    } else if (assets != null && assets.networkImage != null) {
      isUrl = true;
      // Network listesinden bir nesne varsa, onu kullan
      imageProvider = NetworkImage(assets.networkImage!);
    }

    DecorationImage? imageDecoration;
    DecorationImage? forBlur;
    DecorationImage? forFull;
    if (imageProvider != null) {
      imageDecoration =
          DecorationImage(image: imageProvider, fit: BoxFit.contain);
    }
    if (imageProvider != null) {
      forFull = DecorationImage(image: imageProvider, fit: BoxFit.cover);
    }
    if (imageProvider != null) {
      forBlur = DecorationImage(image: imageProvider, fit: BoxFit.cover);
    }
    if (assets?.localImage != null) {
      imageData = decodeImageFromList(assets!.localImage!.readAsBytesSync());
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: context.sized.dynamicWidth(0.149),
          height: 97,
          decoration: BoxDecoration(
            image: imageDecoration,
            borderRadius: BorderRadius.circular(16.6),
            border: Border.all(
              color: theme.mode == ThemeMode.dark
                  ? MainColors.dark2
                  : MainColors.grey200,
            ),
            color: theme.mode == ThemeMode.dark
                ? MainColors.dark3
                : MainColors.grey50,
          ),
          child: FutureBuilder(
            future: imageData,
            builder: (context, snapshot) {
              var denemeImageDecoration = assets?.isCropped == null
                  ? forFull
                  : ((snapshot.data?.width ?? 0) /
                                  (snapshot.data?.height ?? 0) <
                              0.6 &&
                          (snapshot.data?.width ?? 0) /
                                  (snapshot.data?.height ?? 0) >
                              0.5)
                      ? forFull
                      : imageDecoration;

              return ClipRRect(
                borderRadius: BorderRadius.circular(16.6),
                child: Stack(
                  children: [
                    Blur(
                      blur: 10,
                      blurColor: Colors.black.withOpacity(0.5),
                      child: Positioned.fill(
                        child: Container(
                          width: context.sized.dynamicWidth(0.149),
                          height: 97,
                          decoration: BoxDecoration(image: forBlur),
                        ),
                      ),
                    ),
                    Container(
                      width: context.sized.dynamicWidth(0.149),
                      height: 97,
                      decoration: BoxDecoration(
                        image: denemeImageDecoration,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        if (imageProvider != null && modelView.step == 2)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Material(
              // Wrap with a Material widget
              color:
                  Colors.transparent, // Maintain the existing background color

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    radius: 12.5,
                    onTap: () async {
                      // Eğer medya öğesi varsa, sil.
                      if (index != null) {
                        model.editAtIndex(
                          index!,
                          context,
                        );
                      }
                    },
                    child: Assets.icons.bold.edit.svg(
                      color: MainColors.white,
                      width: 15,
                      height: 16.7,
                    ),
                  ),
                  InkWell(
                    radius: 12.5,
                    onTap: () async {
                      // Eğer medya öğesi varsa, sil.
                      if (index != null) {
                        model.removeAssetsIndex(index!);
                      }
                    },
                    child: Assets.icons.bold.delete.svg(
                      color: MainColors.red,
                      width: 15,
                      height: 16.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
