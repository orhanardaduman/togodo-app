import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

const errorImage =
    'https://api.togodo.xyz/resource/event-image/togodo-combination-logo-dark.png';

class FeaturedImageLinearContainer extends StatelessWidget {
  const FeaturedImageLinearContainer({
    required this.borderRadius,
    required this.aspectRatio,
    required this.imageUrl,
    required this.isFull,
    this.isTimeline = false,
    super.key,
  });

  final BorderRadiusGeometry borderRadius;
  final String imageUrl;
  final bool isTimeline;
  final bool isFull;
  final String aspectRatio;

  @override
  Widget build(BuildContext context) {
    return isTimeline
        ? body(context)
        : ClipRRect(
            borderRadius: borderRadius,
            child: body(context),
          );
  }

  Stack body(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: (double.tryParse(aspectRatio) ?? 0) <=
                  ((MediaQuery.of(context).size.height * .45) /
                      MediaQuery.of(context).size.width)
              ? null
              : MediaQuery.of(context).size.height * .24,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: isFull
                ? null
                : (double.tryParse(aspectRatio) ?? 0) <=
                        ((MediaQuery.of(context).size.height * .45) /
                            MediaQuery.of(context).size.width)
                    ? MediaQuery.of(context).size.height * .9
                    : (MediaQuery.of(context).size.height * .5),
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
