import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/constants/constants.dart';
import 'package:togodo/core/enums/cache_items.dart';

final dioProvider =
    StateNotifierProvider<DioNotifier, Dio>((ref) => DioNotifier());

class DioNotifier extends StateNotifier<Dio> {
  DioNotifier() : super(AppDio._());

  void updateToken(String token) {
    print("update tokende " + token);
    state.options.headers['Authorization'] = 'Bearer $token';
  }
}

class AppDio with DioMixin implements Dio {
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: Constants.of().endpoint,
      //contentType: 'application/json',
      //connectTimeout: const Duration(milliseconds: 220000),
      //sendTimeout: const Duration(milliseconds: 220000),
      //receiveTimeout: const Duration(milliseconds: 220000),
    );

    this.options = options;

    // Function to transform keys to camelCase
    String _toCamelCase(String text) {
      if (text.isEmpty) return text;
      return text[0].toLowerCase() + text.substring(1);
    }

    // Recursive function to transform all keys in the data structure
    dynamic _transformKeys(dynamic original) {
      if (original is Map) {
        return original.map((key, value) {
          if (key is String && key.isNotEmpty) {
            return MapEntry(_toCamelCase(key), _transformKeys(value));
          }
          return MapEntry(key.toString(), _transformKeys(value));
        });
      } else if (original is List) {
        return original.map((item) => _transformKeys(item)).toList();
      }
      return original;
    }

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await CacheItems.token.readSecureData();
          if (token.ext.isNotNullOrNoEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          //options.headers.addAll(await userAgentClientHintsHeader());
          handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          if (response.data != null) {
            response.data = _transformKeys(response.data);
          }
          handler.next(response);
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
