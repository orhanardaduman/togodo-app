import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    this.imageUrl,
    this.height = 100.0,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });
  final String? imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
        height: height,
        fit: fit,
        width: width,
      ),
    );
  }
}
