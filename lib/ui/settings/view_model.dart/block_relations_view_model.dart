import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';

part 'block_relations_view_model.freezed.dart';

final blockRelationsViewModelProvider = StateNotifierProvider.autoDispose<
    BlockRelationsViewModel, BlockRelationsState>(
  BlockRelationsViewModel.new,
);

@freezed
class BlockRelationsState with _$BlockRelationsState {
  const factory BlockRelationsState({
    @Default([]) List<UserSearchModel> blockRelations,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _BlockRelationsState;
}

class BlockRelationsViewModel extends StateNotifier<BlockRelationsState> {
  BlockRelationsViewModel(
    this._ref,
  ) : super(const BlockRelationsState()) {
    _repository = _ref.read(profilRepositoryProvider);

    fetchComment();
  }
  final Ref _ref;
  bool _isDisposed = false;

  late final ProfilRepository _repository;

  Future<void> fetchComment() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserBlocked(0);
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      state = state.copyWith(
        blockRelations: result.dataOrThrow,
        pagination: 1,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchMoreComments() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    state = state.copyWith(loading: true);
    final result = await _repository.getUserBlocked(state.pagination);
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final newNews = result.dataOrThrow;
      state = state.copyWith(
        blockRelations: [...state.blockRelations, ...newNews],
        pagination: state.pagination + 1,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  void incrementBlockRelations(
    String id,
  ) {
    final updatedNews = List<UserSearchModel>.from(state.blockRelations);

    for (var i = 0; i < updatedNews.length; i++) {
      if (updatedNews[i].id == id) {
        final currentModel = updatedNews[i];
        final updatedModel = currentModel.copyWith(
          isBlocked: !currentModel.isBlocked!,
        );
        updatedNews[i] = updatedModel;

        state = state.copyWith(blockRelations: updatedNews);
        break;
      }
    }
  }

  void incrementRemoveUser(
    String id,
  ) {
    final updatedNews =
        state.blockRelations.where((element) => element.id != id).toList();

    state = state.copyWith(blockRelations: updatedNews);
  }

  Future<bool> blockRelation(String userId) {
    incrementRemoveUser(userId);
    return _repository.blockRelation(userId).then((result) {
      result.ifSuccess((data) async {
        log('Follow user successfully');
      });
      return result.isSuccess;
    });
  }

  Future<bool> unblockRelation(String userId) {
    incrementBlockRelations(userId);
    return _repository.unblockRelation(userId).then((result) {
      result.ifSuccess((data) async {
        log('unBlock user successfully');
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
