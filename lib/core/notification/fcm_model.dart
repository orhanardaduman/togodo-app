import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_model.freezed.dart';
part 'fcm_model.g.dart';

@freezed
class FcmModel with _$FcmModel {
  const factory FcmModel({
    String? deviceId,
    String? typeId,
    String? userId,
    String? type,
    String? eventId,
    String? eventName,
    String? requestId,
    String? chatRoomId,
    String? chatContent,
    String? applauseCount,
    String? userFullName,
    String? userProfileImage,
    String? isGroup,
    String? rate,
  }) = _FcmModel;

  factory FcmModel.fromJson(Map<String, Object?> json) =>
      _$FcmModelFromJson(json);
}
