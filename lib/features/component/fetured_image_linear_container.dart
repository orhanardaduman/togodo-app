import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

const errorImage =
    'https://api.togodo.xyz/resource/event-image/togodo-combination-logo-dark.png';

class FeaturedImageLinearContainer extends StatelessWidget {
  const FeaturedImageLinearContainer({
    required this.borderRadius,
    required this.imageUrl,
    required this.isFull,
    this.isTimeline = false,
    super.key,
  });

  final BorderRadiusGeometry borderRadius;
  final String imageUrl;
  final bool isTimeline;
  final bool isFull;

  @override
  Widget build(BuildContext context) {
    return isTimeline
        ? body()
        : ClipRRect(
            borderRadius: borderRadius,
            child: body(),
          );
  }

  Stack body() {
    return Stack(
      fit: StackFit.expand,
      children: [
        AspectRatio(
          aspectRatio: 9 / 16,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: isFull ? BoxFit.cover : BoxFit.contain,
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl: errorImage,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => const SizedBox.shrink(),
            ),
          ),
        ),
        /*    Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.network(
            errorImage,
            fit: BoxFit.contain,
          ),
        ), */
        // Üstteki Gradient
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: MainColors.myGradient,
            ),
          ),
        ),
        // Altaki Gradient
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              gradient: MainColors.myGradientBottom,
            ),
          ),
        ),
      ],
    );
  }
}
