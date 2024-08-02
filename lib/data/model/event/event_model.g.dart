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
      joinedUserCount: json['joinedUserCount'] as int?,
      isQuotaFull: json['isQuotaFull'] as bool?,
      joinedStatus: json['joinedStatus'] as bool?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      ticketUrl: json['ticketUrl'] as String?,
      requestStatus: json['requestStatus'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      isClosedComment: json['isClosedComment'] as bool?,
      openToJoinStatus: json['openToJoinStatus'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingLenght: json['ratingLenght'] as int?,
      isPublish: json['isPublish'] as bool?,
      isUserEvent: json['isUserEvent'] as bool?,
      likeCount: json['likeCount'] as int?,
      shareCount: json['shareCount'] as int?,
      aspectRatio: json['aspectRatio'] as String?,
      vendorDetails: json['vendorDetails'] == null
          ? null
          : VendorDetails.fromJson(
              json['vendorDetails'] as Map<String, dynamic>),
      joinedUsers: (json['joinedUsers'] as List<dynamic>?)
          ?.map((e) => JoinedUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'rating': instance.rating,
      'ratingLenght': instance.ratingLenght,
      'isPublish': instance.isPublish,
      'isUserEvent': instance.isUserEvent,
      'likeCount': instance.likeCount,
      'shareCount': instance.shareCount,
      'aspectRatio': instance.aspectRatio,
      'vendorDetails': instance.vendorDetails,
      'joinedUsers': instance.joinedUsers,
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
