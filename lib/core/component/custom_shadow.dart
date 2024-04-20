import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          _buildShadowContainer(60, 0, 4),
          _buildShadowContainer(60, 0, 4),
          _buildShadowContainer(100, 0, 20),
          _buildShadowContainer(24, 4, 8),
          _buildShadowContainer(32, 4, 12),
          _buildShadowContainer(32, 4, 16),
        ],
      ),
    );
  }

  Widget _buildShadowContainer(
    double blurRadius,
    double offsetX,
    double offsetY,
  ) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(36)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x4020c6a5),
            offset: Offset(offsetX, offsetY),
            blurRadius: blurRadius,
          ),
        ],
        color: const Color(0xffeef4ff),
      ),
    );
  }
}

extension BoxShadowExtension on BoxDecoration {
  /// Adds a custom shadow to a BoxDecoration.
  BoxDecoration addCustomShadow({
    required Color color,
    double offsetX = 0.0,
    double offsetY = 0.0,
    double blurRadius = 4.0,
  }) {
    // You may want to copy the current box decoration to maintain other properties
    final currentBoxShadow = List<BoxShadow>.from(boxShadow ?? []);

    // Adding new BoxShadow to the existing list
    // ignore: cascade_invocations
    currentBoxShadow.add(
      BoxShadow(
        color: color,
        offset: Offset(offsetX, offsetY),
        blurRadius: blurRadius,
      ),
    );

    return copyWith(boxShadow: currentBoxShadow);
  }

  BoxDecoration get buttonShadow => addCustomShadow(
        color: MainColors.transparentBlue.withOpacity(0.2),
        offsetX: 4,
        offsetY: 16,
        blurRadius: 32,
      );
}
