import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

const errorImage =
    'https://api.togodo.xyz/resource/event-image/togodo-combination-logo-dark.png';

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
      blurColor: Colors.black.withOpacity(0.2),
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
