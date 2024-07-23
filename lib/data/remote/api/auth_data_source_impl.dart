// ignore_for_file: prefer_asserts_with_message

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/data/provider/firebase_auth_provider.dart';
import 'package:togodo/data/remote/api/auth_data_source.dart';
import 'package:twitter_login/twitter_login.dart';

final authDataSourceProvider = Provider(AuthDataSourceImpl.new);

class AuthDataSourceImpl extends ChangeNotifier implements AuthDataSource {
  AuthDataSourceImpl(this._ref);

  final ProviderRef<dynamic> _ref;

  late final firebase.FirebaseAuth _firebaseAuth =
      _ref.read(firebaseAuthProvider);

  @override
  Future<firebase.User?> signInGoogle() async {
    try {
      final account = await GoogleSignIn().signIn();
      if (account == null) {
        return throw StateError('Maybe user canceled.');
      }
      final auth = await account.authentication;
      final firebase.AuthCredential authCredential =
          firebase.GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      final credential =
          await _firebaseAuth.signInWithCredential(authCredential);
      final currentUser = firebase.FirebaseAuth.instance.currentUser;
      assert(credential.user?.uid == currentUser?.uid);
      return credential.user;
    } catch (e) {
      log('Hata :$e');
      return null;
    }
  }

  @override
  Future<firebase.User?> signInWithTwitter() async {
    try {
      final key = dotenv.env['TWITTER_CLIENT_ID'];
      final twitterLogin = TwitterLogin(
        apiKey: key ?? '',
        apiSecretKey: dotenv.env['TWITTER_CLIENT_SECRET'] ?? '',
        redirectURI: 'twittersdk://',
      );

      final authResult = await twitterLogin.login();
      if (authResult.status == TwitterLoginStatus.loggedIn) {
        final firebase.AuthCredential twitterAuthCredential =
            firebase.TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );

        final userCredential = await firebase.FirebaseAuth.instance
            .signInWithCredential(twitterAuthCredential);
        return userCredential.user;
      } else {
        // Handle other result statuses (e.g., user cancelled, failed, etc.)
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Twitter sign in failed: $e');
      }
      return null;
    }
  }

  @override
  Future<firebase.User?> signInWithFacebook() async {
    try {
      // Trigger the Facebook Login process
      final result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Use `result.accessToken` to make a Facebook Graph API request
        final facebookCredential =
            firebase.FacebookAuthProvider.credential(result.accessToken!.token);

        // Sign in (or link) with the credential
        final userCredential =
            await _firebaseAuth.signInWithCredential(facebookCredential);

        // Return the signed-in (or linked) user
        return userCredential.user;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Facebook sign in failed: $e');
      }
      return null;
    }
  }

  @override
  Future<firebase.User?> signInApple() async {
    try {
      // Apple ile oturum açma işlemini başlat
      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.fullName,
          AppleIDAuthorizationScopes.email,
        ],
      );

      // Apple'ın döndürdüğü e-posta ve tam ad bilgilerini al
      final userName = result.givenName;
      final userSurname = result.familyName;

      // Apple'ın döndürdüğü kimlik bilgilerini kullanarak bir `OAuthCredential` oluştur.
      final credential = firebase.OAuthProvider('apple.com').credential(
        idToken: result.identityToken,
        accessToken: result.authorizationCode,
      );

      // `OAuthCredential` kullanarak Firebase ile oturum aç
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Güvenlik Kontrolü
      assert(userCredential.user?.uid == _firebaseAuth.currentUser?.uid);

      // Kullanıcının displayName'ini güncelle
      if (userName != null && userSurname != null) {
        await userCredential.user!.updateDisplayName('$userName $userSurname');
        await userCredential.user!
            .reload(); // Profil güncellendikten sonra kullanıcıyı yeniden yükle
      }
      // Oturum açma işlemi başarılıysa, oturum açan kullanıcının kimlik bilgilerini döndür
      return userCredential.user;
    } catch (e) {
      log('Apple ile oturum açma işlemi başarısız oldu: $e');
      return null;
    }
  }

  @override
  Future<firebase.User?> validatePhone(
    String code,
    String? verficationId,
  ) async {
    // _loading.start();
    try {
      final creds = firebase.PhoneAuthProvider.credential(
        verificationId: verficationId!,
        smsCode: code,
      );
      final credential = await _firebaseAuth.signInWithCredential(creds);
      final currentUser = firebase.FirebaseAuth.instance.currentUser;
      assert(credential.user?.uid == currentUser?.uid);

      return credential.user;

      // _loading.end();
    } on firebase.FirebaseAuthException catch (e) {
      // _loading.stop();

      return Future.error(e.message ?? e.code);
    }
  }

  @override
  Future<firebase.User?> validateEmail(
    String email,
    String password,
    bool isLogin,
  ) async {
    if (!isLogin) {
      try {
        final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final currentUser = firebase.FirebaseAuth.instance.currentUser;
        assert(credential.user?.uid == currentUser?.uid);

        return credential.user;
      } on firebase.FirebaseAuthException catch (e) {
        return Future.error(e.message ?? e.code);
      }
    } else {
      try {
        final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final currentUser = firebase.FirebaseAuth.instance.currentUser;
        assert(credential.user?.uid == currentUser?.uid);

        return credential.user;
      } on firebase.FirebaseAuthException catch (e) {
        return Future.error(e.message ?? e.code);
      }
    }
  }

  @override
  Future<void> signOut() {
    return GoogleSignIn().signOut().then((_) async {
      /* TODO final token = await CacheItems.firebaseId.readSecureData();
      await CacheItems.users.removeSecureDataList(
        token ?? '',
      );*/
      await CacheItems.clearAll();
      return _firebaseAuth.signOut();
    })
        // ignore: inference_failure_on_untyped_parameter
        .catchError((error) {
      debugPrint(error.toString());
      throw CustomException('$error');
    });
  }

  @override
  Future<firebase.User?> sendOtp(
    VoidCallback? onCodeSent,
    void Function(String p1)? onMessage,
    void Function(String p1)? onError,
    VoidCallback? onCompleted,
  ) {
    throw UnimplementedError();
  }
}

class CustomException implements Exception {
  CustomException(this.description);

  final String description;
  @override
  String toString() {
    return '$this $description';
  }
}
