import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';

class OutlineCircleButton extends HookConsumerWidget {
  const OutlineCircleButton({
    required this.icon,
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;

    return Material(
      color: Colors.transparent, // Material'ın rengini şeffaf yapın
      borderRadius: BorderRadius.circular(
        45,
      ), // Material'ın kenar yuvarlaklığını ayarlayın
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          45,
        ), // InkWell'ın kenar yuvarlaklığını ayarlayın
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(45),
            ),
            border: Border.all(
              color: themeMode ? MainColors.dark3 : MainColors.grey200,
            ),
          ),
          child: icon,
        ),
      ),
    );
  }
}
