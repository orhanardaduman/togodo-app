import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_request_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';

part 'event_request_view_model.freezed.dart';

final eventRequestViewModelProvider = StateNotifierProvider.family
    .autoDispose<EventRequestViewModel, EventRequestState, String>(
  EventRequestViewModel.new,
);

@freezed
class EventRequestState with _$EventRequestState {
  const factory EventRequestState({
    @Default([]) List<EventRequestModel> events,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _EventRequestState;
}

class EventRequestViewModel extends StateNotifier<EventRequestState> {
  EventRequestViewModel(
    this._ref,
    this.eventId,
  ) : super(const EventRequestState()) {
    fetchRequest();
  }
  final Ref _ref;
  bool _isDisposed = false;
  final String eventId;
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);

  Future<void> fetchRequest() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getRequestEvent(
      pagination: 0,
      eventId: eventId,
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

  Future<void> fetchRequesyMore() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final result = await _repository.getRequestEvent(
      pagination: state.pagination,
      eventId: eventId,
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

  void incrementChangeStatus(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.events.map((event) {
      if (event.requestId == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(requestStatus: !(event.requestStatus ?? false));
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  Future<bool> acceptRequest(String id) {
    return _repository.acceptRequest(id).then((result) {
      result.ifSuccess((data) async {
        incrementChangeStatus(id);
        await _ref
            .read(eventDetailsViewModelProvider(eventId).notifier)
            .fetchEvents();
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> declineRequest(String id) {
    return _repository.declineRequest(id).then((result) {
      result.ifSuccess((data) async {
        incrementChangeStatus(id);
        await _ref
            .read(eventDetailsViewModelProvider(eventId).notifier)
            .fetchEvents();
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
