import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';

part 'evet_join_with_friends_view_model.freezed.dart';

final eventJoinedWithFriendsViewModelProvider = StateNotifierProvider.family
    .autoDispose<EventJoinedWithFriendsViewModel, EventJoinedWithFriendsState,
        String>(
  EventJoinedWithFriendsViewModel.new,
);

@freezed
class EventJoinedWithFriendsState with _$EventJoinedWithFriendsState {
  const factory EventJoinedWithFriendsState({
    @Default([]) List<EventFriendInviteModel> events,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _EventJoinedWithFriendsState;
}

class EventJoinedWithFriendsViewModel
    extends StateNotifier<EventJoinedWithFriendsState> {
  EventJoinedWithFriendsViewModel(
    this._ref,
    this.eventId,
  ) : super(const EventJoinedWithFriendsState()) {
    fetchJoined();
  }
  final Ref _ref;
  bool _isDisposed = false;
  final String eventId;
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);

  Future<void> fetchJoined() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getEventUsersInvite(
      pagination: 0,
      eventId: eventId,
    );
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final userId = _ref.watch(userViewModelProvider).userId;

      state = state.copyWith(
        events: result.dataOrThrow
            .where((element) => element.id != userId)
            .toList(),
        loading: false,
        pagination: 1,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<List<UserSearchModel>?> getUserFriends(
    String? keyword,
  ) async {
    final result = await _repository.getEventFriendInviteList(
      pagination: 0,
      eventId: eventId,
      keyword: keyword!.replaceAll('@', ''),
    );
    if (result.isSuccess) {
      return result.dataOrThrow;
    }
    return null;
  }

  Future<void> fetchRequesyMore() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final userId = _ref.watch(userViewModelProvider).userId;

    final result = await _repository.getEventUsersInvite(
      pagination: state.pagination,
      eventId: eventId,
    );
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final newNews =
          result.dataOrThrow.where((element) => element.id != userId).toList();
      state = state.copyWith(
        events: [...state.events, ...newNews],
        pagination: state.pagination + 1,
      );
    } else {}
  }

  void incrementChangeStatus(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.events.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(inviteStatus: !(event.inviteStatus ?? false));
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  Future<bool> createInviteToFriend(String id) {
    incrementChangeStatus(id);

    return _repository.createInviteToFriend(eventId, id).then((result) {
      result
        ..ifSuccess((data) async {
          if (_isDisposed) return;
        })
        ..ifFailure((data) {
          incrementChangeStatus(id);
          if (_isDisposed) return;
        });
      return result.isSuccess;
    });
  }

  Future<bool> removeInviteToFriend(String id) {
    incrementChangeStatus(id);

    return _repository.removeInviteToFriend(eventId, id).then((result) {
      result
        ..ifSuccess((data) async {
          if (_isDisposed) return;
        })
        ..ifFailure((data) {
          incrementChangeStatus(id);
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
