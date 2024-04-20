import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/index.dart';

// to show image in Row
class CustomGalleryItemThumbnail extends StatelessWidget {
  const CustomGalleryItemThumbnail({
    required this.galleryItem,
    super.key,
    this.onTap,
  });

  final GalleryItemModel galleryItem;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: UniqueKey().toString(),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: galleryItem.imageUrl,
          height: 100,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
