import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_info_model.freezed.dart';
part 'post_info_model.g.dart';

@freezed
class PostInfo with _$PostInfo {
  const factory PostInfo({
    String? eventId,
    String? userName,
    String? userFullName,
    String? userImageUrl,
    String? eventContent,
    String? eventImageUrl,
    String? eventDate,
    String? eventName,
    String? eventLocation,
  }) = _PostInfo;

  factory PostInfo.fromJson(Map<String, Object?> json) =>
      _$PostInfoFromJson(json);
}
