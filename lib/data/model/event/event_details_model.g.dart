// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDetailsModelImpl _$$EventDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventDetailsModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      location: json['location'] as String?,
      date: json['date'] as String?,
      likeStatus: json['likeStatus'] as bool?,
      joinedUserCount: json['joinedUserCount'] as int?,
      joinedStatus: json['joinedStatus'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      resolution: json['resolution'] as String?,
      isPrice: json['isPrice'] as bool?,
      isQuotaFull: json['isQuotaFull'] as bool?,
      isPublish: json['isPublish'] as bool?,
      requestStatus: json['requestStatus'] as bool?,
      isParticipants: json['isParticipants'] as bool?,
      isContract: json['isContract'] as bool?,
      isUserEvent: json['isUserEvent'] as bool?,
      isClosedComment: json['isClosedComment'] as bool?,
      openToJoinStatus: json['openToJoinStatus'] as bool?,
      likeCount: json['likeCount'] as int?,
      shareCount: json['shareCount'] as int?,
      participantsLimit: json['participantsLimit'] as int?,
      price: json['price'] as String?,
      ticketUrl: json['ticketUrl'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      mapLink: json['mapLink'] as String?,
      address: json['address'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      vendorDetails: json['vendorDetails'] == null
          ? null
          : VendorDetails.fromJson(
              json['vendorDetails'] as Map<String, dynamic>),
      joinedUsers: (json['joinedUsers'] as List<dynamic>?)
          ?.map((e) => JoinedUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prices: (json['prices'] as List<dynamic>?)
          ?.map((e) => Prices.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventComment: (json['eventComment'] as List<dynamic>?)
          ?.map((e) => EventCommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      request: (json['request'] as List<dynamic>?)
          ?.map((e) => Request.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Ratings.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortNumber: json['sortNumber'] as int?,
    );

Map<String, dynamic> _$$EventDetailsModelImplToJson(
        _$EventDetailsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'date': instance.date,
      'likeStatus': instance.likeStatus,
      'joinedUserCount': instance.joinedUserCount,
      'joinedStatus': instance.joinedStatus,
      'isCurrentUser': instance.isCurrentUser,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'resolution': instance.resolution,
      'isPrice': instance.isPrice,
      'isQuotaFull': instance.isQuotaFull,
      'isPublish': instance.isPublish,
      'requestStatus': instance.requestStatus,
      'isParticipants': instance.isParticipants,
      'isContract': instance.isContract,
      'isUserEvent': instance.isUserEvent,
      'isClosedComment': instance.isClosedComment,
      'openToJoinStatus': instance.openToJoinStatus,
      'likeCount': instance.likeCount,
      'shareCount': instance.shareCount,
      'participantsLimit': instance.participantsLimit,
      'price': instance.price,
      'ticketUrl': instance.ticketUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'mapLink': instance.mapLink,
      'address': instance.address,
      'rating': instance.rating,
      'vendorDetails': instance.vendorDetails,
      'joinedUsers': instance.joinedUsers,
      'images': instance.images,
      'tags': instance.tags,
      'prices': instance.prices,
      'eventComment': instance.eventComment,
      'request': instance.request,
      'ratings': instance.ratings,
      'sortNumber': instance.sortNumber,
    };

_$PricesImpl _$$PricesImplFromJson(Map<String, dynamic> json) => _$PricesImpl(
      name: json['name'] as String?,
      fee: json['fee'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$PricesImplToJson(_$PricesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fee': instance.fee,
      'currency': instance.currency,
    };

_$RequestImpl _$$RequestImplFromJson(Map<String, dynamic> json) =>
    _$RequestImpl(
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$RequestImplToJson(_$RequestImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };

_$RatingsImpl _$$RatingsImplFromJson(Map<String, dynamic> json) =>
    _$RatingsImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$RatingsImplToJson(_$RatingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'rating': instance.rating,
      'createdAt': instance.createdAt,
    };
