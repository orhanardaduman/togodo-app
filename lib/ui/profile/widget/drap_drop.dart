// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:reorderables/reorderables.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/data/model/profil/media_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view_model/profil_edit_view_model.dart';

class DragDropImage extends StatefulHookConsumerWidget {
  const DragDropImage({
    super.key,
    this.imageUrl,
  });
  final List<Images>? imageUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DragDropImageState();
}

class _DragDropImageState extends ConsumerState<DragDropImage> {
  List<int> items = List.generate(4, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ReorderableWrap(
      runSpacing: 21,
      spacing: 20,
      onReorder: _onReorder,
      children: items.map((item) => _buildItem(context, item)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, int item) {
    return Draggable(
      data: item,
      feedback: _buildItemBox(item, isDragging: true),
      childWhenDragging: _buildItemBox(item, isVisible: false),
      child: DragTarget<int>(
        onWillAccept: (int? data) {
          return data != item;
        },
        onAccept: (int data) {
          final indexOld = items.indexOf(data);
          final indexNew = items.indexOf(item);
          setState(() {
            final itemData = items[indexOld];
            items[indexOld] = items[indexNew];
            items[indexNew] = itemData;
            ref
                .watch(profilEditViewModelProvider.notifier)
                .changeNewIndex(indexOld, indexNew);
            ref
                .watch(profilEditViewModelProvider.notifier)
                .changeIndexImage(data, item);
          });
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
    Images? image;
    if (widget.imageUrl != null && item < widget.imageUrl!.length) {
      image = widget.imageUrl!.where((element) => element.number == item).first;
    }
    return Material(
      borderRadius: BorderRadius.circular(40),
      child: CustomImageBox(
        index: item,
        key: ValueKey('value$item'),
        image: image,
        oldIndex: image != null ? image.number! : -1,
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }
}

class CustomImageBox extends HookConsumerWidget {
  const CustomImageBox({
    super.key,
    this.index,
    this.image,
    this.oldIndex = -1,
  });

  final int? index;
  final Images? image;
  final int oldIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(profilEditViewModelProvider.notifier);
    final modelView = ref.watch(profilEditViewModelProvider);

    ImageProvider? imageProvider;

    // MediaList'ten uygun medya öğesini almak için ortak bir fonksiyon.
    MediaModel? getMediaItem() {
      return modelView.mediaList
          .firstWhereOrNull((element) => element?.index == index);
    }

    // İmaj sağlayıcıyı kurmak için ortak bir fonksiyon.
    void setImageProvider(MediaModel? mediaItem) {
      if (mediaItem != null && mediaItem.url != null) {
        imageProvider = FileImage(mediaItem.url!);
        // Index değişikliğini işlemek için callback'i ayarla.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.changeIndex(mediaItem.url!.path, index!);
        });
      }
    }

    // Duruma göre imaj sağlayıcısını belirle.
    if (image != null) {
      final mediaItem = getMediaItem();
      setImageProvider(mediaItem);
      // Eğer medya listesi boş değil ve medya öğesi yoksa, ağ üzerinden yükle.
      imageProvider ??= NetworkImage(image!.downloadUrl!);
    } else {
      // Eğer gelen imaj null ise ve medya listesi boş değilse, ilk uygun medya öğesini kullan.
      setImageProvider(getMediaItem());
    }

    DecorationImage? imageDecoration;
    if (imageProvider != null) {
      imageDecoration = DecorationImage(
        image: imageProvider!,
        fit: BoxFit.fill,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: context.sized.dynamicWidth(0.4093),
          height: context.sized.dynamicWidth(0.4093),
          decoration: BoxDecoration(
            image: imageDecoration,
            borderRadius: BorderRadius.circular(40),
            color: MainColors.transparentBlue,
            border: Border.all(
              color: MainColors.primary,
              width: 1.5,
            ),
          ),
        ),
        if (imageProvider == null)
          InkWell(
            onTap: () async {
              await model.pickImage(index!, context: context);
            },
            child: Assets.icons.bold.plus.svg(
              color: MainColors.primary,
              width: 37.5,
              height: 37.5,
            ),
          )
        else
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              radius: 12.5,
              onTap: () async {
                await model.pickImage(index!, context: context);
              },
              child: Container(
                width: 37.5,
                height: 37.5,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                  color: MainColors.dark3,
                ),
                child: Assets.icons.light.editSquare.svg(
                  color: MainColors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
