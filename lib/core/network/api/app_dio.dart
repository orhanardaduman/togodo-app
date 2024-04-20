import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/constants/constants.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

final dioProvider =
    StateNotifierProvider<DioNotifier, Dio>((ref) => DioNotifier());

class DioNotifier extends StateNotifier<Dio> {
  DioNotifier() : super(AppDio._());

  void updateToken(String token) {
    state.options.headers['Authorization'] = 'Bearer $token';
  }
}

// ignore: prefer_mixin
class AppDio with DioMixin implements Dio {
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: Constants.of().endpoint,
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 220000),
      sendTimeout: const Duration(milliseconds: 220000),
      receiveTimeout: const Duration(milliseconds: 220000),
    );

    this.options = options;
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await CacheItems.token.readSecureData();
          if (token.ext.isNotNullOrNoEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers.addAll(await userAgentClientHintsHeader());
          handler.next(options);
        },
        onError: (DioException e, handler) {
          // Send the error details to Crashlytics
          FirebaseCrashlytics.instance.recordError(
            e,
            StackTrace.current,
            reason:
                'Error status code: ${e.response?.statusCode}, Error message: ${e.response?.statusMessage}',
          );
          handler.next(e);
        },
      ),
    );

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
