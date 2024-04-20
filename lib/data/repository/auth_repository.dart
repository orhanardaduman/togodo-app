import 'package:flutter/material.dart';
import 'package:togodo/data/local/app_user.dart';
import 'package:togodo/data/model/result.dart';

abstract class AuthRepository {
  Future<Result<AppUser?>> signInGoogle();
  Future<Result<AppUser?>> signInApple();
  Future<Result<AppUser?>> signInWithTwitter();
  Future<Result<AppUser?>> signInWithFacebook();
  Future<Result<AppUser>> validatePhone(
    String code,
    String? verficationId,
  );
  Future<Result<AppUser>> validateEmail(
    String email,
    String password,
    bool isSignIn,
  );
  Future<Result<AppUser>> sendOtp(
    VoidCallback? onCodeSent,
    void Function(String)? onMessage,
    void Function(String)? onError,
    VoidCallback? onCompleted,
  );
  Future<Result<void>> signOut();
}
