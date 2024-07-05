import 'package:flutter/material.dart';
import 'package:togodo/features/component/blurs.dart';
import 'package:togodo/features/component/fetured_image_linear_container.dart';

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
              if (isTimeline)
                Blurs(borderRadius: borderRadius, imageUrl: imageUrl),
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
