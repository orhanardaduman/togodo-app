import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';

part 'profil_view_model.freezed.dart';

final profilViewModelProvider = StateNotifierProvider.family
    .autoDispose<ProfilViewModel, ProfilState, String?>(
  ProfilViewModel.new,
);

@freezed
class ProfilState with _$ProfilState {
  const factory ProfilState({
    @Default(Result.success(data: null)) Result<ProfilModel?>? profilData,
    @Default(null) ProfilModel? profil,
    @Default([]) List<UserSearchModel>? friendsRequest,
    @Default([]) List<UserSearchModel>? requestModel,
    @Default([]) List<UserSearchModel>? recommendedData,
    @Default(false) bool loading,
    @Default(0) int complateRate,
    @Default('') String name,
  }) = _ProfilState;
}

class ProfilViewModel extends StateNotifier<ProfilState> {
  ProfilViewModel(this._ref, this.userId) : super(const ProfilState()) {
    _repository = _ref.read(profilRepositoryProvider);
  }

  final Ref _ref;
  final String? userId;
  late final ProfilRepository _repository;
  bool _isDisposed = false;
  Future<void> fetchProfil() async {
    if (_isDisposed) return;
    state = state.copyWith(loading: true);
    final result = await _repository.getProfil(userId: userId);
    if (result.isSuccess) {
      if (_isDisposed) return;
      state = state.copyWith(
        profilData: result,
        profil: result.dataOrThrow,
        complateRate: result.dataOrThrow.completionRate ?? 0,
        name: result.dataOrThrow.name ?? '',
        loading: false,
      );
    }
  }

  Future<void> addPoint(int point, String userId) async {
    if (_isDisposed) return;
    state = state.copyWith(loading: true);
    final result = await _repository.addPoint(userId: userId, point: point);
    print(result.toString());
    if (result.isSuccess) {
      if (_isDisposed) return;
      state = state.copyWith(
        loading: true,
      );
      fetchProfil();
    }
  }

  Future<List<UserSearchModel>?> getUserSearch(
    String? keyword,
  ) async {
    final result = await _repository.getUserSearch(
      keyword!.replaceAll('@', ''),
    );
    if (result.isSuccess) {
      return result.dataOrThrow;
    }
    return null;
  }

  Future<List<UserSearchModel>?> getUserFriends(
    String? keyword,
  ) async {
    final result = await _repository.getUserFriends(
      0,
      userId,
      keyword!.replaceAll('@', ''),
    );
    if (result.isSuccess) {
      state = state.copyWith(friendsRequest: result.dataOrThrow);

      return result.dataOrThrow;
    }
    return null;
  }

  Future<List<UserSearchModel>?> getUserFollowed(
    String? keyword,
  ) async {
    final result = await _repository.getUserFollowed(
      0,
      userId,
      keyword!.replaceAll('@', ''),
    );
    if (result.isSuccess) {
      state = state.copyWith(friendsRequest: result.dataOrThrow);

      return result.dataOrThrow;
    }
    return null;
  }

  Future<void> getUserRecommendedUsers() async {
    if (_isDisposed) return;
    final result = await _repository.getUserRecommendedUsers();
    if (result.isSuccess) {
      state = state.copyWith(
        recommendedData: result.dataOrThrow,
      );
    }
  }

  Future<void> fetchFriendsRequest() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserFriendsRequests(
      0,
    );
    if (result.isSuccess) {
      state = state.copyWith(
        requestModel: result.dataOrThrow,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchUserFollowersUsers() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getUserFollowersUsers(
      userId,
      0,
    );
    if (result.isSuccess) {
      state = state.copyWith(
        requestModel: result.dataOrThrow,
        loading: false,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<bool> addRequest() {
    if (userId == null) return Future.value(false);
    return _repository.addRequest(userId!).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        incrementAddRequest();
      });
      return result.isSuccess;
    });
  }

  Future<bool> updatePrivacyType(int type) {
    return _repository.updatePrivacyType(type).then((result) {
      result.ifSuccess((data) async {
        incrementPrivacyType(type);
      });
      return result.isSuccess;
    });
  }

  Future<bool> updateLanguage(String name) {
    return _repository.updateLanguage(name).then((result) {
      result.ifSuccess((data) async {});
      return result.isSuccess;
    });
  }

  Future<bool> logout() {
    return _repository.logout().then((result) {
      result.ifSuccess((data) async {});
      return result.isSuccess;
    });
  }

