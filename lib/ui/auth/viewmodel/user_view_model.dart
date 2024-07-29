// ignore_for_file: void_checks, avoid_bool_literals_in_conditional_expressions

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/constants/constants.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/core/network/firebase/firebase_collections.dart';
import 'package:togodo/data/local/app_user.dart';
import 'package:togodo/data/local/token_model.dart';
import 'package:togodo/data/repository/auth_repository.dart';
import 'package:togodo/data/repository/auth_repository_impl.dart';
import 'package:togodo/ui/auth/welcome_question/welcome_question_modelview.dart';
import 'package:togodo/ui/chat/services/connect_services.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/loading_state_view_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

final userViewModelProvider = ChangeNotifierProvider(UserViewModel.new);

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._ref);

  final ChangeNotifierProviderRef<Object?> _ref;

  late final AuthRepository _repository = _ref.read(authRepositoryProvider);

  AppUser? _user;
  String? accessTokens;
  TokenModel? _tokenModel;
  // 1 futbolcu 2 taraftar 3 antrenör
  int? userTypes;
  String? userIds;
  String? userNames;
  String? profileImageUrls;
  AppUser? get user => _user;
  TokenModel? get tokenModel => _tokenModel;
  String? get accessToken => accessTokens;
  int? get userType => userTypes;
  String? get userId => userIds;
  String? get userName => userNames;
  String? get profileImageUrl => profileImageUrls;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  bool isEmail = false;
  bool isCommunity = false;
  bool isVisible = false;
  String? emailTemp;

  bool get isAuthenticated => _user != null;
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;
  final bool _isDisposed = false;
  Future<bool> signInWithGoogle() {
    if (_isDisposed) {
      return Future.value(false);
    }
    return _repository.signInGoogle().then((result) {
      result.ifSuccess((data) async {
        _user = data;
        await CacheItems.signType.writeSecureData('authButton');
        _ref
            .read(userTypeStateNotifierProvider.notifier)
            .setUserType(UserType.user);
        profileImageUrls = _user!.imageUrl;
        notifyListeners();
      });
      return result.isSuccess;
    });
  }

  Future<bool> validateEmailFn(
      String email, String password, bool isLogin) async {
    return _repository.validateEmail(email, password, isLogin).then((result) {
      try {
        result.ifSuccess((data) async {
          emailTemp = data.email;
          _user = data;
          await CacheItems.signType.writeSecureData('authOtp');
          notifyListeners();
        });
        return result.isSuccess;
      } catch (e) {
        return false;
      }
    });
  }

  void changeCommunity() {
    isCommunity = !isCommunity;
    surnameController.clear();
    notifyListeners();
  }

  void changeEmail() {
    isEmail = !isEmail;
    emailController.clear();
    passwordAgainController.clear();
    passwordController.clear();
    phoneController.clear();
    notifyListeners();
  }

  Future<bool> signInWithTwitter() {
    if (_isDisposed) {
      return Future.value(false);
    }
    return _repository.signInWithTwitter().then((result) {
      result.ifSuccess((data) async {
        _user = data;
        _ref
            .read(userTypeStateNotifierProvider.notifier)
            .setUserType(UserType.user);

        await CacheItems.signType.writeSecureData('authButton');
        profileImageUrls = _user!.imageUrl;
        notifyListeners();
      });
      return result.isSuccess;
    });
  }

  Future<bool> signInWithFacebook() async {
    if (_isDisposed) {
      return Future.value(false);
    }
    return _repository.signInWithFacebook().then((result) {
      result.ifSuccess((data) async {
        _user = data;
        _ref
            .read(userTypeStateNotifierProvider.notifier)
            .setUserType(UserType.user);
        await CacheItems.signType.writeSecureData('authButton');
        profileImageUrls = _user!.imageUrl;
        notifyListeners();
      });
      return result.isSuccess;
    });
  }

  Future<bool> signInWithApple() async {
    if (_isDisposed) {
      return Future.value(false);
    }
    return _repository.signInApple().then((result) {
      result.ifSuccess((data) async {
        _user = data;
        _ref
            .read(userTypeStateNotifierProvider.notifier)
            .setUserType(UserType.user);
        await CacheItems.signType.writeSecureData('authButton');
        profileImageUrls = _user!.imageUrl;
        notifyListeners();
      });
      return result.isSuccess;
    });
  }

  Future<dynamic> signOut() async {
    if (_isDisposed) {
      return Future.value(false);
    }

    return _repository.signOut().then((result) {
      return result.when(
        success: (_) async {
          clear();
          await _ref.read(profilViewModelProvider(null).notifier).logout();
          notifyListeners();
          return null;
        },
        failure: (_) => result,
      );
    });
  }

  void setIsUserType(int val) {
    userTypes = val;
    notifyListeners();
  }

  Future<bool> tokenCheck() async {
    final firebaseMessaging = FirebaseMessaging.instance;
    final webSocketService = WebSocketService.instance;

    final deviceId = await firebaseMessaging.getToken();
    final dio = _ref.read(dioProvider);
    try {
      final firebase = FirebaseAuth.instance.currentUser;

      final tokenOld = await CacheItems.token.readSecureData();

      if (firebase != null || tokenOld != null) {
        var token = '';
        if (firebase != null) {
          token = await firebase.getIdToken() ?? '';
        } else {
          token = tokenOld ?? '';
        }
        print('burda tokenr: $token');
        log('deviceId: $deviceId');
        final formData = FormData.fromMap({
          'deviceId': deviceId,
          'idToken': token,
          'isFirebase': firebase != null,
        });

        final response = await dio.post<Map<String, dynamic>>(
          ApiEndpoint.auth(AuthEndpoint.LOGIN),
          data: formData,
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          // ignore: avoid_dynamic_calls
          print("data ${response.data}");
          var deneme = Token.fromJson(
            response.data!,
          );
          print("token model deneme ${deneme}");

          _tokenModel = TokenModel.fromJson(
            response.data!,
          );
          print("token model ${_tokenModel}");

          accessTokens = _tokenModel?.token?.accessToken;
          print("acesstokens ${accessTokens}");

          userIds = response.data!['userId'] as String;
          profileImageUrls = response.data?['profileImageUrl'] ?? '';
          print("userids ${userIds}");
          print("profileimageirls ${profileImageUrls}");

          await CacheItems.token.writeSecureData(accessTokens!);
          await CacheItems.firebaseId.writeSecureData(
            _tokenModel?.token?.firebaseUid ?? '',
          );

          await CacheItems.users.writeSecureDataList(
            _tokenModel?.token?.firebaseUid ?? '',
          );

          await CacheItems.uid.writeSecureData(userIds!);
          //await webSocketService.connect(accessTokens!);
          notifyListeners();

          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print('burda catch: $e');
      await signOut();
      return false;
    }
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String phone) {
    _phone = phone;
    resendToken = null;
    notifyListeners();
  }

  String? verficationId;

  int? resendToken;

  late Stream<int> stream;

  Stream<int> get _stream => Stream.periodic(
        const Duration(seconds: 1),
        (i) => 60 - i,
      );

  void startStream() {
    stream = _stream;
    notifyListeners();
  }

  void sendOtp({
    VoidCallback? onCodeSent,
    void Function(String)? onMessage,
    void Function(String)? onError,
    VoidCallback? onCompleted,
  }) {
    try {
      final loading = _ref.read(loadingStateProvider)..toLoading();
      _auth.verifyPhoneNumber(
        forceResendingToken: resendToken,
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          loading.toLoading();

          try {
            await _auth.signInWithCredential(phoneAuthCredential);
            onCompleted!();
          } on firebase.FirebaseAuthException catch (e) {
            onError!(e.message ?? e.code);
          }
          loading.toIdle();
        },
        verificationFailed: (error) {
          debugPrint('$error');
          loading.toIdle();

          onError!(error.message ?? error.code);
        },
        codeSent: (id, forceResendingToken) {
          verficationId = id;
          if (resendToken != null) {
            onMessage!('Code resent!');
            notifyListeners();
          }

          stream = _stream;
          notifyListeners();
          resendToken = forceResendingToken;
          loading.toIdle();

          onCodeSent!();
        },
        timeout: Duration(seconds: 0),
        codeAutoRetrievalTimeout: (verificationId) {
          loading.toIdle();
        },
      );
    } catch (e) {
      onError!('Something error!');
    }
  }

  Future<bool> registerEmail() {
    if (_isDisposed) {
      return Future.value(false);
    }
    return _repository.signInGoogle().then((result) {
      result.ifSuccess((data) async {
        _user = data;
        await CacheItems.signType.writeSecureData('authButton');
        _ref
            .read(userTypeStateNotifierProvider.notifier)
            .setUserType(UserType.user);
        profileImageUrls = _user!.imageUrl;
        notifyListeners();
      });
      return result.isSuccess;
    });
  }

  void sendOtpForMail({
    VoidCallback? onCodeSent,
    void Function(String)? onMessage,
    void Function(String)? onError,
    VoidCallback? onCompleted,
  }) async {
    final loading = _ref.read(loadingStateProvider)..toLoading();
    try {
      loading.toLoading();
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: '',
      );
      onCompleted!();
      loading.toIdle();
    } on firebase.FirebaseAuthException catch (e) {
      onError!(e.message ?? e.code);
    } catch (e) {
      onError!('Something error!');
    }
  }

  Future<bool> getIsWelcomePage() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        // Get a reference to the userSettings collection
        final docRef = FirebaseCollections.userSettings.referance.doc(user.uid);

        // Fetch the document
        final docSnap = await docRef.get();

        // Get the isWelcomePage field, or false if it doesn't exist
        final bool isWelcomePage = docSnap.get('isWelcomePage') ?? false;

        return isWelcomePage;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkUser() async {
    final dio = Dio();
    try {
      final response = await dio.get<Map<String, dynamic>>(
        Constants.of().endpoint + ApiEndpoint.auth(AuthEndpoint.CHECK_USER),
        queryParameters: {
          'phone': _phone,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> validatePhoneFn(String code) async {
    return _repository.validatePhone(code, verficationId).then((result) {
      result.ifSuccess((data) async {
        _user = data;
        await CacheItems.signType.writeSecureData('authOtp');
        notifyListeners();
      });
      return result.isSuccess;
    });
  }

  void clear() async {
    _ref.read(welcomeQuestionModelProvider.notifier).clear();
    final token = await CacheItems.firebaseId.readSecureData();
    print("------bura-----");
    print(token);
    await CacheItems.users.removeSecureDataList(
      token ?? '',
    );
    await CacheItems.clearAll();

    final webSocketService = WebSocketService.instance;
    webSocketService.close();
    phoneController.clear();
    nameController.clear();
    surnameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordAgainController.clear();
    isCommunity = false;
    profileImageUrls = null;
    userIds = null;
    userNames = null;
    userTypes = null;
    isEmail = false;
    _user = null;
  }

  @override
  void dispose() {
    signOut();
    clear();

    super.dispose();
  }
}
