import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/route/app_route.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class App extends HookConsumerWidget {
  const App({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FlutterUxcam
        .optIntoSchematicRecordings(); // Confirm that you have user permission for screen recording
    final config = FlutterUxConfig(
      userAppKey: 'ddigkax8qm5aewa',
      enableAutomaticScreenNameTagging: false,
      enableCrashHandling: true,
    );
    FlutterUxcam.startWithConfiguration(config);
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final appRouter = useMemoized(AppRouter.new);
    final language = ref.watch(languageProvider);
    final locale = Locale(language);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: theme.appColors.background, // StatusBar'ı şeffaf yapın
        statusBarIconBrightness: themeMode == ThemeMode.dark
            ? Brightness.light
            : Brightness.dark, // StatusBar ikonlarını beyaz yapın
        systemNavigationBarColor: theme.appColors.background,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark,
      ),
    );
    return MaterialApp.router(
      theme: theme.data,
      //  builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routerConfig: appRouter.config(deepLinkBuilder: (deepLink) {
        return DeepLink.defaultPath;
      }),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
