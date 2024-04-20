import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';

class StepLineProgress extends HookConsumerWidget {
  const StepLineProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final model = ref.watch(createEventModelProvider);

    return SizedBox(
      width: 260,
      child: LinearProgressIndicator(
        value: model.progress,
        minHeight: 12,
        borderRadius: BorderRadius.circular(16),
        valueColor: const AlwaysStoppedAnimation<Color>(MainColors.primary),
        backgroundColor: theme.mode == ThemeMode.light
            ? theme.appColors.background
            : MainColors.dark3,
      ),
    );
  }
}
