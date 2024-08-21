import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/theme/app_theme.dart';

class PrimaryText extends HookConsumerWidget {
  const PrimaryText(
    this.data, {
    super.key,
    this.style,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });
  final TextOverflow? overflow;
  final String data;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Text(
      data,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: style ??
          theme.textTheme.bodyMedium.copyWith(
            color: theme.appColors.text,
          ),
    );
  }
}
