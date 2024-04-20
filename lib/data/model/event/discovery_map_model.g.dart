// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscoveryMapModelImpl _$$DiscoveryMapModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscoveryMapModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      location: json['location'] as String?,
      date: json['date'] as String?,
      createdAt: json['createdAt'] as String?,
      resolution: json['resolution'] as String?,
      likeStatus: json['likeStatus'] as bool?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      isUserEvent: json['isUserEvent'] as bool?,
      address: json['address'] as String?,
      ticketUrl: json['ticketUrl'] as String?,
      joinedUserCount: json['joinedUserCount'] as int?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      joinedStatus: json['joinedStatus'] as bool?,
      openToJoinStatus: json['openToJoinStatus'] as bool?,
      isClosedComment: json['isClosedComment'] as bool?,
      requestStatus: json['requestStatus'] as bool?,
      isQuotaFull: json['isQuotaFull'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      likeCount: json['likeCount'] as int?,
      shareCount: json['shareCount'] as int?,
      vendorDetails: json['vendorDetails'] == null
          ? null
          : VendorDetails.fromJson(
              json['vendorDetails'] as Map<String, dynamic>),
      joinedUsers: (json['joinedUsers'] as List<dynamic>?)
          ?.map((e) => JoinedUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DiscoveryMapModelImplToJson(
        _$DiscoveryMapModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'district': instance.district,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'date': instance.date,
      'createdAt': instance.createdAt,
      'resolution': instance.resolution,
      'likeStatus': instance.likeStatus,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isUserEvent': instance.isUserEvent,
      'address': instance.address,
      'ticketUrl': instance.ticketUrl,
      'joinedUserCount': instance.joinedUserCount,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'joinedStatus': instance.joinedStatus,
      'openToJoinStatus': instance.openToJoinStatus,
      'isClosedComment': instance.isClosedComment,
      'requestStatus': instance.requestStatus,
      'isQuotaFull': instance.isQuotaFull,
      'isCurrentUser': instance.isCurrentUser,
      'rating': instance.rating,
      'likeCount': instance.likeCount,
      'shareCount': instance.shareCount,
      'vendorDetails': instance.vendorDetails,
      'joinedUsers': instance.joinedUsers,
      'tags': instance.tags,
    };
