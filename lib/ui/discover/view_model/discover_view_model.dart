import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/discovery_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/repository/create_event_repository.dart';
import 'package:togodo/data/repository/create_event_repository_impl.dart';
import 'package:togodo/ui/discover/view_model/filter_view_model.dart';

part 'discover_view_model.freezed.dart';

final discoveryViewModelProvider = StateNotifierProvider.family
    .autoDispose<DiscoveryViewModel, DiscoveryState, int>(
  DiscoveryViewModel.new,
);

@freezed
class DiscoveryState with _$DiscoveryState {
  const factory DiscoveryState({
    @Default([]) List<DiscoveryModel> data,
    @Default(0) int pagination,
    @Default(false) bool loading,
    @Default(false) bool pageLoading,
    @Default(null) String? location,
  }) = _DiscoveryState;
}

class DiscoveryViewModel extends StateNotifier<DiscoveryState> {
  DiscoveryViewModel(this._ref, this.tagId) : super(const DiscoveryState());

  bool _isDisposed = false;
  // ignore: unused_field
  final Ref _ref;
  final int tagId;
  late final CreateEventRepository _repository =
      _ref.read(createEventRepositoryProvider);
  TextEditingController locationController = TextEditingController();
  Future<void> fetchDiscovery() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final place = placemarks[0];
      state = state.copyWith(location: place.subAdministrativeArea);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (_isDisposed) return;

    final result = await _repository.getDiscoverEvents(tagId: tagId);
    if (result.isSuccess) {
      if (_isDisposed) return;

      state = state.copyWith(
        data: result.dataOrThrow,
        pagination: 1,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> filterDiscovery() async {
    if (_isDisposed) return;
    final filterNot = _ref.read(filterViewModelProvider.notifier);
    final result = await _repository.getDiscoverEvents(tagId: tagId);
    if (result.isSuccess) {
      if (_isDisposed) return;

      state = state.copyWith(
        data: await filterNot.filterData(result.dataOrThrow),
        pagination: 1,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  void loading() {
    state = state.copyWith(
      loading: !state.loading,
    );
  }

  void pageLoading() {
    state = state.copyWith(
      pageLoading: !state.pageLoading,
    );
  }

  void clearData() {
    state = state.copyWith(
      data: [],
    );
  }

  void clearFilter() {
    fetchDiscovery();
    locationController.clear();
    state = state.copyWith(
      loading: false,
    );
    _ref.read(filterViewModelProvider.notifier).clearFilter();
  }

  void incrementLikePopular(String id) {
    if (_isDisposed) return;
    final updatedData = state.data
        .map(
          (model) => model.updateLike(
            id,
            (m) => m.popular,
            (m, updated) => m.copyWith(popular: updated),
          ),
        )
        .toList();
    state = state.copyWith(data: updatedData);
  }

  void incrementLikeSoon(String id) {
    if (_isDisposed) return;
    final updatedData = state.data
        .map(
          (model) => model.updateLike(
            id,
            (m) => m.soon,
            (m, updated) => m.copyWith(soon: updated),
          ),
        )
        .toList();
    state = state.copyWith(data: updatedData);
  }

  void incrementLikeNear(String id) {
    if (_isDisposed) return;
    final updatedData = state.data
        .map(
          (model) => model.updateLike(
            id,
            (m) => m.near,
            (m, updated) => m.copyWith(near: updated),
          ),
        )
        .toList();
    state = state.copyWith(data: updatedData);
  }

  @override
  void dispose() {
    locationController.dispose();
    _isDisposed = true;
    super.dispose();
  }
}

extension on DiscoveryModel {
  DiscoveryModel updateLike(
    String id,
    List<EventModel>? Function(DiscoveryModel) getList,
    DiscoveryModel Function(DiscoveryModel, List<EventModel>?) updateList,
  ) {
    final currentList = getList(this);
    final updatedList = currentList?.map((event) {
      if (event.id == id) {
        return event.copyWith(likeStatus: !event.likeStatus!);
      }
      return event;
    }).toList();

    return updateList(this, updatedList);
  }
}
