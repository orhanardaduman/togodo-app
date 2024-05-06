import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animarker/core/ripple_marker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/data/model/event/discovery_map_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/data/repository/create_event_repository.dart';
import 'package:togodo/data/repository/create_event_repository_impl.dart';
import 'package:togodo/features/map/new_map_picker/new_map_picker.dart';
import 'package:togodo/features/provider/tag_provider.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/discover/view/discovery_map.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

part 'discovery_map_view_model.freezed.dart';

final discoveryMapViewModelProvider =
    StateNotifierProvider.autoDispose<DiscoveryMapViewModel, DiscoveryMapState>(
  DiscoveryMapViewModel.new,
);

@freezed
class DiscoveryMapState with _$DiscoveryMapState {
  const factory DiscoveryMapState({
    @Default([]) List<DiscoveryMapModel> data,
    @Default(null) DiscoveryMapModel? selectedMap,
    @Default(0) int pagination,
    @Default(false) bool loading,
    @Default(null) LatLng? currentLatLng,
    @Default(null) String? placeName,
    @Default(null) Map<String, MarkerModel>? additionalMarkers,
    @Default(null) CameraPosition? position,
    @Default(null) Set<Marker>? markers,
    @Default(false) bool hideCard,
  }) = _DiscoveryMapState;
}

class DiscoveryMapViewModel extends StateNotifier<DiscoveryMapState> {
  DiscoveryMapViewModel(
    this._ref,
  ) : super(const DiscoveryMapState());

  bool _isDisposed = false;
  // ignore: unused_field
  final Ref _ref;
  late final CreateEventRepository _repository =
      _ref.read(createEventRepositoryProvider);

