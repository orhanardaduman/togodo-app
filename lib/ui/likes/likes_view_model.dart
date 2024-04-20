import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

part 'likes_view_model.freezed.dart';

final likesViewModelProvider =
    StateNotifierProvider.autoDispose<LikesViewModel, LikesState?>(
  LikesViewModel.new,
);

@freezed
class LikesState with _$LikesState {
  const factory LikesState({
    @Default([]) List<EventModel> events,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _LikesState;
}

class LikesViewModel extends StateNotifier<LikesState> {
  LikesViewModel(
    this._ref,
  ) : super(const LikesState());
  final Ref _ref;
  bool _isDisposed = false;
  late final ProfilRepository _repository = _ref.read(profilRepositoryProvider);
  late final HomeRepository _repositorys = _ref.read(homeRepositoryProvider);
  String get userId => _ref.read(userViewModelProvider).tokenModel!.userId!;
  Future<void> fetchEvents() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserLikedEvents(
      0,
      userId,
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
    final result = await _repository.getUserLikedEvents(
      state.pagination,
      userId,
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

  Future<void> toggleLike(String id) async {
    // İlk olarak arayüzde değişikliği uygula
    final isLiked =
        state.events.firstWhere((event) => event.id == id).likeStatus!;
    incrementLike(
      id,
    ); // Bu, state'i güncelleyecek ve arayüzde değişikliği yansıtacak
    if (isLiked) {
      removeEvent(id);
    }
    // Sonra sunucu isteğini yap
    final result = await (isLiked
        ? _repositorys.eventUnlike(id)
        : _repositorys.eventLike(id));

    // İstek başarısızsa, kullanıcı arayüzünü geri al
    if (!result.isSuccess) {
      incrementLike(id); // Durumu eski haline getir
      // Kullanıcıya hata mesajı göstermek için gerekli işlemler
    }
  }

  void incrementLike(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.events.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin

        return event.copyWith(likeStatus: !event.likeStatus!);
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void removeEvent(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve sil
    final updatedEvents =
        state.events.where((event) => event.id != id).toList();
    _ref.read(homeViewModelProvider.notifier).incrementLike(id);
    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void removeEventDetails(String id) {
    if (_isDisposed) return;
    final updatedEvents =
        state.events.where((event) => event.id != id).toList();
    state = state.copyWith(events: updatedEvents);
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
