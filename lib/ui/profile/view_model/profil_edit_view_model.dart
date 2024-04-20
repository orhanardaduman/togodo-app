import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:togodo/core/component/input/custom_dropdown.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/data/model/profil/media_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

part 'profil_edit_view_model.freezed.dart';

final profilEditViewModelProvider =
    StateNotifierProvider.autoDispose<ProfilEditViewModel, ProfilEditState>(
  ProfilEditViewModel.new,
);

@freezed
class ProfilEditState with _$ProfilEditState {
  const factory ProfilEditState({
    @Default([]) List<MediaModel?> mediaList,
    @Default([]) List<SocialMedias> socialMediasData,
    @Default(Result.success(data: null)) Result<ProfilModel?>? news,
    @Default(false) bool loading,
    @Default(false) bool putLoading,
    @Default(0) int type,
    @Default(null) DropDownModel? gender,
  }) = _ProfilEditState;
}

class ProfilEditViewModel extends StateNotifier<ProfilEditState> {
  ProfilEditViewModel(this._ref) : super(const ProfilEditState()) {
    _repository = _ref.read(profilRepositoryProvider);
    _fetchProfil();
  }

  final Ref _ref;
  List<Images>? imageUrl;
  DateTime? birthDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List<SocialMedias>? socialMediaController = [];
  List<TextEditingController> socialMediaLinkController = [];
  bool _isDisposed = false;
  // Creating a new, growable list from an existing list
  late final ProfilRepository _repository;

  final picker = ImagePicker();
  final key = GlobalKey<FormState>();
  List<int> numberList = [];
  List<int> newIndexList = [];
  List<TagsModel>? hobyList = [];
  Future<void> getSocialMedias() async {
    if (_isDisposed) return;
    state = state.copyWith(loading: true);
    final result = await _repository.getSocialMedias();
    if (result.isSuccess) {
      if (_isDisposed) return;
      state = state.copyWith(
        socialMediasData: result.dataOrThrow,
        loading: false,
      );
    }
  }

  Future<void> _fetchProfil() async {
    if (_isDisposed) return;

    final data = _ref.read(profilViewModelProvider(null)).profil;
    if (data != null) {
      nameController.text = data.name ?? '';
      descController.text = data.bio ?? '';
      userNameController.text = data.userName ?? '';
      titleController.text = data.title ?? '';
      surNameController.text = data.surname ?? '';
      imageUrl = data.images;
      emailController.text = data.email ?? '';
      locationController.text = data.location ?? '';
      birthDate = DateTime.tryParse(data.birthdayDate ?? '');
      numberList = data.images!.map((e) => e.number!).toList();
      phoneController.text = data.phoneNumber != null
          ? data.phoneNumber!.replaceAll('+90', '')
          : '';
      hobyList = data.tags ?? [];
      state = state.copyWith(
        type: data.type ?? 0,
        gender: data.gender == null
            ? null
            : (data.gender == 0
                ? const DropDownModel(id: 0, name: 'Kadın')
                : data.gender == 1
                    ? const DropDownModel(id: 1, name: 'Erkek')
                    : const DropDownModel(
                        id: 2,
                        name: 'Belirtmek İstemiyorum',
                      )),
      );
      if (data.socialMedias != null) {
        // `List.from` kullanarak yeni bir değiştirilebilir liste oluştur
        for (final element in data.socialMedias!) {
          if (socialMediaController == null || socialMediaController!.isEmpty) {
            socialMediaController = [
              SocialMedias(
                icon: element.icon,
                name: element.name,
                number: element.number,
              ),
            ];
          } else {
            socialMediaController!.add(
              SocialMedias(
                icon: element.icon,
                name: element.name,
                number: element.number,
              ),
            );
          }
        }

        // `map` fonksiyonu ile her bir `socialMedia` öğesi için bir `TextEditingController` oluştur
        socialMediaLinkController = data.socialMedias!.map((e) {
          return TextEditingController(text: e.url);
        }).toList(
          growable: true,
        ); // `toList` metoduna `growable: true` argümanını ekleyin
      }
      await getSocialMedias();
    }
  }

  // ignore: use_setters_to_change_properties
  void changeBirthDate(DateTime val) => birthDate = val;

  void changeGender(DropDownModel? val) {
    state = state.copyWith(gender: val);
  }

  void changeIndexImage(int oldIndex, int newIndex) {
    if (_isDisposed) return;
    // Mevcut medya listesini kopyalayın.
    final newMediaList = List<MediaModel>.from(state.mediaList);

    // Eski indekse sahip olan elemanı bulun.
    final foundIndex =
        newMediaList.indexWhere((element) => element.index == newIndex);

    // Eğer eleman bulunursa, yeni indeks değeri ile güncelleyin.
    if (foundIndex != -1) {
      final foundItem = newMediaList[foundIndex];

      // Eski elemanı yeni indeks değeri ile oluşturun.
      final updatedItem = foundItem.copyWith(index: oldIndex);

      // Yeni elemanı eski elemanın yerine koyun.
      newMediaList[foundIndex] = updatedItem;
    }

    // State'i güncellenmiş medya listesi ile güncelleyin.
    state = state.copyWith(mediaList: newMediaList);
  }

