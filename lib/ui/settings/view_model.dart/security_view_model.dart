import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';

part 'security_view_model.freezed.dart';

final securityViewModelProvider =
    StateNotifierProvider.autoDispose<SecurityViewModel, SecurityState>(
  SecurityViewModel.new,
);

@freezed
class SecurityState with _$SecurityState {
  const factory SecurityState({
    @Default(0) int pagination,
  }) = _SecurityState;
}

class SecurityViewModel extends StateNotifier<SecurityState> {
  SecurityViewModel(
    this._ref,
  ) : super(const SecurityState()) {
    _repository = _ref.read(profilRepositoryProvider);
  }
  final Ref _ref;

  late final ProfilRepository _repository;

  Future<bool> blockRelation(String userId) {
    return _repository.blockRelation(userId).then((result) {
      result.ifSuccess((data) async {
        log('Follow user successfully');
      });
      return result.isSuccess;
    });
  }

  Future<bool> unblockRelation(String userId) {
    return _repository.unblockRelation(userId).then((result) {
      result.ifSuccess((data) async {
        log('Follow user successfully');
      });
      return result.isSuccess;
    });
  }
}
