import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/data/model/event/event_model.dart';

part 'user_search_with_events.freezed.dart';
part 'user_search_with_events.g.dart';

@freezed
class UserSearchWithEvents with _$UserSearchWithEvents {
  const factory UserSearchWithEvents({
    List<Users>? users,
    List<EventModel>? events,
  }) = _UserSearchWithEvents;

  factory UserSearchWithEvents.fromJson(Map<String, Object?> json) =>
      _$UserSearchWithEventsFromJson(json);
}

@freezed
class Users with _$Users {
  const factory Users({
    String? id,
    String? name,
    String? imageUrl,
    String? title,
  }) = _Users;

  factory Users.fromJson(Map<String, Object?> json) => _$UsersFromJson(json);
}
