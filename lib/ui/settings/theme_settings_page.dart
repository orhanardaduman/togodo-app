import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';

@RoutePage()
class ThemeModeSelectorPage extends HookConsumerWidget {
  const ThemeModeSelectorPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeNotifier = ref.watch(appThemeModeProvider.notifier);
    final currentThemeMode = ref.watch(appThemeModeProvider);
    final sharedPreferences = ref.watch(themePreferenceProvider.future);
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.settings,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          PrimaryText(
            l10n.theme,
            style: theme.textTheme.h5.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          PrimaryText(
            l10n.themeInfo,
            style: theme.textTheme.bodyMedium.copyWith(
              color: theme.appColors.secondText,
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            title: PrimaryText(
              l10n.lightTheme,
              style: theme.textTheme.h6.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.appColors.text,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            trailing: Radio<ThemeMode>(
              value: ThemeMode.light,
              activeColor: theme.appColors.themeColor,
              fillColor: MaterialStateProperty.all(theme.appColors.themeColor),
              groupValue: currentThemeMode,
              onChanged: (mode) async {
                if (mode != null) {
                  themeModeNotifier.setThemeMode(mode, await sharedPreferences);
                }
              },
            ),
            onTap: () async {
              themeModeNotifier.setThemeMode(
                ThemeMode.light,
                await sharedPreferences,
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: PrimaryText(
              l10n.darkTheme,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: currentThemeMode,
              activeColor: theme.appColors.themeColor,
              fillColor: MaterialStateProperty.all(theme.appColors.themeColor),
              onChanged: (mode) async {
                if (mode != null) {
                  themeModeNotifier.setThemeMode(mode, await sharedPreferences);
                }
              },
            ),
            onTap: () async {
              themeModeNotifier.setThemeMode(
                ThemeMode.dark,
                await sharedPreferences,
              );
            },
          ),
        ],
      ),
    );
  }
}
