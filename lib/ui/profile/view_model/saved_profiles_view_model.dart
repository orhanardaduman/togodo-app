import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';
import 'package:togodo/ui/profile/model/user_accounts_model.dart';

import '../../../core/enums/cache_items.dart';

part 'saved_profiles_view_model.freezed.dart';

final savedProfilesViewModelProvider = StateNotifierProvider.family
    .autoDispose<SavedProfilesViewModel, SavedProfilesEventsState, String?>(
  SavedProfilesViewModel.new,
);

@freezed
class SavedProfilesEventsState with _$SavedProfilesEventsState {
  const factory SavedProfilesEventsState({
    @Default([]) List<UserAccountsModel> users,
    @Default(false) bool loading,
    @Default("") String currentToken,
  }) = _SavedProfilesEventsState;
}

class SavedProfilesViewModel extends StateNotifier<SavedProfilesEventsState> {
  SavedProfilesViewModel(
    this._ref,
    this.userId,
  ) : super(const SavedProfilesEventsState());
  final Ref _ref;
  bool _isDisposed = false;
  late final ProfilRepository _repository = _ref.read(profilRepositoryProvider);
  final String? userId;

  Future<void> fetchProfiles() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final token = await CacheItems.token.readSecureData();

    final result = await _repository.getUserSavedAccount();
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      state = state.copyWith(
        currentToken: token ?? '',
        users: result.dataOrThrow,
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