  Future<bool> addFollow() {
    if (userId == null) return Future.value(false);
    return _repository.addFollow(userId!).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        incrementAddFollow();
      });
      return result.isSuccess;
    });
  }

  Future<bool> removeFollow() {
    if (userId == null) return Future.value(false);
    return _repository.removeFollow(userId!).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        incrementAddFollow();
      });
      return result.isSuccess;
    });
  }

  Future<bool> removeRequest() {
    if (userId == null) return Future.value(false);
    return _repository.removeRequest(userId!).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        incrementAddRequest();
      });
      return result.isSuccess;
    });
  }

  Future<bool> removeFriend() {
    if (userId == null) return Future.value(false);
    return _repository.removeFriend(userId!).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        await fetchProfil();
      });
      return result.isSuccess;
    });
  }

  Future<bool> createReporUser(
    String userIds,
    String description, {
    String? eventId,
  }) {
    return _repository
        .createReportUser(userIds, eventId, description)
        .then((result) {
      result.ifSuccess((data) async {});
      return result.isSuccess;
    });
  }

  Future<bool> blockRelationUser(String userID, bool isEmptyUser) {
    return _repository.blockRelation(userID, isEmptyUser).then((result) {
      return result.isSuccess;
    });
  }

  Future<bool> createHiddenEvent({bool status = true}) {
    if (userId == null) return Future.value(false);
    return _repository
        .createHiddenEvent(userId!, status: status)
        .then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        await fetchProfil();
      });
      return result.isSuccess;
    });
  }

  Future<bool> removeHiddenEvent() {
    if (userId == null) return Future.value(false);
    return _repository.removeHiddenEvent(userId!).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        await fetchProfil();
      });
      return result.isSuccess;
    });
  }

  Future<bool> blockRelation() {
    if (userId == null) return Future.value(false);
    return _repository.blockRelation(userId!, false).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        await fetchProfil();
      });
      return result.isSuccess;
    });
  }

  Future<bool> unblockRelation() {
    if (userId == null) return Future.value(false);
    return _repository.unblockRelation(userId!).then((result) {
      log(userId!);

      result.ifSuccess((data) async {
        if (_isDisposed) return;
        await fetchProfil();
      });
      return result.isSuccess;
    });
  }

  void incrementPrivacyType(int type) {
    if (_isDisposed) return;
    final updatedProfile = state.profil!.copyWith(
      privacyType: type,
    );

    state = state.copyWith(
      profil: updatedProfile, // Profil modelinin tamamını güncelleyin
    );
  }

  Future<bool> updateNotification() {
    if (userId == null) return Future.value(false);
    incrementNotification();
    return _repository.updateNotification(userId!).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void incrementNotification() {
    if (_isDisposed) return;
    final updatedProfile = state.profil!.copyWith(
      isNotification: !(state.profil!.isNotification ?? false),
    );

    state = state.copyWith(
      profil: updatedProfile, // Profil modelinin tamamını güncelleyin
    );
  }

  void incrementAddFollow() {
    if (_isDisposed) return;
    final updatedProfile = state.profil!.copyWith(
      isFollowed: !state.profil!.isFollowed!,
    );

    state = state.copyWith(
      profil: updatedProfile, // Profil modelinin tamamını güncelleyin
    );
  }

  void incrementAddRequest() {
    if (_isDisposed) return;
    final updatedProfile = state.profil!.copyWith(
      friendRequestCurrentUserToUser:
          !state.profil!.friendRequestCurrentUserToUser!,
    );

    state = state.copyWith(
      profil: updatedProfile, // Profil modelinin tamamını güncelleyin
    );
  }

  Future<bool> acceptRequest(String id) {
    incrementAcceptRequest(id);
    return _repository.acceptRequest(id).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void incrementChangeRequest(String userIds) {
    if (_isDisposed) return;
    final updatedProfile = state.friendsRequest!.map((e) {
      if (e.id! == userIds) {
        return e.copyWith(
          isRequest: !(e.isRequest ?? false),
        );
      }
      return e;
    }).toList();

    state = state.copyWith(
      friendsRequest: updatedProfile, // Profil modelinin tamamını güncelleyin
    );
  }

  void incrementAcceptRequest(String id) {
    if (_isDisposed) return;

    // ID'si eşleşmeyen öğeleri filtreleyerek yeni bir liste oluştur
    final updatedFriendsRequest =
        state.friendsRequest!.where((element) => element.id != id).toList();
    final updatedRequest =
        state.requestModel!.where((element) => element.id != id).toList();

    // State'i güncellenmiş friendsRequest listesi ile güncelle
    state = state.copyWith(
      friendsRequest: updatedFriendsRequest,
      requestModel: updatedRequest,
    );
  }

  Future<bool> declineRequest(String id) {
    incrementAcceptRequest(id);
    return _repository.declineRequest(id).then((result) {
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
