import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';

part 'event_block_view_model.freezed.dart';

final eventBlockViewModelProvider = StateNotifierProvider.family
    .autoDispose<EventBlockViewModel, EventBlockState, bool>(
  EventBlockViewModel.new,
);

@freezed
class EventBlockState with _$EventBlockState {
  const factory EventBlockState({
    @Default([]) List<UserSearchModel> data,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _EventBlockState;
}

class EventBlockViewModel extends StateNotifier<EventBlockState> {
  EventBlockViewModel(
    this._ref,
    // ignore: avoid_positional_boolean_parameters
    this.status,
  ) : super(const EventBlockState()) {
    _repository = _ref.read(profilRepositoryProvider);
  }
  final Ref _ref;
  bool _isDisposed = false;
  bool status = true;

  late final ProfilRepository _repository;

  Future<void> fetchData() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserHideEventsToUser(0, status: status);
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      state = state.copyWith(
        data: result.dataOrThrow,
        pagination: 1,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchMoreDatas() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    state = state.copyWith(loading: true);
    final result = await _repository.getUserHideEventsToUser(
      state.pagination,
      status: status,
    );
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final newNews = result.dataOrThrow;
      state = state.copyWith(
        data: [...state.data, ...newNews],
        pagination: state.pagination + 1,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  void incrementRemoveUser(
    String id,
  ) {
    final updatedNews =
        state.data.where((element) => element.id != id).toList();

    state = state.copyWith(data: updatedNews);
  }

  Future<bool> removeHiddenEvent(String userId, {bool status = true}) {
    incrementRemoveUser(userId);
    return _repository.removeHiddenEvent(userId, status: status).then((result) {
      result.ifSuccess((data) async {
        log('Remove successfully');
      });
      return result.isSuccess;
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
