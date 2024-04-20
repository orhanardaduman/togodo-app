import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/network/api/app_error.dart';
import 'package:togodo/data/local/app_user.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/data/remote/api/auth_data_source.dart';
import 'package:togodo/data/remote/api/auth_data_source_impl.dart';
import 'package:togodo/data/repository/auth_repository.dart';

final authRepositoryProvider = Provider(AuthRepositoryImpl.new);

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._ref);

  final ProviderRef<dynamic> _ref;

  late final AuthDataSource _dataSource = _ref.read(authDataSourceProvider);

  @override
  Future<Result<AppUser?>> signInGoogle() async {
    try {
      // Google ile giriş yapmayı deneyin
      final user = await _dataSource.signInGoogle();

      // Eğer user null ise, hata döndürün
      if (user == null) {
        return Result.failure(
          error: AppError(Exception('Google ile giriş başarısız oldu.')),
        );
      }

      // Başarılı giriş durumunda user döndürün
      return Result.guardFuture(
        () async => AppUser.from(user),
      );
    } catch (e) {
      // Hata durumunda, hata mesajı ile birlikte hata döndürün
      return Result.failure(error: AppError(Exception(e)));
    }
  }

  @override
  Future<Result<AppUser?>> signInWithTwitter() async {
    try {
      final user = await _dataSource.signInWithTwitter();
      if (user == null) {
        return Result.failure(
          error: AppError(Exception('Twitter ile giriş başarısız oldu.')),
        );
      }
      return Result.guardFuture(
        () async => AppUser.from(user),
      );
    } catch (e) {
      return Result.failure(error: AppError(Exception(e)));
    }
  }

  @override
  Future<Result<AppUser?>> signInApple() async {
    try {
      final user = await _dataSource.signInApple();
      if (user == null) {
        return Result.failure(
          error: AppError(Exception('Apple ile giriş başarısız oldu.')),
        );
      }
      return Result.guardFuture(
        () async => AppUser.from(user),
      );
    } catch (e) {
      return Result.failure(error: AppError(Exception(e)));
    }
  }

  @override
  Future<Result<AppUser?>> signInWithFacebook() async {
    try {
      final user = await _dataSource.signInWithFacebook();
      if (user == null) {
        return Result.failure(
          error: AppError(Exception('Facebook ile giriş başarısız oldu.')),
        );
      }
      return Result.guardFuture(
        () async => AppUser.from(user),
      );
    } catch (e) {
      return Result.failure(error: AppError(Exception(e)));
    }
  }

  @override
  Future<Result<AppUser>> validatePhone(
    String code,
    String? verficationId,
  ) {
    return Result.guardFuture(
      () async =>
          AppUser.from(await _dataSource.validatePhone(code, verficationId)),
    );
  }

  @override
  Future<Result<AppUser>> validateEmail(
    String email,
    String password,
    bool isLogin,
  ) {
    return Result.guardFuture(
      () async => AppUser.from(
        await _dataSource.validateEmail(email, password, isLogin),
      ),
    );
  }

  @override
  Future<Result<AppUser>> sendOtp(
    VoidCallback? onCodeSent,
    void Function(String)? onMessage,
    void Function(String)? onError,
    VoidCallback? onCompleted,
  ) {
    return Result.guardFuture(
      () async => AppUser.from(
        await _dataSource.sendOtp(onCodeSent, onMessage, onError, onCompleted),
      ),
    );
  }

  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_dataSource.signOut);
  }
}
