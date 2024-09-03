import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_friend_invite_model.freezed.dart';
part 'event_friend_invite_model.g.dart';

@freezed
class EventFriendInviteModel
    with _$EventFriendInviteModel
    implements EventSearchProperties {
  const factory EventFriendInviteModel({
    String? id,
    String? userId,
    String? name,
    String? imageUrl,
    String? title,
    String? invateId,
    int? type,
    bool? inviteStatus,
    bool? sendByOtherUser,
    bool? inviteStatusData,
    bool? isFriend,
    bool? isCurrentUser,
    bool? isAccepted,
    bool? isBlocked,
    bool? isFriendRequest,
    bool? isRequest,
  }) = _EventFriendInviteModel;

  factory EventFriendInviteModel.fromJson(Map<String, Object?> json) =>
      _$EventFriendInviteModelFromJson(json);
}

mixin EventSearchProperties {
  String? get id;
  String? get userId;
  String? get name;
  String? get title;
  String? get imageUrl;
  String? get invateId;
  int? get type;
  bool? get inviteStatus;
  bool? get sendByOtherUser;
  bool? get inviteStatusData;

  bool? get isFriend;
  bool? get isCurrentUser;
  bool? get isAccepted;
  bool? get isBlocked;
  bool? get isRequest;
}
