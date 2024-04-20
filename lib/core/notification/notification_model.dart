import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class FirebaseNotificationModel with _$FirebaseNotificationModel {
  const factory FirebaseNotificationModel({
    String? id,
    String? descEn,
    String? descTr,
    String? titleEn,
    String? titleTr,
    int? day,
    int? hours,
    DateTime? createdAt,
  }) = _FirebaseNotificationModel;

  factory FirebaseNotificationModel.fromJson(Map<String, Object?> json) =>
      _$FirebaseNotificationModelFromJson(json);
}
