import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kartal/kartal.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:togodo/core/constants/constants.dart';
import 'package:togodo/core/notification/fcm_notification_service.dart';
import 'package:togodo/core/notification/local_notification_service.dart';
import 'package:togodo/firebase_options.dart';

@immutable
class AppStart {
  const AppStart._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // FShort.instance.setup(token: '492634824adb7b48b32032430157ae33d39be6b2');
    final activeFlavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    )!;
    await dotenv.load(
      fileName: activeFlavor == Flavor.production ? '.env' : '.env.dev',
    );

    if (!kIsWeb) {
      await Firebase.initializeApp(
        name: DefaultFirebaseOptions.currentPlatform.projectId,
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FirebaseMessaging.onBackgroundMessage(
        onBackgroundMessages,
      );
      await FirebaseAppCheck.instance.activate(
        // Set appleProvider to `AppleProvider.debug`
        androidProvider: AndroidProvider.debug,
        appleProvider: AppleProvider.debug,
      );
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(kDebugMode);
      final originalOnError = FlutterError.onError!;
      FlutterError.onError = (FlutterErrorDetails errorDetails) async {
        await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
        originalOnError(errorDetails);
      };
    } else {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    await DeviceUtility.instance.initPackageInfo();
    // await AppHiveStart.init();
    await NotificationService.instance.init();
    tz.initializeTimeZones();
    // Crashlytics
  }
}
