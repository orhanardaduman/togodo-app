// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_with_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSearchWithEventsImpl _$$UserSearchWithEventsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSearchWithEventsImpl(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserSearchWithEventsImplToJson(
        _$UserSearchWithEventsImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
      'events': instance.events,
    };

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
    };
