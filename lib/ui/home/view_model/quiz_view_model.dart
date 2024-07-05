import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';

part 'quiz_view_model.freezed.dart';

final quizViewModelProvider =
    StateNotifierProvider.family<QuizViewModel, QuizState, String>(
  QuizViewModel.new,
);

@freezed
class QuizState with _$QuizState {
  const factory QuizState({
    @Default([]) List<EventFriendInviteModel> data,
    @Default(0) int pagination,
    @Default(false) bool loading,
  }) = _QuizState;
}

class QuizViewModel extends StateNotifier<QuizState> {
  QuizViewModel(
    this._ref,
    this.eventId,
  ) : super(const QuizState()) {
    fetchData();
  }
  final Ref _ref;
  bool _isDisposed = false;
  String eventId;
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);

  Future<void> fetchData() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserEvent(
      pagination: 0,
      eventId: eventId,
    );
    if (result.isSuccess) {
      List<EventFriendInviteModel> data = [];
      data.addAll(result.dataOrThrow.users?.toList() ?? []);
      state = state.copyWith(
        data: data,
        loading: false,
        pagination: 1,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  void incrementChangeStatus(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.data.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(inviteStatus: !(event.inviteStatus ?? false));
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(data: updatedEvents);
  }

  Future<bool> createInviteToFriend(String id) {
    return _repository.createInviteToFriend(eventId, id).then((result) {
      result.ifSuccess((data) async {
        incrementChangeStatus(id);

        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> removeInviteToFriend(String id) {
    return _repository.removeInviteToFriend(eventId, id).then((result) {
      result.ifSuccess((data) async {
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