  Future<void> fetchDiscoveryMap() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getDiscoverEventsMap(
      city: 'Türkiye',
    );
    if (result.isSuccess) {
      if (_isDisposed) return;
      state = state.copyWith(
        data: result.dataOrThrow,
        pagination: 0,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> updatePosition(
      CameraPosition position, StackRouter router, BuildContext context) async {
    state = state.copyWith(position: position);
    try {
      if (_isDisposed) return;
      final placemarks = await placemarkFromCoordinates(
        position.target.latitude,
        position.target.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        if (state.placeName != null &&
            !state.placeName!.contains('${place.subAdministrativeArea}')) {
          state = state.copyWith(markers: {}, additionalMarkers: {});
          await addAllMarkers(
            router,
            isNewMark: false,
            initCity: '${place.subAdministrativeArea}',
            context: context,
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void setHideCard() {
    state = state.copyWith(hideCard: !state.hideCard);
  }

  void incrementLike(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.data.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(likeStatus: !event.likeStatus!);
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(data: updatedEvents);
  }

  Future<void> addAllMarkers(
    StackRouter router, {
    LatLng? value,
    bool isNewMark = true,
    String? initCity,
    required BuildContext context,
  }) async {
    if (_isDisposed) return;

    var city = initCity;

    if (isNewMark) {
      try {
        final placemarks = await placemarkFromCoordinates(
          value!.latitude,
          value.longitude,
        );

        if (placemarks.isNotEmpty) {
          final place = placemarks[0];
          city = '${place.subAdministrativeArea}';
        }
      } catch (e) {
        log('Adres bilgileri alınamadı: $e');
      }
    }
    final result = await _repository.getDiscoverEventsMap(
      city: city,
    );
    final newMarkers = <String, MarkerModel>{};
    print('data : ${result.dataOrThrow}');
    for (final element in result.dataOrThrow) {
      if (element.tags != null &&
          element.tags!.isNotEmpty &&
          element.latitude != null &&
          element.longitude != null) {
        if (element.tags.ext.isNotNullOrEmpty) {
          newMarkers[element.tags!.first.id.toString()] = MarkerModel(
            LatLng(
              double.parse(element.latitude!),
              double.parse(element.longitude!),
            ),
            element.id!,
          );
        }
      }
    }

    // Mevcut marker'larla birleştirin
    final updatedMarkers =
        Map<String, MarkerModel>.from(state.additionalMarkers ?? {})
          ..addAll(newMarkers);
    final newMarkerList = <Marker>{};
    final currentLocationIcon = await createCustomMarkerIconFromNetwork(
      _ref.read(userViewModelProvider).profileImageUrl ?? '',
    );
    final hobyList = _ref
        .watch(hobyStateNotifierProvider(context))
        .where(
          (element) => element.id! > 0 && element.id! < 20,
        )
        .toList();
    for (final entry in updatedMarkers.entries) {
      if (entry.key == 'currentLocation' &&
          entry.value.coordinates != currentLocation) {
        newMarkerList.add(
          RippleMarker(
            anchor: const Offset(0.5, 0.5),
            markerId: MarkerId(entry.key),
            icon: currentLocationIcon,
            position: entry.value.coordinates,
            onTap: () {
              if (kDebugMode) {
                print('Tapped! ');
              }
            },
          ),
        );
      } else {
        final iconPath = findIconPathByEntryKey(hobyList, entry.key);
        if (iconPath != null) {
          newMarkerList.add(
            Marker(
              markerId: MarkerId(entry.key),
              position: entry.value.coordinates,
              onTap: () async {
                await handleMarkerTap(
                  entry.value.id,
                );
              },
              icon: await BubbleWithArrow(
                name: iconPath,
              ).toBitmapDescriptor(
                logicalSize: const Size(350, 350),
                imageSize: const Size(350, 350),
              ),
            ),
          );
        }
      }
    }
    print('markers : ${newMarkerList.toString()}');

    if (_isDisposed) return;

    state = state.copyWith(
      additionalMarkers: updatedMarkers,
      markers: newMarkerList,
    );
  }

  Future<void> handleMarkerTap(String key) async {
    state = state.copyWith(
      selectedMap: state.data.firstWhere((element) => element.id == key),
    );
  }

  String? findIconPathByEntryKey(List<TagsModel> hobyList, String entryKey) {
    try {
      for (final tag in hobyList) {
        // Ana kategoride arama yap
        if (tag.id == int.parse(entryKey)) {
          return tag.iconPath;
        }

        // Alt kategorilerde arama yap
        for (final subTag in tag.subTags ?? []) {
          final tag = subTag as TagsModel;
          if (tag.id == int.parse(entryKey)) {
            return tag.iconPath;
          }
        }
      }
      return null; // Eğer uygun bir değer bulunamazsa null döndür
    } catch (e) {
      return null;
    }
  }

  void setAdditionalMarkers(String tag, MarkerModel latLng) {
    // Mevcut marker'ları koruyup yeni marker'ı ekleyin.
    final updatedMarkers =
        Map<String, MarkerModel>.from(state.additionalMarkers ?? {})
          ..[tag] = latLng;

    // State'i güncellenmiş map ile güncelleyin.
    state = state.copyWith(additionalMarkers: updatedMarkers);
  }

  void setCurrentLocation(MarkerModel latLng) {
    state = state.copyWith(
      currentLatLng: latLng.coordinates,
      additionalMarkers: {
        'currentLocation': latLng,
      },
    );
  }

  Future<LatLng> determinePosition() async {
    loading();
    bool serviceEnabled;
    LocationPermission permission;
    // Servisin etkin olup olmadığını kontrol edin
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Konum servisleri etkin değilse, kullanıcıyı etkinleştirmesi için uyarın
      return currentLocation;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // İzinler reddedilmişse, hata döndürün
        return currentLocation;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // İzinler kalıcı olarak reddedilmişse, ayarlardan izin verilmesi gerektiğini belirtin
      return currentLocation;
    }
    final location = await Geolocator.getCurrentPosition();
    // Mevcut konumu alın
    log('location: $location');

    return LatLng(location.latitude, location.longitude);
  }

  Future<void> getPlace(LatLng position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        state = state.copyWith(
          placeName:
              '${place.subAdministrativeArea}, ${place.administrativeArea}',
        );
        await fetchDiscoveryMap();
      }
    } catch (e) {
      log('Adres bilgileri alınamadı: $e');
    }
  }

  void loading() {
    state = state.copyWith(
      loading: !state.loading,
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

class MarkerModel {
  MarkerModel(this.coordinates, this.id);
  final LatLng coordinates;
  final String id;
}
