import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

const errorImage =
    'https://api.togodo.xyz/resource/event-image/togodo-combination-logo-dark.png';

class FeaturedImageWidget extends StatelessWidget {
  const FeaturedImageWidget({
    required this.imageUrl,
    this.resolution = '1200x800',
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.isTimeline = false,
  });
  final String imageUrl;
  final BorderRadiusGeometry borderRadius;
  final String resolution;
  final bool isTimeline;

  @override
  Widget build(BuildContext context) {
    final isPortrait = resolution.isPortrait;
    return Stack(
      alignment: Alignment.center,
      fit: isPortrait ? StackFit.expand : StackFit.loose,
      children: isPortrait
          ? [
              FeaturedImageLinearContainer(
                borderRadius: borderRadius,
                imageUrl: imageUrl,
                isTimeline: isTimeline,
              ),
            ]
          : [
              // Arkadaki bulanık resim
              if (isTimeline)
                Blurs(borderRadius: borderRadius, imageUrl: imageUrl)
              else
                ClipRRect(
                  borderRadius: borderRadius,
                  child: Blurs(borderRadius: borderRadius, imageUrl: imageUrl),
                ),
              // Ön plandaki orijinal boyutlu resim
              Padding(
                padding: EdgeInsets.only(bottom: isTimeline ? 160 : 10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    errorImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
    );
  }
}

class Blurs extends StatelessWidget {
  const Blurs({
    required this.borderRadius,
    required this.imageUrl,
    super.key,
  });

  final BorderRadiusGeometry borderRadius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 10,
      blurColor: Colors.black.withOpacity(0.5),
      child: Positioned.fill(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.network(
              errorImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class FeaturedImageLinearContainer extends StatelessWidget {
  const FeaturedImageLinearContainer({
    required this.borderRadius,
    required this.imageUrl,
    this.isTimeline = false,
    super.key,
  });

  final BorderRadiusGeometry borderRadius;
  final String imageUrl;
  final bool isTimeline;

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
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => CachedNetworkImage(
            imageUrl: errorImage,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => const SizedBox.shrink(),
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

extension ResolutionExtension on String {
  bool get isLandscape {
    final parts = split('x');
    if (parts.length == 2) {
      final height = int.tryParse(parts[0]);
      final width = int.tryParse(parts[1]);

      if (width != null && height != null) {
        return width > height;
      }
    }
    // Eğer format beklenildiği gibi değilse, varsayılan olarak false döner.
    return false;
  }

  bool get isPortrait {
    // Dikey (portrait) olup olmadığını kontrol etmek için,
    // yatay olmadığını kontrol edebiliriz.
    return !isLandscape;
  }
}
