import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:togodo/app.dart';
import 'package:togodo/core/initialized/app_start.dart';

FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

Future<void> main() async {
  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  await runZonedGuarded<Future<void>>(() async {
    await AppStart.init();
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    ).then((_) {
      runApp(const ProviderScope(child: OverlaySupport(child: App())));
    });
  }, (error, stackTrace) {
    Future.microtask(
      () => FirebaseCrashlytics.instance.recordError(error, stackTrace),
    );
  });
}
