import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/data/model/profil/user_search_with_events.dart';
import 'package:togodo/data/repository/create_event_repository.dart';
import 'package:togodo/data/repository/create_event_repository_impl.dart';
part 'discovery_search_view_model.freezed.dart';

final discoverySearchProvider = FutureProvider.autoDispose
    .family<List<UserSearchWithEvents>?, String>((ref, keyword) async {
  final model = ref.watch(
    discoverySearchViewModelProvider.notifier,
  );
  return model.getUserSearchWithEvents(keyword);
});
final discoverySearchViewModelProvider = StateNotifierProvider.autoDispose<
    DiscoverySearchViewModel, DiscoverySearchState>(
  DiscoverySearchViewModel.new,
);

@freezed
class DiscoverySearchState with _$DiscoverySearchState {
  const factory DiscoverySearchState({
    @Default(false) bool isShowClearFilter,
    @Default(false) bool isRefresh,
  }) = _DiscoveryState;
}

class DiscoverySearchViewModel extends StateNotifier<DiscoverySearchState> {
  DiscoverySearchViewModel(
    this._ref,
  ) : super(const DiscoverySearchState());

  final Ref _ref;
  bool _isDisposed = false;
  late final CreateEventRepository _repository =
      _ref.read(createEventRepositoryProvider);

  Future<bool> saveSearch({
    String? userId,
    String? eventId,
    String? keyword,
  }) {
    return _repository
        .saveSearch(
      userId: userId,
      eventId: eventId,
      keyword: keyword,
    )
        .then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<List<UserSearchWithEvents>?> getUserSearchWithEvents(
    String? keyword,
  ) async {
    final result = await _repository.getUserSearchWithEvents(
      keyword!.replaceAll('@', ''),
    );
    if (result.isSuccess) {
      final user = result.dataOrThrow.first.users;
      final events = result.dataOrThrow.first.events;
      if (user!.ext.isNullOrEmpty && events.ext.isNullOrEmpty) {
        changeClearFilter(isShowClearFilter: false);
      } else {
        changeClearFilter(isShowClearFilter: true);
      }
      return result.dataOrThrow;
    }
    return null;
  }

  void changeRefresh() {
    state = state.copyWith(isRefresh: !state.isRefresh);
  }

  void changeClearFilter({required bool isShowClearFilter}) {
    state = state.copyWith(isShowClearFilter: isShowClearFilter);
  }

  Future<bool> removeSearchHistory() {
    changeRefresh();
    return _repository.removeSearchHistory().then((result) {
      result.ifSuccess((data) async {
        changeRefresh();
        if (_isDisposed) return;
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
