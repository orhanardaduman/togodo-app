import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';

part 'user_search_model.freezed.dart';
part 'user_search_model.g.dart';

@freezed
class UserSearchModel with _$UserSearchModel implements EventSearchProperties {
  const factory UserSearchModel({
    String? id,
    String? userId,
    String? name,
    String? imageUrl,
    String? invateId,
    String? title,
    int? type,
    bool? isFriend,
    bool? inviteStatus,
    bool? sendByOtherUser,
    bool? inviteStatusData,
    bool? isCurrentUser,
    bool? isFollowed,
    bool? isAccepted,
    bool? isBlocked,
    bool? isRequest,
    bool? isHide,
  }) = _UserSearchModel;

  factory UserSearchModel.fromJson(Map<String, Object?> json) =>
      _$UserSearchModelFromJson(json);
}
