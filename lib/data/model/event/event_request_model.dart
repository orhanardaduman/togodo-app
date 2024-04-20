import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_request_model.freezed.dart';
part 'event_request_model.g.dart';

@freezed
class EventRequestModel with _$EventRequestModel {
  const factory EventRequestModel({
    String? requestId,
    String? userId,
    String? name,
    String? imageUrl,
    String? title,
    String? date,
    bool? requestStatus,
    Friend? friend,
  }) = _EventRequestModel;

  factory EventRequestModel.fromJson(Map<String, Object?> json) =>
      _$EventRequestModelFromJson(json);
}

@freezed
class Friend with _$Friend {
  const factory Friend({
    String? userId,
    String? name,
    String? imageUrl,
    String? title,
  }) = _Friend;

  factory Friend.fromJson(Map<String, Object?> json) => _$FriendFromJson(json);
}
