import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/theme/app_theme.dart';

class FlatCounter extends HookConsumerWidget {
  const FlatCounter({super.key, this.color, this.textColor, this.text});
  final Color? color;
  final Color? textColor;
  final String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? theme.appColors.themeColor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: PrimaryText(
        text ?? '0',
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
