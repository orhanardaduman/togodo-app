import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

// Language Preference Provider
final languagePreferenceProvider = FutureProvider<SharedPreferences>(
  (ref) async => SharedPreferences.getInstance(),
);

// Language Provider
final languageProvider = StateNotifierProvider<LanguageNotifier, String>(
  (ref) {
    final sharedPreferences = ref.watch(languagePreferenceProvider.future);
    return LanguageNotifier(sharedPreferences);
  },
);

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier(this._sharedPreferences)
      : super(
          const Locale('tr').toString(), // Default language: English
        ) {
    fetchLanguagePreference();
  }
  final Future<SharedPreferences> _sharedPreferences;

  Future<void> fetchLanguagePreference() async {
    final sharedPreferences = await _sharedPreferences;
    final language = sharedPreferences.getString('language') ??
        const Locale('tr').toString(); // Default language: English
    state = language;
  }

  Future<void> setLanguagePreference(String language) async {
    final sharedPreferences = await _sharedPreferences;
    await sharedPreferences.setString('language', language);
    state = language;
  }
}

@RoutePage()
class LanguageSelectorPage extends HookConsumerWidget {
  const LanguageSelectorPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageNotifier = ref.watch(languageProvider.notifier);
    final currentLanguage = ref.watch(languageProvider);
    final profilView = ref.watch(profilViewModelProvider('').notifier);
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.languageSelector,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          PrimaryText(
            l10n.language,
            style: theme.textTheme.h5.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          PrimaryText(
            l10n.languageInfo,
            style: theme.textTheme.bodyMedium.copyWith(
              color: theme.appColors.secondText,
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            title: PrimaryText(
              l10n.english,
              style: theme.textTheme.h6.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.appColors.text,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            trailing: Radio<String>(
              value: const Locale('en').toString(),
              groupValue: currentLanguage,
              activeColor: theme.appColors.themeColor,
              fillColor: MaterialStateProperty.all(theme.appColors.themeColor),
              onChanged: (language) async {
                if (language != null) {
                  await languageNotifier.setLanguagePreference(language);
                  await ref
                      .read(profilViewModelProvider(null).notifier)
                      .fetchProfil();

                  await profilView.updateLanguage(language);
                }
              },
            ),
            onTap: () async {
              await languageNotifier
                  .setLanguagePreference(const Locale('en').toString());
              await ref
                  .read(profilViewModelProvider(null).notifier)
                  .fetchProfil();
              await profilView.updateLanguage('en');
            },
          ),
          ListTile(
            title: PrimaryText(
              l10n.turkish,
              style: theme.textTheme.h6.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.appColors.text,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            trailing: Radio<String>(
              value: const Locale('tr').toString(),
              groupValue: currentLanguage,
              activeColor: theme.appColors.themeColor,
              fillColor: MaterialStateProperty.all(theme.appColors.themeColor),
              onChanged: (language) async {
                if (language != null) {
                  await languageNotifier.setLanguagePreference(language);
                  await ref
                      .read(profilViewModelProvider(null).notifier)
                      .fetchProfil();
                  await profilView.updateLanguage(language);
                }
              },
            ),
            onTap: () async {
              await languageNotifier
                  .setLanguagePreference(const Locale('tr').toString());
              await ref
                  .read(profilViewModelProvider(null).notifier)
                  .fetchProfil();
              await profilView.updateLanguage('tr');
            },
          ),
          // Add more languages here...
        ],
      ),
    );
  }
}
