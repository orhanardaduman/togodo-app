import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:togodo/app.dart';
import 'package:togodo/core/initialized/app_start.dart';

import 'dependency_injection/bloc_injection.dart';

FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

Future<void> main() async {
  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  await runZonedGuarded<Future<void>>(() async {
    try {
      await AppStart.init();
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
    } catch (e) {}

    runApp(
      MultiBlocProvider(
        providers: BlocInjection().blocs,
        child: const ProviderScope(
          child: OverlaySupport(
            child: App(),
          ),
        ),
      ),
    );
  }, (error, stackTrace) {
    Future.microtask(
      () => FirebaseCrashlytics.instance.recordError(error, stackTrace),
    );
  });
}
