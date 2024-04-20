// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfilModelImpl _$$ProfilModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfilModelImpl(
      isCurrentUser: json['isCurrentUser'] as bool?,
      isFriend: json['isFriend'] as bool?,
      isHideEvent: json['isHideEvent'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isNotification: json['isNotification'] as bool?,
      isBlockedCurrentUserToUser: json['isBlockedCurrentUserToUser'] as bool?,
      isBlockedUserToCurrentUser: json['isBlockedUserToCurrentUser'] as bool?,
      isHideEventCurrentUserToUser:
          json['isHideEventCurrentUserToUser'] as bool?,
      isHideEventUserToCurrentUser:
          json['isHideEventUserToCurrentUser'] as bool?,
      friendRequestUserToCurrentUser:
          json['friendRequestUserToCurrentUser'] as bool?,
      friendRequestCurrentUserToUser:
          json['friendRequestCurrentUserToUser'] as bool?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as int?,
      age: json['age'] as int?,
      type: json['type'] as int?,
      birthdayDate: json['birthdayDate'] as String?,
      userName: json['userName'] as String?,
      bio: json['bio'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      completionRate: json['completionRate'] as int?,
      titleCompletion: json['titleCompletion'] as bool?,
      socialMediaCompletion: json['socialMediaCompletion'] as bool?,
      tagCompletion: json['tagCompletion'] as bool?,
      bioCompletion: json['bioCompletion'] as bool?,
      isFollowed: json['isFollowed'] as bool?,
      friendCount: json['friendCount'] as int?,
      followersCount: json['followersCount'] as int?,
      privacyType: json['privacyType'] as int?,
      eventsCreatedCount: json['eventsCreatedCount'] as int?,
      applauseCount: json['applauseCount'] as int?,
      isHideEventCreatedCurrentUserToUser:
          json['isHideEventCreatedCurrentUserToUser'] as bool?,
      isHideEventCreatedUserToCurrentUser:
          json['isHideEventCreatedUserToCurrentUser'] as bool?,
      isHideEventJoinedCurrentUserToUser:
          json['isHideEventJoinedCurrentUserToUser'] as bool?,
      isHideEventJoinedUserToCurrentUser:
          json['isHideEventJoinedUserToCurrentUser'] as bool?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedias: (json['socialMedias'] as List<dynamic>?)
          ?.map((e) => SocialMedias.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfilModelImplToJson(_$ProfilModelImpl instance) =>
    <String, dynamic>{
      'isCurrentUser': instance.isCurrentUser,
      'isFriend': instance.isFriend,
      'isHideEvent': instance.isHideEvent,
      'isBlocked': instance.isBlocked,
      'isNotification': instance.isNotification,
      'isBlockedCurrentUserToUser': instance.isBlockedCurrentUserToUser,
      'isBlockedUserToCurrentUser': instance.isBlockedUserToCurrentUser,
      'isHideEventCurrentUserToUser': instance.isHideEventCurrentUserToUser,
      'isHideEventUserToCurrentUser': instance.isHideEventUserToCurrentUser,
      'friendRequestUserToCurrentUser': instance.friendRequestUserToCurrentUser,
      'friendRequestCurrentUserToUser': instance.friendRequestCurrentUserToUser,
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'gender': instance.gender,
      'age': instance.age,
      'type': instance.type,
      'birthdayDate': instance.birthdayDate,
      'userName': instance.userName,
      'bio': instance.bio,
      'title': instance.title,
      'location': instance.location,
      'completionRate': instance.completionRate,
      'titleCompletion': instance.titleCompletion,
      'socialMediaCompletion': instance.socialMediaCompletion,
      'tagCompletion': instance.tagCompletion,
      'bioCompletion': instance.bioCompletion,
      'isFollowed': instance.isFollowed,
      'friendCount': instance.friendCount,
      'followersCount': instance.followersCount,
      'privacyType': instance.privacyType,
      'eventsCreatedCount': instance.eventsCreatedCount,
      'applauseCount': instance.applauseCount,
      'isHideEventCreatedCurrentUserToUser':
          instance.isHideEventCreatedCurrentUserToUser,
      'isHideEventCreatedUserToCurrentUser':
          instance.isHideEventCreatedUserToCurrentUser,
      'isHideEventJoinedCurrentUserToUser':
          instance.isHideEventJoinedCurrentUserToUser,
      'isHideEventJoinedUserToCurrentUser':
          instance.isHideEventJoinedUserToCurrentUser,
      'tags': instance.tags,
      'socialMedias': instance.socialMedias,
      'images': instance.images,
    };

_$TagsModelImpl _$$TagsModelImplFromJson(Map<String, dynamic> json) =>
    _$TagsModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      iconPath: json['iconPath'] as String?,
      subTags: (json['subTags'] as List<dynamic>?)
          ?.map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TagsModelImplToJson(_$TagsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconPath': instance.iconPath,
      'subTags': instance.subTags,
    };

_$SocialMediasImpl _$$SocialMediasImplFromJson(Map<String, dynamic> json) =>
    _$SocialMediasImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      url: json['url'] as String?,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$$SocialMediasImplToJson(_$SocialMediasImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'url': instance.url,
      'number': instance.number,
    };

_$ImagesImpl _$$ImagesImplFromJson(Map<String, dynamic> json) => _$ImagesImpl(
      downloadUrl: json['downloadUrl'] as String?,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$$ImagesImplToJson(_$ImagesImpl instance) =>
    <String, dynamic>{
      'downloadUrl': instance.downloadUrl,
      'number': instance.number,
    };
