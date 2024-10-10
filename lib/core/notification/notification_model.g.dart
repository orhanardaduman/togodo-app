// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirebaseNotificationModelImpl _$$FirebaseNotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseNotificationModelImpl(
      id: json['id'] as String?,
      descEn: json['descEn'] as String?,
      descTr: json['descTr'] as String?,
      titleEn: json['titleEn'] as String?,
      titleTr: json['titleTr'] as String?,
      day: (json['day'] as num?)?.toInt(),
      hours: (json['hours'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FirebaseNotificationModelImplToJson(
        _$FirebaseNotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descEn': instance.descEn,
      'descTr': instance.descTr,
      'titleEn': instance.titleEn,
      'titleTr': instance.titleTr,
      'day': instance.day,
      'hours': instance.hours,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
