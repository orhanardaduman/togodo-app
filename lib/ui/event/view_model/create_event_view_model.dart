// ignore_for_file: avoid_dynamic_calls, cascade_invocations, avoid_positional_boolean_parameters

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:togodo/core/constants/constants.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/data/model/event/concept_image_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/event/ready_template_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';

import '../../../data/model/profil/user_search_with_events.dart';

part 'create_event_view_model.freezed.dart';

@freezed
class SelectedAssetsModel with _$SelectedAssetsModel {
  const factory SelectedAssetsModel({
    int? index,
    String? networkImage,
    File? localImage,
  }) = _SelectedAssetsModel;
}

@freezed
class CreateEventState with _$CreateEventState {
  const factory CreateEventState({
    @Default(false) bool loading,
    @Default('') String name,
    @Default([]) List<TagsModel>? tagList,
    @Default([]) List<SelectedAssetsModel>? selectedAssetsAll,
    @Default([]) List<int>? nullImage,
    @Default(false) bool isLicense,
    @Default(true) bool isJoinUserLimited,
    @Default(true) bool isFree,
    @Default(false) bool isContract,
    @Default(null) File? image,
    @Default(0.3333) double progress,
    @Default(0) int step,
    @Default(null) DateTime? selectedStartDate,
    @Default(null) List<ConceptImageModel>? networkImg,
    @Default(null) Users? otherUserModel,
    @Default(null) String? url,
  }) = _CreateEventState;
}

final createEventModelProvider =
    StateNotifierProvider.autoDispose<CreateEventViewModel, CreateEventState>(
  CreateEventViewModel.new,
);

class CreateEventViewModel extends StateNotifier<CreateEventState> {
  CreateEventViewModel(this._ref)
      : super(
          const CreateEventState(),
        ) {
    setupUserController();
  }

