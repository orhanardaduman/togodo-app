// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportsModelImpl _$$ReportsModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportsModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      userImageUrl: json['userImageUrl'] as String?,
      userFullName: json['userFullName'] as String?,
      description: json['description'] as String?,
      reportedUserId: json['reportedUserId'] as String?,
      reportedUserImageUrl: json['reportedUserImageUrl'] as String?,
      reportedUserFullName: json['reportedUserFullName'] as String?,
      reportedEventId: json['reportedEventId'] as String?,
      reportedEventImageUrl: json['reportedEventImageUrl'] as String?,
      reportedEventName: json['reportedEventName'] as String?,
    );

Map<String, dynamic> _$$ReportsModelImplToJson(_$ReportsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userImageUrl': instance.userImageUrl,
      'userFullName': instance.userFullName,
      'description': instance.description,
      'reportedUserId': instance.reportedUserId,
      'reportedUserImageUrl': instance.reportedUserImageUrl,
      'reportedUserFullName': instance.reportedUserFullName,
      'reportedEventId': instance.reportedEventId,
      'reportedEventImageUrl': instance.reportedEventImageUrl,
      'reportedEventName': instance.reportedEventName,
    };
