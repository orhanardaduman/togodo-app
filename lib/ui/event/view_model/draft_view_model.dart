import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/repository/create_event_repository.dart';
import 'package:togodo/data/repository/create_event_repository_impl.dart';
part 'draft_view_model.freezed.dart';

final draftViewModelProvider =
    StateNotifierProvider.autoDispose<DraftViewModel, DraftState>(
  DraftViewModel.new,
);

@freezed
class DraftState with _$DraftState {
  const factory DraftState({
    @Default([]) List<EventModel> data,
    @Default(0) int pagination,
    @Default(false) bool loading,
    @Default(false) bool dataLoading,
  }) = _DraftState;
}

class DraftViewModel extends StateNotifier<DraftState> {
  DraftViewModel(this._ref) : super(const DraftState());

  bool _isDisposed = false;
  // ignore: unused_field
  final Ref _ref;
  late final CreateEventRepository _repository =
      _ref.read(createEventRepositoryProvider);

  Future<void> fetchDraft() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(dataLoading: true);
    final result = await _repository.getCreateEvent(pagination: 0);
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      state = state.copyWith(
        data: result.dataOrThrow
            .where((element) => !(element.isPublish ?? false))
            .toList(),
        pagination: 1,
        dataLoading: false,
      );
    } else {
      state = state.copyWith(dataLoading: false);
    }
  }

  void loading() {
    state = state.copyWith(
      loading: !state.loading,
    );
  }

  Future<void> fetchMoreDraft() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    state = state.copyWith(loading: true);
    final result =
        await _repository.getCreateEvent(pagination: state.pagination);
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
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

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
