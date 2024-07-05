// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_all_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventAllUsersModelImpl _$$EventAllUsersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventAllUsersModelImpl(
      total: json['total'] as int?,
      users: (json['users'] as List<dynamic>?)
          ?.map(
              (e) => EventFriendInviteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventAllUsersModelImplToJson(
        _$EventAllUsersModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'users': instance.users,
    };
