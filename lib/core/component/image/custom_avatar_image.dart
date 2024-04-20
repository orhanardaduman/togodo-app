import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class CustomAvatarImage extends HookConsumerWidget {
  const CustomAvatarImage({
    super.key,
    this.imageUrl,
    this.onlineColor,
    this.size,
    this.onlineIndicator = false,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius = 16,
    this.border,
  });
  final bool onlineIndicator;
  final Color? onlineColor;
  final String? imageUrl;
  final double? size;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double borderRadius;
  final BoxBorder? border;

  double outlineSize() {
    if (size != null) {
      return (size! / 100) * 15.0;
    } else {
      return 30;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkResponse(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: size ?? 48.0,
            height: size ?? 48.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: border,
              image: imageUrl != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageUrl!,
                      ),
                    )
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        Assets.images.stock.avatar.path,
                      ),
                    ),
            ),
          ),
          if (onlineIndicator)
            OnlineIndicator(
              isEnabled: onlineIndicator,
              color: onlineColor,
              size: outlineSize(),
              borderColor: backgroundColor,
            ),
        ],
      ),
    );
  }
}

class OnlineIndicator extends HookConsumerWidget {
  const OnlineIndicator({
    required this.isEnabled,
    required this.color,
    required this.size,
    required this.borderColor,
    super.key,
  });
  final bool isEnabled;
  final Color? color;
  final double size;
  final Color? borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final position = (size / 100) * 15.0;
    return Positioned(
      bottom: position,
      right: position,
      child: Container(
        width: isEnabled ? 12.0 : 0.0,
        height: isEnabled ? 12.0 : 0.0,
        decoration: BoxDecoration(
          color: color ?? theme.appColors.themeColor,
          border: Border.all(
            color: borderColor ?? Colors.white,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
