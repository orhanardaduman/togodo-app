import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/notification/notification_model.dart';
import 'package:togodo/data/repository/notification_repository.dart';
import 'package:togodo/data/repository/notification_repository_impl.dart';

part 'notification_view_model.freezed.dart';

final notificationViewModelProvider =
    StateNotifierProvider.autoDispose<NotificationViewModel, NotificationState>(
  NotificationViewModel.new,
);

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationModel> events,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _NotificationState;
}

class NotificationViewModel extends StateNotifier<NotificationState> {
  NotificationViewModel(
    this._ref,
  ) : super(const NotificationState());
  final Ref _ref;
  bool _isDisposed = false;
  late final NotificationRepository _repository =
      _ref.read(notificationRepositoryProvider);

  Future<void> fetchNotification() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserNotification(
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

  Future<void> fetchMoreNotification() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final result = await _repository.getUserNotification(
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

  void incrementRemoveData(String id) {
    if (_isDisposed) return;

    final updatedEvents =
        state.events.where((element) => element.id != id).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void incrementRequestUpdatte(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.events.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(request: true);
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  Future<bool> declineInvite(String inviteId, String userId) {
    return _repository.declineInvite(inviteId, userId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> acceptInvite(String inviteId, String userId) {
    return _repository.acceptInvite(inviteId, userId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> declineRequest(String requestId, String userId) {
    return _repository.declineRequest(requestId, userId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> acceptRequest(String requestId, String userId) {
    return _repository.acceptRequest(requestId, userId).then((result) {
      result.ifSuccess((data) async {
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
