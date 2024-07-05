import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';

part 'event_all_users_model.freezed.dart';
part 'event_all_users_model.g.dart';

@freezed
class EventAllUsersModel with _$EventAllUsersModel {
  const factory EventAllUsersModel({
    int? total,
    List<EventFriendInviteModel>? users,
  }) = _EventAllUsersModel;

  factory EventAllUsersModel.fromJson(Map<String, Object?> json) =>
      _$EventAllUsersModelFromJson(json);
}
