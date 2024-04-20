// ignore_for_file: prefer_asserts_with_message

import 'package:flutter/material.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/index.dart';

class CustomGalleryImage extends StatefulWidget {
  const CustomGalleryImage({
    required this.imageUrls,
    super.key,
    this.titleGallery,
    this.numOfShowImages = 3,
  }) : assert(numOfShowImages <= imageUrls.length);
  final List<String> imageUrls;
  final String? titleGallery;
  final int numOfShowImages;
  @override
  State<CustomGalleryImage> createState() => _CustomGalleryImageState();
}

class _CustomGalleryImageState extends State<CustomGalleryImage> {
  List<GalleryItemModel> galleryItems = <GalleryItemModel>[];
  @override
  void initState() {
    buildItemsList(widget.imageUrls);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: galleryItems.isEmpty
          ? const SizedBox()
          : GridView.builder(
              primary: false,
              itemCount: galleryItems.length > 3
                  ? widget.numOfShowImages
                  : galleryItems.length,
              padding: EdgeInsets.zero,
              semanticChildCount: 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: galleryItems.length == 1 ? 1 : 2,
                crossAxisSpacing: galleryItems.length == 1 ? 1 : 10,
                mainAxisSpacing: galleryItems.length == 1 ? 0 : 10,
              ),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  // if have less than 4 image w build GalleryItemThumbnail
                  // if have mor than 4 build image number 3 with number for other images
                  child: index < galleryItems.length - 1 &&
                          index == widget.numOfShowImages - 1
                      ? buildImageNumbers(index)
                      : CustomGalleryItemThumbnail(
                          galleryItem: galleryItems[index],
                          onTap: () {
                            openImageFullScreen(index);
                          },
                        ),
                );
              },
            ),
    );
  }

// build image with number for other images
  Widget buildImageNumbers(int index) {
    return GestureDetector(
      onTap: () {
        openImageFullScreen(index);
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: <Widget>[
          CustomGalleryItemThumbnail(
            galleryItem: galleryItems[index],
          ),
          ColoredBox(
            color: Colors.black.withOpacity(.7),
            child: Center(
              child: Text(
                '+${galleryItems.length - index}',
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }

// to open gallery image in full screen
  void openImageFullScreen(int indexOfImage) {
    Navigator.push(
      context,
      MaterialPageRoute<GalleryImageViewWrapper>(
        builder: (context) => GalleryImageViewWrapper(
          titleGallery: widget.titleGallery,
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: indexOfImage,
        ),
      ),
    );
  }

// clear and build list
  void buildItemsList(List<String> items) {
    galleryItems.clear();
    for (final item in items) {
      galleryItems.add(
        GalleryItemModel(id: item, imageUrl: item),
      );
    }
  }
}
