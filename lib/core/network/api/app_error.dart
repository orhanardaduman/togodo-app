import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

class AppError {
  AppError(Exception? error) {
    if (error is DioException) {
      debugPrint('AppError(DioException): '
          'type is ${error.type}, message is ${error.message}');
      message = error.message ?? '';
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          type = AppErrorType.timeout;
        case DioExceptionType.sendTimeout:
          type = AppErrorType.network;
        case DioExceptionType.cancel:
          type = AppErrorType.cancel;
        // ignore: no_default_cases
        default:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = AppErrorType.network;
          } else {
            switch (error.response?.statusCode) {
              case HttpStatus.badRequest: // 400
                type = AppErrorType.badRequest;
              case HttpStatus.unauthorized: // 401
                type = AppErrorType.unauthorized;
              case HttpStatus.internalServerError: // 500
              case HttpStatus.badGateway: // 502
              case HttpStatus.serviceUnavailable: // 503
              case HttpStatus.gatewayTimeout: // 504
                type = AppErrorType.server;
              default:
                type = AppErrorType.unknown;
                break;
            }
          }
      }
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      message = 'AppError: $error';
    }
  }
  late String message;
  late AppErrorType type;
}
