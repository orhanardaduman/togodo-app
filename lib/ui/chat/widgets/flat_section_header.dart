import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/theme/app_theme.dart';

class FlatSectionHeader extends HookConsumerWidget {
  const FlatSectionHeader({
    super.key,
    this.title,
    this.textSize,
    this.fontWeight,
    this.backgroundColor,
    this.textColor,
  });
  final String? title;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Text(
        title ?? 'Section Header',
        style: TextStyle(
          color: textColor ?? theme.appColors.text,
          fontWeight: fontWeight ?? FontWeight.w700,
          fontSize: textSize ?? 16.0,
        ),
      ),
    );
  }
}
