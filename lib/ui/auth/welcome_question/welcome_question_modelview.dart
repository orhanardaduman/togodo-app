// ignore_for_file: avoid_dynamic_calls, cascade_invocations

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/core/network/firebase/firebase_collections.dart';
import 'package:togodo/data/model/auth/firebase_login_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';

part 'welcome_question_modelview.freezed.dart';

@freezed
class WelcomeQuestionState with _$WelcomeQuestionState {
  const factory WelcomeQuestionState({
    @Default(false) bool loading,
    @Default(false) bool isButtonEnabled,
    @Default('') String name,
    @Default([]) List<TagsModel?> hobyList,
    @Default(false) bool isLicense,
    @Default(false) bool isCommunity,
    @Default(null) File? image,
    @Default(null) String? imageUrl,
  }) = _WelcomeQuestionState;
}

final welcomeQuestionModelProvider =
    StateNotifierProvider<WelcomeQuestionModel, WelcomeQuestionState>(
  WelcomeQuestionModel.new,
);

class WelcomeQuestionModel extends StateNotifier<WelcomeQuestionState> {
  WelcomeQuestionModel(this._ref)
      : super(
          const WelcomeQuestionState(),
        ) {
    nameController.addListener(_updateButtonState);
    surnameController.addListener(_updateButtonState);
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  final Ref _ref;
  bool _isDisposed = false;
  void _updateButtonState() {
    // Butonun durumunu güncelleyin
    final isNameEmpty = nameController.text.isEmpty;
    final isSurnameEmpty = surnameController.text.isEmpty;
    final newState =
        state.isCommunity ? !isNameEmpty : (!isNameEmpty && !isSurnameEmpty);

    if (newState != state.isButtonEnabled) {
      state = state.copyWith(isButtonEnabled: newState);
    }
  }

  Future<void> init() async {
    final authType = await CacheItems.signType.readSecureData();

    if (authType == 'authButton') {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user.displayName != null) {
          final nameParts = user.displayName!.split(' ');
          if (nameParts.length >= 2) {
            nameController.text = nameParts[0];
            surnameController.text = nameParts.sublist(1).join(' ');
          } else if (nameParts.length == 1) {
            nameController.text = nameParts[0];
            surnameController.text = '';
          }
          state = state.copyWith(imageUrl: user.photoURL);
        }
      } else {}
    } else {
      final userViewModel = _ref.read(userViewModelProvider);

      nameController.text = userViewModel.nameController.text;
      surnameController.text = userViewModel.surnameController.text;
    }
  }

  void updateImage(File? value) {
    state = state.copyWith(image: value, imageUrl: null);
  }

  void changeCommunity({required bool value}) {
    state = state.copyWith(
      isCommunity: value,
    );
  }

  Future<bool> firebaseLogin(FirebaseLoginModel requestModel) async {
    updateLoading(true);
    final dio = _ref.read(dioProvider);
    final userViewModel = _ref.read(userViewModelProvider);
    final authType = await CacheItems.signType.readSecureData();
    final type = authType == 'authButton'
        ? (state.isCommunity ? 1 : 0)
        : userViewModel.isCommunity
            ? 1
            : 0;
    final files = state.image != null
        ? await MultipartFile.fromFile(
            state.image!.path,
            filename: state.image!.path.split('/').last,
          )
        : null;
    try {
      log(requestModel.idToken!);
      final formData = FormData.fromMap({
        'idToken': requestModel.idToken,
        'deviceId': requestModel.deviceId,
        'name': nameController.text,
        'surname': type == 0 ? surnameController.text : null,
        'email': requestModel.email,
        'imageUrl': state.imageUrl,
        'type': type,
        'phoneNumber': requestModel.phoneNumber,
        'tagId': state.hobyList.map((e) => e!.id).toList(),
        'formFile': files,
      });

      final response = await dio.post<Map<String, dynamic>>(
        ApiEndpoint.auth(AuthEndpoint.LOGIN),
        data: formData,
      );

      if (response.statusCode == 200) {
        await setUserSettings();
        log(response.data!['token']['accessToken'] as String);
        await CacheItems.token.writeSecureData(
          response.data!['token']['accessToken'] as String,
        );
        userViewModel.accessTokens =
            response.data!['token']['accessToken'] as String;
        updateLoading(false);

        return true;
      } else {
        updateLoading(false);

        return false;
      }
    } catch (e) {
      updateLoading(true);

      return false;
    }
  }

  Future<void> setUserSettings() async {
    if (_isDisposed) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get a reference to the userSettings collection
      final userSettings = FirebaseCollections.userSettings.referance;
      var loginType = '';
      for (final userInfo in user.providerData) {
        if (userInfo.providerId == 'google.com') {
          loginType = 'Google';
          break; // Google sağlayıcısı bulunduğunda döngüyü kır.
        } else if (userInfo.providerId == 'apple.com') {
          loginType = 'Apple';
          break; // Apple sağlayıcısı bulunduğunda döngüyü kır.
        }
        // Diğer sağlayıcılar için benzer ifadeler eklenebilir.
      }
      // Set the document with ID of user's UID
      await userSettings.doc(user.uid).set({
        // Add the isWelcomePage field
        'isWelcomePage': true,
        'userName': user.email ?? '',
        'phone': user.phoneNumber ?? '',
        'signUpDate': DateTime.now(),
        'deviceType': Platform.operatingSystem,
        'loginType': loginType,
        'enableShowcase': true,
      });
    }
  }

  // ignore: avoid_positional_boolean_parameters
  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void updateHoby(List<TagsModel?> value) {
    state = state.copyWith(hobyList: value);
  }

  void clear() {
    nameController.clear();
    surnameController.clear();
    state = state.copyWith(image: null, imageUrl: null);
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    _isDisposed = true;
    super.dispose();
  }
}
