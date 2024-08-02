// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';

enum ButtonMode {
  dark,
  light,
  primary,
}

class CustomButton extends HookConsumerWidget {
  const CustomButton({
    required this.text,
    this.leftIcon,
    this.maxLines,
    this.leftIconColor,
    this.rightIcon,
    this.rightIconColor,
    this.shadowColor,
    this.isLeftIconColor = true,
    this.isRightIconColor = true,
    this.bgColor,
    this.mode = ButtonMode.primary,
    this.radius = 16,
    this.mainAxisAlignment = MainAxisAlignment.center,
    super.key,
    this.onPressed,
    this.side = BorderSide.none,
    this.iconSize = 20,
    this.style,
    this.maxWidthTextContainer = 150,
    this.startNull = false,
    this.textWidget,
    this.shape,
  });
  final int? maxLines;
  final String text;
  final String? leftIcon;
  final String? rightIcon;
  final ButtonMode mode;
  final double radius;
  final void Function()? onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final Color? shadowColor;
  final bool isLeftIconColor;
  final bool isRightIconColor;
  final BorderSide side;
  final double iconSize;
  final Color? bgColor;
  final TextStyle? style;
  final bool startNull; // Başlangıçta sağ ve solda  boşluk olup olmaması
  final Widget? textWidget;
  final OutlinedBorder? shape;
  final double maxWidthTextContainer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Arka plan rengini belirleyen fonksiyon
    Color determineBackgroundColor(
      ButtonMode mode,
      AppTheme theme,
      Color? bgColor,
    ) {
      if (bgColor != null) return bgColor;
      if (onPressed == null) {
        return theme.mode == ThemeMode.dark
            ? MainColors.dark3
            : MainColors.disabledButton;
      }
      switch (mode) {
        case ButtonMode.primary:
          return MainColors.primary;
        case ButtonMode.dark:
          return MainColors.dark2;
        // ignore: no_default_cases
        default:
          return MainColors.primary100;
      }
    }

// Metin rengini belirleyen fonksiyon
    Color determineTextColor(ButtonMode mode) {
      return (mode == ButtonMode.primary || mode == ButtonMode.dark)
          ? MainColors.white
          : MainColors.primary;
    }

// Ana fonksiyonda renkleri belirleyin
    final theme = ref.watch(appThemeProvider);
    final effectiveMode =
        mode == ButtonMode.dark && theme.mode != ThemeMode.dark
            ? ButtonMode.light
            : mode;

    final bgColors = determineBackgroundColor(effectiveMode, theme, bgColor);
    final textColor = determineTextColor(effectiveMode);

    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColors, // Arka plan rengi
        fixedSize: Size(
          380,
          context.isMediumScrn ? 58 : 48,
        ), // Butonun genişliği ve yüksekliği
        shadowColor: shadowColor, // Gölge rengi
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: shape ??
            RoundedRectangleBorder(
              side: side,
              borderRadius: BorderRadius.circular(radius), // Kenar yuvarlaklığı
            ),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          if (startNull && leftIcon != null) const SizedBox(width: 16),
          if (mainAxisAlignment == MainAxisAlignment.start)
            const SizedBox(width: 36),
          if (leftIcon != null)
            SvgPicture.asset(
              leftIcon!,
              width: iconSize,
              height: iconSize,
              color: isLeftIconColor ? (leftIconColor ?? textColor) : null,
            ),
          if (leftIcon != null) const SizedBox(width: 16),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidthTextContainer,
            ),
            child: textWidget ??
                AutoSizeText(
                  text,
                  maxLines: maxLines,
                  style: style ??
                      theme.textTheme.bodyMedium.copyWith(
                        color: textColor,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w700,
                      ),
                ),
          ), // Metin
          if (startNull && rightIcon != null) const SizedBox(width: 16),
          if (rightIcon != null)
            SvgPicture.asset(
              rightIcon!,
              width: iconSize,
              height: iconSize,
              color: isRightIconColor ? (rightIconColor ?? textColor) : null,
            ),
        ],
      ),
    );
  }
}
