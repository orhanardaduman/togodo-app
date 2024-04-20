// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

class UserSearchParam {
  UserSearchParam({required this.keyword, this.userId});
  String? userId;
  final String keyword;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserSearchParam &&
        other.userId == userId &&
        other.keyword == keyword;
  }

  @override
  int get hashCode => userId.hashCode ^ keyword.hashCode;
}

final userSearchProvider = FutureProvider.autoDispose
    .family<List<UserSearchModel>?, UserSearchParam>((ref, params) async {
  final model = ref.watch(profilViewModelProvider(params.userId).notifier);
  return model.getUserFriends(params.keyword);
});
final userFollowedSearchProvider = FutureProvider.autoDispose
    .family<List<UserSearchModel>?, UserSearchParam>((ref, params) async {
  final model = ref.watch(profilViewModelProvider(params.userId).notifier);
  return model.getUserFollowed(params.keyword);
});
