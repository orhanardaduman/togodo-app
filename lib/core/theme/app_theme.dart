import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_colors.dart';
import 'package:togodo/core/theme/app_text_theme.dart';

final themePreferenceProvider = FutureProvider<SharedPreferences>((ref) async {
  return SharedPreferences.getInstance();
});

final appThemeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final sharedPreferences = ref.watch(themePreferenceProvider.future);
  return ThemeModeNotifier(sharedPreferences);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier(Future<SharedPreferences> sharedPreferences)
      : super(ThemeMode.light) {
    _initThemeMode(sharedPreferences);
  }

  bool get isDark => state == ThemeMode.dark;
  Future<dynamic> _initThemeMode(
    Future<SharedPreferences> sharedPreferences,
  ) async {
    final prefs = await sharedPreferences;
    final themeModeString = prefs.getString('themeMode') ?? 'system';
    state = _getThemeModeFromString(themeModeString);
  }

  void setThemeMode(ThemeMode mode, SharedPreferences prefs) {
    prefs.setString('themeMode', mode.toString());
    state = mode;
  }

  ThemeMode _getThemeModeFromString(String themeModeString) {
    ThemeMode mode;
    switch (themeModeString) {
      case 'ThemeMode.dark':
        mode = ThemeMode.dark;
      case 'ThemeMode.light':
        mode = ThemeMode.light;
      default:
        mode = ThemeMode.dark;
    }
    return mode;
  }
}

final appThemeProvider = Provider<AppTheme>((ref) {
  final mode = ref.watch(appThemeModeProvider);
  switch (mode) {
    case ThemeMode.dark:
      return AppTheme.dark();
    case ThemeMode.light:
      return AppTheme.light();
    case ThemeMode.system:
      return AppTheme.light();
  }
});

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: appColors.background,
      // textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
      colorScheme: ColorScheme.dark(
        primary: appColors.text,
        secondary: appColors.secondText,
        surface: appColors.background,
        background: appColors.background,
        error: appColors.error,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: MainColors.primary,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }
  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: appColors.background,
      colorScheme: ColorScheme.dark(
        primary: appColors.text,
        secondary: appColors.secondText,
        surface: appColors.background,
        background: appColors.background,
        error: appColors.error,
      ),
      // textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: MainColors.primary,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}
