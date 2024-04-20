import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthDataSource {
  Future<User?> signInGoogle();
  Future<User?> signInWithTwitter();
  Future<User?> signInApple();
  Future<User?> signInWithFacebook();
  Future<User?> validatePhone(
    String code,
    String? verficationId,
  );
  Future<User?> validateEmail(
    String email,
    String password,
    bool isLogin,
  );
  Future<User?> sendOtp(
    VoidCallback? onCodeSent,
    void Function(String)? onMessage,
    void Function(String)? onError,
    VoidCallback? onCompleted,
  );
  Future<void> signOut();
}
