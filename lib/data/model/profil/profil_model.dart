import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profil_model.freezed.dart';
part 'profil_model.g.dart';

@freezed
class ProfilModel with _$ProfilModel {
  const factory ProfilModel({
    bool? isCurrentUser,
    bool? isFriend,
    bool? isHideEvent,
    bool? isBlocked,
    bool? isNotification,
    bool? isBlockedCurrentUserToUser,
    bool? isBlockedUserToCurrentUser,
    bool? isHideEventCurrentUserToUser,
    bool? isHideEventUserToCurrentUser,
    bool? friendRequestUserToCurrentUser,
    bool? friendRequestCurrentUserToUser,
    String? id,
    String? name,
    String? surname,
    String? phoneNumber,
    String? email,
    int? gender,
    int? age,
    int? type,
    String? birthdayDate,
    String? userName,
    String? bio,
    String? title,
    String? location,
    int? completionRate,
    bool? titleCompletion,
    bool? socialMediaCompletion,
    bool? tagCompletion,
    bool? bioCompletion,
    bool? isFollowed,
    int? friendCount,
    int? followersCount,
    int? privacyType,
    int? eventsCreatedCount,
    int? applauseCount,
    bool? isHideEventCreatedCurrentUserToUser,
    bool? isHideEventCreatedUserToCurrentUser,
    bool? isHideEventJoinedCurrentUserToUser,
    bool? isHideEventJoinedUserToCurrentUser,
    List<TagsModel>? tags,
    List<SocialMedias>? socialMedias,
    List<Images>? images,
  }) = _ProfilModel;

  factory ProfilModel.fromJson(Map<String, Object?> json) =>
      _$ProfilModelFromJson(json);
}

@freezed
class TagsModel with _$TagsModel {
  const factory TagsModel({
    int? id, //4
    String? name,
    String? iconPath,
    List<TagsModel>? subTags, //401
  }) = _TagsModel;

  factory TagsModel.fromJson(Map<String, Object?> json) =>
      _$TagsModelFromJson(json);
}

@freezed
class SocialMedias with _$SocialMedias {
  const factory SocialMedias({
    String? id,
    String? name,
    String? icon,
    String? url,
    int? number,
  }) = _SocialMedias;

  factory SocialMedias.fromJson(Map<String, Object?> json) =>
      _$SocialMediasFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    String? downloadUrl,
    int? number,
  }) = _Images;

  factory Images.fromJson(Map<String, Object?> json) => _$ImagesFromJson(json);
}
