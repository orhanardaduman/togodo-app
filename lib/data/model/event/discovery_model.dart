import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/data/model/event/event_model.dart';
part 'discovery_model.freezed.dart';
part 'discovery_model.g.dart';

@freezed
class DiscoveryModel with _$DiscoveryModel {
  const factory DiscoveryModel({
    List<EventModel>? popular,
    List<EventModel>? near,
    List<EventModel>? soon,
  }) = _DiscoveryModel;

  factory DiscoveryModel.fromJson(Map<String, Object?> json) =>
      _$DiscoveryModelFromJson(json);
}
