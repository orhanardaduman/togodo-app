import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/theme/app_theme.dart';

class CustomDivider extends HookConsumerWidget {
  const CustomDivider({super.key, this.height = 1});
  final double height;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Divider(
      height: height,
      color: theme.appColors.divider,
    );
  }
}
