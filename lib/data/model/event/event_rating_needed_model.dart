import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_rating_needed_model.freezed.dart';
part 'event_rating_needed_model.g.dart';

@freezed
class EventRatingNeededModel with _$EventRatingNeededModel {
  const factory EventRatingNeededModel({
    String? id,
    String? eventId,
    String? eventName,
    String? eventDate,
  }) = _EventRatingNeededModell;

  factory EventRatingNeededModel.fromJson(Map<String, Object?> json) =>
      _$EventRatingNeededModelFromJson(json);
}
