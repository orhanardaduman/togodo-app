import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class FlatProfileImage extends HookConsumerWidget {
  const FlatProfileImage({
    super.key,
    this.imageUrl,
    this.outlineIndicator,
    this.onlineColor,
    this.outlineColor,
    this.size = 60.0,
    this.onlineIndicator,
    this.onPressed,
    this.backgroundColor,
  });
  final bool? outlineIndicator;
  final Color? outlineColor;
  final bool? onlineIndicator;
  final Color? onlineColor;
  final String? imageUrl;
  final double size;
  final void Function()? onPressed;
  final Color? backgroundColor;

  Border? flatIndicatorBorder(Color color) {
    if (outlineIndicator == null) {
      return null;
    } else {
      return Border.all(
        color: color,
        width: 2,
      );
    }
  }

  double imageSize() {
    return size - 4.0;
  }

  bool showOnlineIndicator() {
    if (onlineIndicator != null && onlineIndicator! == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    if (outlineIndicator != null && outlineIndicator! == true) {
      return InkResponse(
        onTap: onPressed,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: flatIndicatorBorder(
                  outlineColor ?? theme.appColors.themeColor,
                ),
              ),
              child: FlatIndicatorImage(
                width: imageSize(),
                height: imageSize(),
                indicator: outlineIndicator ?? false,
                image: imageUrl,
              ),
            ),
            OnlineIndicator(
              isEnabled: showOnlineIndicator(),
              color: onlineColor,
              size: size,
              borderColor: backgroundColor,
            ),
          ],
        ),
      );
    } else {
      return InkResponse(
        onTap: onPressed,
        child: Stack(
          children: [
            FlatIndicatorImage(
              width: size,
              height: size,
              indicator: outlineIndicator ?? false,
              image: imageUrl,
            ),
            OnlineIndicator(
              isEnabled: showOnlineIndicator(),
              color: onlineColor,
              size: size,
              borderColor: backgroundColor,
            ),
          ],
        ),
      );
    }
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
        width: isEnabled ? 15.0 : 0.0,
        height: isEnabled ? 15.0 : 0.0,
        decoration: BoxDecoration(
          color: color ?? theme.appColors.themeColor,
          border: Border.all(
            color: borderColor ?? Theme.of(context).primaryColorLight,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class FlatIndicatorImage extends StatelessWidget {
  const FlatIndicatorImage({
    super.key,
    this.image,
    this.width,
    this.height,
    this.indicator,
  });
  final String? image;
  final double? width;
  final double? height;
  final bool? indicator;

  double imageMargin() {
    return indicator! ? 4.0 : 8.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.all(imageMargin()),
      width: width,
      height: height,
      child: profileImage(),
    );
  }

  Widget profileImage() {
    if (image == null) {
      return Assets.images.stock.avatar.image(
        fit: BoxFit.cover,
      );
    } else {
      return CustomAvatarImage(
        imageUrl: image,
      );
    }
  }
}