  final Ref _ref;
  TextEditingController eventNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController eventController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);

  DateTime? selectedDate;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  bool isDraft = false;
  bool isUpdates = false;
  String? address;
  String? Latitude;
  String? Longitude;
  List<int> numberList = [];
  List<int> newIndexList = [];
  LatLng? initLocation;
  String? draftId;

  void setupUserController() {
    // Kontrolcüye bir listener ekleyin
    userController.addListener(() {
      // Eğer metin alanı boş değilse, 'isJoinUserLimited' değerini 'false' yapın
      if (userController.text.isNotEmpty) {
        state = state.copyWith(isJoinUserLimited: false);
      }
    });
    eventController.addListener(() {
      // Eğer metin alanı boş değilse, 'isJoinUserLimited' değerini 'false' yapın
      if (eventController.text.isNotEmpty) {
        state = state.copyWith(isFree: false);
      }
    });
  }

  void setNetworkImageIsClick(String index) {
    state = state.copyWith(
      networkImg: state.networkImg!.map((e) {
        if (e.downloadUrl == index) {
          return e.copyWith(isClick: true);
        } else {
          return e.copyWith(isClick: false);
        }
      }).toList(),
    );
  }

  void setNetworkImage(String index) {
    state = state.copyWith(
      networkImg: state.networkImg!.map((e) {
        if (e.downloadUrl == index) {
          return e.copyWith(isSelected: !(e.isSelected ?? false));
        }
        return e;
      }).toList(),
    );
  }

  Future<void> setConceptImage(int tagId) async {
    final result = await _repository.getTagImages(tagId: tagId);
    if (result.isSuccess) {
      state = state.copyWith(
        networkImg: result.dataOrThrow,
      );
    }
  }

  void updateIndex(int oldIndex, int newIndex) {
    // İlk olarak, oldIndex ve newIndex'in geçerli aralıkta olup olmadığını kontrol edin
    if (oldIndex < 0 ||
        oldIndex >= state.selectedAssetsAll!.length ||
        newIndex < 0 ||
        newIndex >= state.selectedAssetsAll!.length) {
      // Eğer indekslerden herhangi biri geçerli aralıkta değilse, işlemi atlayın
      return;
    }

    // Güncelleme işlemine devam edin
    final updatedList =
        List<SelectedAssetsModel>.from(state.selectedAssetsAll!);

    // Eski ve yeni indeksleri kullanarak öğelerin yerini değiştirin
    final temp = updatedList[oldIndex];
    updatedList[oldIndex] = updatedList[newIndex];
    updatedList[newIndex] = temp;

    // Güncellenmiş listeyi kullanarak her öğenin index'ini güncelleyin
    for (var i = 0; i < updatedList.length; i++) {
      updatedList[i] = updatedList[i].copyWith(index: i);
    }

    // Son olarak, state'i güncellenmiş liste ile güncelleyin
    state = state.copyWith(selectedAssetsAll: updatedList);
  }

  Future<void> initReadyTemplate(ReadyTemplateModel data) async {
    eventNameController.text = data.title ?? '';
    descController.text = data.description ?? '';
    if (data.tags != null) {
      // data.tags listesini ve her bir TagsModel'in subTags listesini birleştir
      final allTags =
          data.tags!.expand((tag) => [tag, ...?tag.subTags]).toList();
      // allTags şimdi data.tags ve onların subTags'lerini içerir
      state = state.copyWith(
        tagList: allTags,
        selectedAssetsAll: [
          SelectedAssetsModel(
            networkImage: data.images!.first.downloadUrl,
            index: 0,
          ),
        ],
        loading: false,
      );
    }
  }

  void clearTag(TagsModel tag) {
    state = state.copyWith(
      tagList: state.tagList!.where((element) => element.id != tag.id).toList(),
    );
  }

  Future<void> initDraftData(String eventId, {bool isUpdate = false}) async {
    isDraft = true;
    isUpdates = isUpdate;
    draftId = eventId;
    state = state.copyWith(loading: true);
    await _repository
        .getEventDetails(
      eventId: eventId,
    )
        .then((value) {
      value.ifSuccess((data) async {
        eventNameController.text = data.name ?? '';
        descController.text = data.description ?? '';
        dateController.text = data.date ?? '';
        startDateController.text = data.startTime ?? '';
        endDateController.text = data.endTime ?? '';
        if (!data.isParticipants!) {
          userController.text = data.participantsLimit.toString();
        }
        if (!data.isPrice!) eventController.text = data.price.toString();
        initLocation = LatLng(
          double.parse(data.latitude!),
          double.parse(data.longitude!),
        );
        updateLocation(
          GeocodingResult(
            formattedAddress: data.location,
            geometry: Geometry(
              location: Location(
                lat: double.parse(data.latitude!),
                lng: double.parse(data.longitude!),
              ),
            ),
            placeId: '',
          ),
        );
        state = state.copyWith(
          tagList: data.tags,
          selectedAssetsAll: data.images!
              .map(
                (e) => SelectedAssetsModel(
                  networkImage: e.downloadUrl,
                  index: e.number,
                ),
              )
              .toList(),
          isJoinUserLimited: data.isParticipants ?? false,
          isFree: data.isPrice ?? false,
          isContract: data.isContract ?? false,
          loading: false,
        );
      });
    });
  }

  Future<EventModel?> post({bool isPublish = true}) async {
    updateLoading(true);
    final dio = _ref.read(dioProvider);
    final multipartFiles = <MultipartFile>[];
    final indexList = <int>[];
    for (final file in state.selectedAssetsAll!
        .where((element) => element.localImage != null)
        .toList()) {
      final fileName = file.localImage!.path.split('/').last;
      final multipartFile = await MultipartFile.fromFile(
        file.localImage!.path,
        filename: fileName,
      );
      indexList.add(file.index!);
      multipartFiles.add(multipartFile);
    }
    try {
      final listNetworkImage = state.selectedAssetsAll!
          .where((element) => element.networkImage != null)
          .toList();
      final imageIndex = listNetworkImage.map((e) => e.index).toList();
      final imageUrl = listNetworkImage.map((e) => e.networkImage).toList();
      final formData = FormData.fromMap({
        'name': eventNameController.text,
        'id': draftId,
        'description': descController.text,
        'location': locationController.text,
        'draftId': draftId,
        'address': address,
        'latitude': Latitude,
        'longitude': Longitude,
        'date': dateController.text,
        'isContract': state.isContract,
        'startTime': startDateController.text,
        'endTime': endDateController.text,
        'isParticipants': state.isJoinUserLimited,
        'participantsLimit':
            userController.text.isEmpty ? null : int.parse(userController.text),
        'isPrice': state.isFree,
        'price': eventController.text,
        'isPublish':
            isPublish.toString(), // Eğer taslak olarak kayıt edilecek ise false
        'tagId': state.tagList!.map((e) => e.id).toList(),
        'formFiles': multipartFiles,
        'index': indexList,
        'imageUrl': imageUrl,
        'imageIndex': imageIndex,
        'otherUserId': state.otherUserModel?.id ?? '',
        'link': linkController.text,
      });

      print("other user id ${state.otherUserModel?.id ?? 'yok'}");
      print("other user id publish mi ${isPublish}");

      final response = isUpdates
          ? await dio.put<Map<String, dynamic>>(
              ApiEndpoint.auth(
                AuthEndpoint.UPDATE_EVENT,
              ),
              data: formData,
            )
          : await dio.post<Map<String, dynamic>>(
              ApiEndpoint.auth(
                AuthEndpoint.CREATE_EVENT,
              ),
              data: formData,
            );
      dio.options = BaseOptions(
        baseUrl: Constants.of().endpoint,
        contentType: 'application/json',
        connectTimeout: const Duration(milliseconds: 220000),
        sendTimeout: const Duration(milliseconds: 220000),
        receiveTimeout: const Duration(milliseconds: 220000),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        updateLoading(false);
        if (response.data != null) {
          try {
            return EventModel.fromJson(
              response.data!,
            );
          } catch (e) {
            print("error deneme ${e}");
          }
        } else {
          // response.data['data'] null veya Map<String, dynamic> türünde değil.
          // Burada uygun bir hata işleme veya alternatif bir işlem yapabilirsiniz.
          throw Exception('Veri alınamadı veya veri formatı yanlış.');
        }
      } else {
        updateLoading(false);

        return null;
      }
    } catch (e) {
      dio.options = BaseOptions(
        baseUrl: Constants.of().endpoint,
        contentType: 'application/json',
        connectTimeout: const Duration(milliseconds: 220000),
        sendTimeout: const Duration(milliseconds: 220000),
        receiveTimeout: const Duration(milliseconds: 220000),
      );
      print(e);
      updateLoading(false);

      return null;
    }
  }

  void updateLocation(GeocodingResult? p0) {
    locationController.text = p0!.formattedAddress ?? '';
    address = p0.formattedAddress;
    Latitude = p0.geometry.location.lat.toString();
    Longitude = p0.geometry.location.lng.toString();
  }

  void changeJoinUser() {
    state = state.copyWith(isJoinUserLimited: !state.isJoinUserLimited);
    userController.clear();
  }

  void changeFree() {
    state = state.copyWith(isFree: !state.isFree);
    eventController.clear();
  }

  void changeContracy() {
    state = state.copyWith(isContract: !state.isContract);
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void updateTag(List<TagsModel> value) {
    state = state.copyWith(tagList: value);
  }

  void updateImage(File? value) {
    state = state.copyWith(image: value);
  }

  void updateSelectedPerson(Users user) {
    state = state.copyWith(otherUserModel: user);
  }

  void setStartDate() {
    startDateController.text = selectedStartDate == null
        ? DateTime.now().add(const Duration(hours: 1)).formattedTime
        : selectedStartDate!.formattedTime;
    state = state.copyWith(
      selectedStartDate:
          selectedStartDate ?? DateTime.now().add(const Duration(hours: 1)),
    );
  }

  List<int> getRemainingIndexesAll() {
    final myIndex = <int>[0, 1, 2, 3, 4];

    if (state.selectedAssetsAll != null &&
        state.selectedAssetsAll!.isNotEmpty) {
      // Null olmayan number değerleri alıp Set'e çevir
      final numbersInImageUrl = state.selectedAssetsAll!
          .map((img) => img.index) // Burada null veya int değerler olabilir
          .where((number) => number != null) // Sadece null olmayanları al
          .toSet() // Set<int> dönüştür
          .cast<int>(); // Set<int?>'dan Set<int>'e dönüşüm yap

      // myIndex listesinden, numbersInImageUrl set'inde bulunanları çıkar
      myIndex.removeWhere(numbersInImageUrl.contains);
    }

    return myIndex;
  }

  Future<void> setMediaList(List<AssetEntity> file) async {
    final list = <SelectedAssetsModel>[];
    for (var i = 0; i < file.length; i++) {
      final control = getRemainingIndexesAll();

      list.add(
        SelectedAssetsModel(
          index: control[i],
          localImage: await file[i].file,
          /* width: element.width,
          height: element.height, */
        ),
      );
    }
    state = state.copyWith(
      selectedAssetsAll: state.selectedAssetsAll == null
          ? list
          : [
              ...state.selectedAssetsAll!, // Mevcut öğeleri koru
              ...list, // Yeni öğeleri ekle
            ],
    );
  }

  void selectAllAssets({
    required bool isNetwork,
    String? url,
    List<AssetEntity>? file,
  }) {
    final control = getRemainingIndexesAll();
    if (control.isNotEmpty && isNetwork == true) {
      state = state.copyWith(
        selectedAssetsAll: state.selectedAssetsAll == null
            ? [
                SelectedAssetsModel(
                  networkImage: url,
                  index: control[0],
                ),
              ]
            : [
                ...state.selectedAssetsAll!,
                SelectedAssetsModel(
                  networkImage: url,
                  index: control[0],
                ),
              ],
      );
    } else {
      setMediaList(file!);
    }
  }

  void removeAssetsModel(String networkUrl) {
    // İlk olarak, kaldırılacak öğenin mevcut indeksini bulun
    final removeIndex = state.selectedAssetsAll
        ?.indexWhere((element) => element.networkImage == networkUrl);

    // Eğer öğe bulunamazsa, fonksiyonu sonlandır
    if (removeIndex == null || removeIndex == -1) {
      return;
    }

    // URL'ye göre öğeyi kaldırın
    final newImageUrlList = state.selectedAssetsAll!
        .where((element) => element.networkImage != networkUrl)
        .toList();

    // Kaldırılan öğeden daha büyük indekslere sahip öğelerin indekslerini güncelleyin
    final updatedList = newImageUrlList.map((element) {
      if (element.index != null && element.index! > removeIndex) {
        return element.copyWith(index: element.index! - 1);
      }
      return element;
    }).toList();

    // State'i güncellenmiş liste ile güncelleyin
    state = state.copyWith(selectedAssetsAll: updatedList);
  }

  void removeAssetsIndex(int index) {
    final newImageUrlList = state.selectedAssetsAll!
        .where((element) => element.index != index)
        .toList();
    final img = state.selectedAssetsAll!
        .firstWhere(
          (element) => element.index == index,
        )
        .networkImage;
    if (img != null) {
      unCheckNetworkImage(
        img,
      );
    }
    final updatedList = newImageUrlList.map((element) {
      if (element.index != null && element.index! > index) {
        return element.copyWith(index: element.index! - 1);
      }
      return element;
    }).toList();
    state = state.copyWith(
      selectedAssetsAll: updatedList,
    );
  }

  void unCheckNetworkImage(String index) {
    final newImageUrlList = state.networkImg!.map((element) {
      if (element.downloadUrl == index) {
        return element.copyWith(isSelected: false);
      }
      return element;
    }).toList();
    state = state.copyWith(
      networkImg: newImageUrlList,
    );
  }

  void setEndDate() {
    endDateController.text = selectedEndDate == null
        ? DateTime.now().add(const Duration(hours: 3)).formattedTime
        : selectedEndDate!.formattedTime;
  }

  void setDate() {
    dateController.text = selectedDate == null
        ? DateTime.now().toIso8601String().substring(0, 10)
        : selectedDate.toString().substring(0, 10);
  }

  void incrementProgress() {
    const incrementValue = 1.0 / 3;
    state = state.copyWith(
      progress: state.progress + incrementValue,
      step: state.step + 1,
    );
  }

  void initStep(int step) {
    state = state.copyWith(
      progress: 0.3333 * step,
      step: step,
    );
  }

  void incrementBackProgress() {
    const decrementValue = 1.0 / 3;
    state = state.copyWith(
      progress: state.progress - decrementValue,
      step: state.step - 1,
    );

    if (state.progress < 0.3333) {
      state = state.copyWith(progress: 0.3333, step: 0);
    }
  }

  @override
  void dispose() {
    eventNameController.dispose();
    locationController.dispose();
    descController.dispose();
    dateController.dispose();
    selectedDate = null;
    selectedStartDate = null;
    selectedEndDate = null;
    isDraft = false;
    startDateController.dispose();
    endDateController.dispose();
    userController.dispose();
    eventController.dispose();
    isUpdates = false;
    draftId = null;
    super.dispose();
  }
}

extension CustomDateTimeExtension on DateTime {
  String get formattedTime {
    // Saat ve dakika bilgisini alıp formatlayarak döndürün
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

extension AddressParsing on String {
  String get parsedDistrictAndCity {
    // Posta kodunu bul ve atla
    final postalCodeRegex = RegExp(r'\b\d{5}\b');
    final addressWithoutPostalCode = replaceFirst(postalCodeRegex, '').trim();

    // Virgül ile böl ve ilçe ile il bilgilerini al
    final parts = addressWithoutPostalCode.split(', ');
    final districtAndCity = parts[parts.length - 2];

    final districtAndCityParts = districtAndCity.split('/');
    final district = districtAndCityParts[0].trim();
    final city =
        districtAndCityParts.length > 1 ? districtAndCityParts[1].trim() : '';

    return '$district, $city';
  }
}
