import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';

part 'event_joined_view_model.freezed.dart';

final eventJoinedViewModelProvider = StateNotifierProvider.family
    .autoDispose<EventJoinedViewModel, EventJoinedState, String>(
  EventJoinedViewModel.new,
);

@freezed
class EventJoinedState with _$EventJoinedState {
  const factory EventJoinedState({
    @Default([]) List<EventFriendInviteModel> events,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _EventJoinedState;
}

class EventJoinedViewModel extends StateNotifier<EventJoinedState> {
  EventJoinedViewModel(
    this._ref,
    this.eventId,
  ) : super(const EventJoinedState());
  final Ref _ref;
  bool _isDisposed = false;
  final String eventId;
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);

  Future<void> fetchJoined() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserEvent(
      pagination: 0,
      eventId: eventId,
    );
    if (result.isSuccess) {
      state = state.copyWith(
        events: result.dataOrThrow,
        loading: false,
        pagination: 1,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  void incrementRequestFriends(String userId) {
    state = state.copyWith(
      events: state.events.map((e) {
        if (e.id == userId) {
          return e.copyWith(
            isFriendRequest: !(e.isFriendRequest ?? false),
          );
        }
        return e;
      }).toList(),
    );
  }

  Future<void> fetchRequesyMore() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final result = await _repository.getUserEvent(
      pagination: state.pagination,
      eventId: eventId,
    );
    if (result.isSuccess) {
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
