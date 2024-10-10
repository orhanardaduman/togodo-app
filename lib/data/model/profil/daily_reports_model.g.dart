// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyReportsModelImpl _$$DailyReportsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyReportsModelImpl(
      total: (json['total'] as num?)?.toInt(),
      daily: (json['daily'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DailyReportsModelImplToJson(
        _$DailyReportsModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'daily': instance.daily,
    };
