import 'package:freezed_annotation/freezed_annotation.dart';

part 'hoby_model.freezed.dart';
part 'hoby_model.g.dart';

@freezed
class HobyModel with _$HobyModel {
  const factory HobyModel({
    int? id,
    String? name,
  }) = _HobyModel;

  factory HobyModel.fromJson(Map<String, Object?> json) =>
      _$HobyModelFromJson(json);
}
