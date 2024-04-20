import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/data/model/event/discovery_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/ui/discover/view_model/discover_view_model.dart';

part 'filter_view_model.freezed.dart';

final filterViewModelProvider =
    StateNotifierProvider.autoDispose<FilterViewModel, FilterState>(
  FilterViewModel.new,
);

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    @Default(false) bool isFilter,
    @Default(false) bool isRefresh,
    @Default(false) bool isNotFoundEvents,
    @Default(null) List<TagsModel?>? filterTags,
    @Default(null) List<TagsModel?>? filterTime,
    @Default(0.0) double filterLowerKm,
    @Default(30.0) double filterUpperKm,
    @Default(null) DateTime? filterStartDate,
    @Default(null) DateTime? filterEndDate,
    @Default(null) Prediction? filterLocation,
  }) = _FilterState;
}

class FilterViewModel extends StateNotifier<FilterState> {
  FilterViewModel(
    this._ref,
  ) : super(const FilterState());

  bool _isDisposed = false;
  // ignore: unused_field
  final Ref _ref;
  TextEditingController locationController = TextEditingController();

  void setTimeAround(int type) {
    if (type == 0) {
      state = state.copyWith(
        // 24 hours
        filterStartDate: DateTime.now(),
        filterEndDate: DateTime.now().add(const Duration(hours: 1)),
      );
    } else if (type == 1) {
      state = state.copyWith(
        // 1 week
        filterStartDate: DateTime.now(),
        filterEndDate: DateTime.now().add(const Duration(days: 7)),
      );
    } else if (type == 2) {
      // 1 month
      state = state.copyWith(
        filterStartDate: DateTime.now(),
        filterEndDate: DateTime.now().add(const Duration(days: 30)),
      );
    } else if (type == 3) {
      // 3 month
      state = state.copyWith(
        filterStartDate: DateTime.now(),
        filterEndDate: DateTime.now().add(const Duration(days: 90)),
      );
    }
  }

  void isFilter() {
    state = state.copyWith(
      isFilter: true,
      isRefresh: true,
    );
    Future.delayed(const Duration(seconds: 2), () {
      state = state.copyWith(
        isRefresh: false,
      );
    });
  }

  Future<List<DiscoveryModel>> filterData(List<DiscoveryModel> data) async {
    _ref.read(discoveryViewModelProvider(0).notifier).clearData();
    final filteredDataFutures = data.map((discoveryModel) async {
      return DiscoveryModel(
        popular: await _filterEvents(discoveryModel.popular),
        near: await _filterEvents(discoveryModel.near),
        soon: await _filterEvents(discoveryModel.soon),
      );
    }).toList();

    final filteredData = await Future.wait(filteredDataFutures);

    if (!_isDisposed) {
      state = state.copyWith(
        isRefresh: false,
        isNotFoundEvents: filteredData.every(
          (element) =>
              element.popular!.isEmpty &&
              element.near!.isEmpty &&
              element.soon!.isEmpty,
        ),
      );
    }
    return filteredData;
  }

  Future<Position> getCurrentUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Lokasyon servisinin etkin olup olmadığını kontrol edin
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Kullanıcıya lokasyon servislerini etkinleştirmesi için uyarı gösterin
      return Future.error('Lokasyon servisleri etkin değil.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // İzinler reddedildi
        return Future.error('Lokasyon izinleri reddedildi.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // İzinler kalıcı olarak reddedildi, ayarlar menüsünden etkinleştirmeleri gerekiyor
      return Future.error(
        'Lokasyon izinleri kalıcı olarak reddedildi, lütfen ayarları düzenleyin.',
      );
    }

    // Mevcut konumu al
    return Geolocator.getCurrentPosition();
  }

  Future<List<EventModel>?> _filterEvents(List<EventModel>? events) async {
    if (!state.isFilter || events == null) {
      return events ?? [];
    }
    // Kullanıcının mevcut konumu (Bu değerleri gerçek kullanıcı konumuyla değiştirin)
    final location = await getCurrentUserLocation();
    var currentUserLat = location.latitude;
    var currentUserLon = location.longitude;
    if (state.filterLocation != null) {
      final places = GoogleMapsPlaces(
        apiKey: getGoogleMapsApiKey(),
      );
      final detail =
          await places.getDetailsByPlaceId(state.filterLocation!.placeId!);
      currentUserLat = detail.result.geometry!.location.lat;
      currentUserLon = detail.result.geometry!.location.lng;
    }
    final filteredEvents = <EventModel>[];
    for (final event in events) {
      // Tarih filtresi

      try {
        if (event.latitude != null &&
            event.longitude != null &&
            event.date != null &&
            event.date != '') {
          final eventDate = DateFormat('yyyy-MM-dd')
              .parse(event.date!.replaceAll('.', '-').replaceAll('/', '-'));
          final isDateInRange = eventDate.isAfter(
                state.filterStartDate ?? DateTime(2022),
              ) &&
              eventDate.isBefore(state.filterEndDate ?? DateTime(2100));
          // Mesafe filtresi
          final eventLat = double.parse(
            event.latitude!,
          ); // Etkinliğin enlemi
          final eventLon = double.parse(event.longitude!); // Etkinliğin boylamı
          final distance = Geolocator.distanceBetween(
            currentUserLat,
            currentUserLon,
            eventLat,
            eventLon,
          );

          // Mesafe filtresi (örneğin, 30 km içinde olan etkinlikler)
          final isDistanceInRange = distance <= state.filterUpperKm * 1000;

          if (isDateInRange && isDistanceInRange) {
            filteredEvents.add(event);
          }
        }
      } catch (e) {
        continue;
      }
    }
    return filteredEvents;
  }

  void setRangeDate(DateTime? start, DateTime? end) {
    state = state.copyWith(
      filterStartDate: start,
      filterEndDate: end,
      filterTime: null,
    );
  }

  void setTime(List<TagsModel?>? time) {
    state = state.copyWith(
      filterTime: time,
    );
    setTimeAround(time!.first!.id!);
  }

  void setHoby(List<TagsModel?>? tags) {
    state = state.copyWith(
      filterTags: tags,
    );
  }

  void setLocation(Prediction? prediction) {
    state = state.copyWith(
      filterLocation: prediction,
    );
  }

  void setKm(double lower, double upper) {
    state = state.copyWith(
      filterLowerKm: lower,
      filterUpperKm: upper,
    );
  }

  void clearFilterLoading() {
    state = state.copyWith(
      isRefresh: true,
      isFilter: false,
    );
    Future.delayed(const Duration(seconds: 2), clearFilter);
  }

  void clearFilter() {
    locationController.clear();
    state = state.copyWith(
      filterTags: null,
      filterTime: null,
      filterLowerKm: 0,
      filterUpperKm: 30,
      filterStartDate: null,
      filterLocation: null,
      isRefresh: false,
      filterEndDate: null,
      isFilter: false,
      isNotFoundEvents: false,
    );
  }

  @override
  void dispose() {
    locationController.dispose();
    _isDisposed = true;
    super.dispose();
  }
}
