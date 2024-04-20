import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/theme/app_theme.dart';

class FlatActionButton extends HookConsumerWidget {
  const FlatActionButton({
    super.key,
    this.icon,
    this.onPressed,
    this.iconData,
    this.iconColor,
    this.iconSize,
  });
  final Icon? icon;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: icon ??
            Icon(
              iconData ?? Icons.arrow_back_ios_new,
              size: iconSize ?? 24.0,
              color: iconColor ?? theme.appColors.text,
            ),
      ),
    );
  }
}
