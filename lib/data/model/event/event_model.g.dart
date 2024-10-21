// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      location: json['location'] as String?,
      date: json['date'] as String?,
      likeStatus: json['likeStatus'] as bool?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      resolution: json['resolution'] as String?,
      joinedUserCount: (json['joinedUserCount'] as num?)?.toInt(),
      isQuotaFull: json['isQuotaFull'] as bool?,
      joinedStatus: json['joinedStatus'] as bool?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      ticketUrl: json['ticketUrl'] as String?,
      requestStatus: json['requestStatus'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      isClosedComment: json['isClosedComment'] as bool?,
      openToJoinStatus: json['openToJoinStatus'] as bool?,
      joinStatus: json['joinStatus'] as bool?,
      searching: json['searching'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingLenght: (json['ratingLenght'] as num?)?.toInt(),
      isPublish: json['isPublish'] as bool?,
      isUserEvent: json['isUserEvent'] as bool?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      shareCount: (json['shareCount'] as num?)?.toInt(),
      participantsLimit: (json['participantsLimit'] as num?)?.toInt(),
      aspectRatio: json['aspectRatio'] as String?,
      vendorDetails: json['vendorDetails'] == null
          ? null
          : VendorDetails.fromJson(
              json['vendorDetails'] as Map<String, dynamic>),
      joinedUsers: (json['joinedUsers'] as List<dynamic>?)
          ?.map((e) => JoinedUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupRequest: json['groupRequest'] == null
          ? null
          : GroupRequestDetail.fromJson(
              json['groupRequest'] as Map<String, dynamic>),
      eventGroups: json['eventGroups'] == null
          ? null
          : EventGroups.fromJson(json['eventGroups'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'date': instance.date,
      'likeStatus': instance.likeStatus,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'resolution': instance.resolution,
      'joinedUserCount': instance.joinedUserCount,
      'isQuotaFull': instance.isQuotaFull,
      'joinedStatus': instance.joinedStatus,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'ticketUrl': instance.ticketUrl,
      'requestStatus': instance.requestStatus,
      'isCurrentUser': instance.isCurrentUser,
      'isClosedComment': instance.isClosedComment,
      'openToJoinStatus': instance.openToJoinStatus,
      'joinStatus': instance.joinStatus,
      'searching': instance.searching,
      'rating': instance.rating,
      'ratingLenght': instance.ratingLenght,
      'isPublish': instance.isPublish,
      'isUserEvent': instance.isUserEvent,
      'likeCount': instance.likeCount,
      'shareCount': instance.shareCount,
      'participantsLimit': instance.participantsLimit,
      'aspectRatio': instance.aspectRatio,
      'vendorDetails': instance.vendorDetails,
      'joinedUsers': instance.joinedUsers,
      'groupRequest': instance.groupRequest,
      'eventGroups': instance.eventGroups,
    };

_$VendorDetailsImpl _$$VendorDetailsImplFromJson(Map<String, dynamic> json) =>
    _$VendorDetailsImpl(
      isUserEvent: json['isUserEvent'] as bool?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$VendorDetailsImplToJson(_$VendorDetailsImpl instance) =>
    <String, dynamic>{
      'isUserEvent': instance.isUserEvent,
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'imageUrl': instance.imageUrl,
    };

_$GroupRequestDetailImpl _$$GroupRequestDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupRequestDetailImpl(
      id: json['id'] as String?,
      isStatisfied: json['isStatisfied'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      eventId: json['eventId'] as String?,
      aspNetUsers: json['aspNetUsers'] == null
          ? null
          : GroupUsers.fromJson(json['aspNetUsers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupRequestDetailImplToJson(
        _$GroupRequestDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isStatisfied': instance.isStatisfied,
      'isDeleted': instance.isDeleted,
      'eventId': instance.eventId,
      'aspNetUsers': instance.aspNetUsers,
    };

_$GroupRequestCreateDataImpl _$$GroupRequestCreateDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupRequestCreateDataImpl(
      groupRequest: json['groupRequest'] == null
          ? null
          : GroupRequestDetail.fromJson(
              json['groupRequest'] as Map<String, dynamic>),
      eventGroups: json['eventGroups'] == null
          ? null
          : EventGroups.fromJson(json['eventGroups'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupRequestCreateDataImplToJson(
        _$GroupRequestCreateDataImpl instance) =>
    <String, dynamic>{
      'groupRequest': instance.groupRequest,
      'eventGroups': instance.eventGroups,
    };

_$GroupUsersImpl _$$GroupUsersImplFromJson(Map<String, dynamic> json) =>
    _$GroupUsersImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$GroupUsersImplToJson(_$GroupUsersImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
    };

_$EventGroupsImpl _$$EventGroupsImplFromJson(Map<String, dynamic> json) =>
    _$EventGroupsImpl(
      id: json['id'] as String?,
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => GroupRequestDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      event: json['event'] == null
          ? null
          : EventModel.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventGroupsImplToJson(_$EventGroupsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requests': instance.requests,
      'event': instance.event,
    };

_$JoinedUsersImpl _$$JoinedUsersImplFromJson(Map<String, dynamic> json) =>
    _$JoinedUsersImpl(
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$JoinedUsersImplToJson(_$JoinedUsersImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'userId': instance.userId,
    };
