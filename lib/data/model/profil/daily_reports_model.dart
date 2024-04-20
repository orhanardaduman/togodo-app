import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_reports_model.freezed.dart';
part 'daily_reports_model.g.dart';

@freezed
class DailyReportsModel with _$DailyReportsModel {
  const factory DailyReportsModel({
    int? total,
    int? daily,
  }) = _DailyReportsModel;

  factory DailyReportsModel.fromJson(Map<String, Object?> json) =>
      _$DailyReportsModelFromJson(json);
}