  void changeNewIndex(int oldIndex, int newIndex) {
    if (_isDisposed) return;

    // `numberList`'in bir kopyasını oluşturuyoruz.
    final tempList = List<int>.from(numberList);

    // Önce `tempList` içinde `oldIndex` ve `newIndex`'e denk gelen değerlerin indekslerini buluyoruz.
    final oldIndexPos = tempList.indexOf(oldIndex);
    final newIndexPos = tempList.indexOf(newIndex);

    // Eğer her iki indeks de geçerliyse, yerlerini değiştiriyoruz.
    if (oldIndexPos != -1 && newIndexPos != -1) {
      // Yer değiştirme işlemi
      tempList[oldIndexPos] = newIndex;
      tempList[newIndexPos] = oldIndex;

      // Güncellenmiş `tempList`'i `newIndexList`'e atıyoruz.
      newIndexList = tempList;
    } else {
      // Bulunamazsa bir hata mesajı gösteriyoruz.
      if (kDebugMode) {
        print('One of the indexes was not found in the list');
      }
    }
  }

  Future<void> pickImage(
    int index, {
    bool camera = false,
    BuildContext? context,
  }) async {
    state = state.copyWith(loading: true);
    try {
      if (_isDisposed) return;

      final pickedFile = await picker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
      );
      if (pickedFile!.path.isNotEmpty) {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Kırp',
              toolbarColor: MainColors.primary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
              showCropGrid: false,
              hideBottomControls: true,
            ),
            IOSUiSettings(
              title: 'Kırp',
              rectWidth: 450,
              rectHeight: 450,
              doneButtonTitle: 'Tamam',
              cancelButtonTitle: 'İptal',
              rotateClockwiseButtonHidden: true,
              rotateButtonsHidden: true,
              aspectRatioPickerButtonHidden: true,
            ),
          ],
        );
        state = state.copyWith(
          mediaList: [
            ...state.mediaList,
            MediaModel(url: File(croppedFile!.path), index: index),
          ],
        );
        state = state.copyWith(loading: false);
      } else {
        state = state.copyWith(loading: false);
      }
    } catch (e) {
      state = state.copyWith(loading: false);
      // ignore: use_build_context_synchronously
    }
  }

  void changeIndex(String url, int newIndex) {
    if (_isDisposed) return;
    // Mevcut medya listesini kopyalayın.
    final newMediaList = List<MediaModel?>.from(state.mediaList);

    // Eski indekse sahip olan elemanı bulun.
    final foundIndex =
        newMediaList.indexWhere((element) => element?.url!.path == url);

    // Eğer eleman bulunursa, yeni indeks değeri ile güncelleyin.
    if (foundIndex != -1) {
      final foundItem = newMediaList[foundIndex];

      if (foundItem != null) {
        // Eski elemanı yeni indeks değeri ile oluşturun.
        final updatedItem = foundItem.copyWith(index: newIndex);

        // Yeni elemanı eski elemanın yerine koyun.
        newMediaList[foundIndex] = updatedItem;
      }
    }

    // State'i güncellenmiş medya listesi ile güncelleyin.
    state = state.copyWith(mediaList: newMediaList);
  }

  Future<int?> updateProfil() async {
    state = state.copyWith(putLoading: true);
    final dio = _ref.read(dioProvider);
    try {
      final multipartFiles = <MultipartFile>[];
      final indexList = <int>[];
      for (final file in state.mediaList) {
        final fileName = file!.url!.path.split('/').last;
        final multipartFile = await MultipartFile.fromFile(
          file.url!.path,
          filename: fileName,
        );
        indexList.add(file.index!);
        multipartFiles.add(multipartFile);
      }
      final date = birthDate?.toIso8601String().substring(0, 10);
      // FormData oluştur
      final formData = FormData.fromMap({
        'name': nameController.text,
        'surname': surNameController.text,
        'bio': descController.text,
        'userName': userNameController.text,
        'title': titleController.text,
        'phoneNumber': phoneController.text.isNotEmpty
            ? '+90${phoneController.text}'
            : null,
        'email': emailController.text,
        'birthdayDate': birthDate != null ? date : null,
        'FormFiles': multipartFiles,
        'gender': state.gender?.id,
        'location': locationController.text,
        'index': indexList,
        'numberList': newIndexList.isEmpty ? newIndexList : numberList,
        'newIndexList': newIndexList,
        'tagId':
            hobyList != null ? hobyList!.map((e) => e.id).toList() : List.empty,
        'socialMediaId':
            socialMediaController != null || socialMediaController!.isNotEmpty
                ? socialMediaController!.map((e) => e.number).toList()
                : List.empty,
        'socialMediaLinkOrUsername': socialMediaLinkController.isNotEmpty
            ? socialMediaLinkController.map((e) => e.text).toList()
            : List.empty,
      });

      final response = await dio.put<Map<String, dynamic>>(
        ApiEndpoint.auth(AuthEndpoint.UPDATE_PROFILE),
        data: formData,
      );

      if (response.statusCode == 200) {
        {
          await _ref.read(userViewModelProvider).tokenCheck();
          state = state.copyWith(putLoading: false);

          return response.statusCode;
        }
      } else {
        state = state.copyWith(putLoading: false);
        return response.statusCode;
      }
    } catch (e) {
      state = state.copyWith(putLoading: false);
      return 500;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    userNameController.dispose();
    titleController.dispose();
    surNameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    emailController.dispose();

    socialMediaController = [];
    socialMediaLinkController = [];
    _isDisposed = true;
    state = state.copyWith(
      mediaList: [],
    );
    super.dispose();
  }
}
