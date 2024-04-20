import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_model.freezed.dart';
part 'reports_model.g.dart';

@freezed
class ReportsModel with _$ReportsModel {
  const factory ReportsModel({
    String? id,
    String? userId,
    String? userImageUrl,
    String? userFullName,
    String? description,
    String? reportedUserId,
    String? reportedUserImageUrl,
    String? reportedUserFullName,
    String? reportedEventId,
    String? reportedEventImageUrl,
    String? reportedEventName,
  }) = _ReportsModel;

  factory ReportsModel.fromJson(Map<String, Object?> json) =>
      _$ReportsModelFromJson(json);
}
