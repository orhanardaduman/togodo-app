import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';

part 'tab_draft_event_view_model.freezed.dart';

final tabEventsDraftViewModelProvider = StateNotifierProvider.family
    .autoDispose<TabEventsDraftViewModel, TabEventsDraftState, String?>(
  TabEventsDraftViewModel.new,
);

@freezed
class TabEventsDraftState with _$TabEventsDraftState {
  const factory TabEventsDraftState({
    @Default([]) List<EventModel> events,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _TabEventsDraftState;
}

class TabEventsDraftViewModel extends StateNotifier<TabEventsDraftState> {
  TabEventsDraftViewModel(
    this._ref,
    this.userId,
  ) : super(const TabEventsDraftState());
  final Ref _ref;
  bool _isDisposed = false;
  final String? userId;
  late final ProfilRepository _repository = _ref.read(profilRepositoryProvider);

  Future<void> fetchEvents() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserDraftAndCreatedEvent(
      0,
    );
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      state = state.copyWith(
        events: result.dataOrThrow,
        loading: false,
        pagination: 1,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchMoreEvents() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final result = await _repository.getUserDraftAndCreatedEvent(
      state.pagination,
    );
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final newNews = result.dataOrThrow;
      state = state.copyWith(
        events: [...state.events, ...newNews],
        pagination: state.pagination + 1,
      );
    } else {}
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
