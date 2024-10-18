import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel implements EventCommonProperties {
  const factory EventModel({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? location,
    String? date,
    bool? likeStatus,
    String? startTime,
    String? endTime,
    String? resolution,
    int? joinedUserCount,
    bool? isQuotaFull,
    bool? joinedStatus,
    String? latitude,
    String? longitude,
    String? ticketUrl,
    bool? requestStatus,
    bool? isCurrentUser,
    bool? isClosedComment,
    bool? openToJoinStatus,
    bool? joinStatus,
    double? rating,
    int? ratingLenght,
    bool? isPublish,
    bool? isUserEvent,
    int? likeCount,
    int? shareCount,
    int? participantsLimit,
    String? aspectRatio,
    VendorDetails? vendorDetails,
    List<JoinedUsers>? joinedUsers,
    GroupRequestDetail? groupRequest,
    EventGroups? eventGroups,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}

@freezed
class VendorDetails with _$VendorDetails {
  const factory VendorDetails({
    bool? isUserEvent,
    String? id,
    String? name,
    String? surname,
    String? imageUrl,
  }) = _VendorDetails;

  factory VendorDetails.fromJson(Map<String, Object?> json) =>
      _$VendorDetailsFromJson(json);
}

@freezed
class GroupRequestDetail with _$GroupRequestDetail {
  const factory GroupRequestDetail({
    String? id,
    bool? isStatisfied,
    bool? isDeleted,
    String? eventId,
    GroupUsers? aspNetUsers,
  }) = _GroupRequestDetail;

  factory GroupRequestDetail.fromJson(Map<String, Object?> json) =>
      _$GroupRequestDetailFromJson(json);
}

@freezed
class GroupUsers with _$GroupUsers {
  const factory GroupUsers({
    String? id,
    String? name,
    String? surname,
    String? imageUrl,
    String? title,
  }) = _GroupUsers;

  factory GroupUsers.fromJson(Map<String, Object?> json) =>
      _$GroupUsersFromJson(json);
}

@freezed
class EventGroups with _$EventGroups {
  const factory EventGroups({
    String? id,
    List<GroupRequestDetail>? requests,
    EventModel? event,
  }) = _EventGroups;

  factory EventGroups.fromJson(Map<String, Object?> json) =>
      _$EventGroupsFromJson(json);
}

@freezed
class JoinedUsers with _$JoinedUsers {
  const factory JoinedUsers({
    String? imageUrl,
    String? name,
    String? userId,
  }) = _JoinedUsers;

  factory JoinedUsers.fromJson(Map<String, Object?> json) =>
      _$JoinedUsersFromJson(json);
}

mixin EventCommonProperties {
  String? get id;

  String? get name;

  String? get description;

  String? get imageUrl;

  String? get location;

  String? get date;

  String? get startTime;

  String? get resolution;

  String? get endTime;

  String? get ticketUrl;

  bool? get likeStatus;

  int? get joinedUserCount;

  double? get rating;

  int? get ratingLenght;

  bool? get joinedStatus;

  bool? get requestStatus;
  bool? get joinStatus;

  bool? get isClosedComment;

  bool? get isQuotaFull;

  bool? get isCurrentUser;

  bool? get openToJoinStatus;

  bool? get isUserEvent;

  int? get likeCount;

  int? get shareCount;

  int? get participantsLimit;

  VendorDetails? get vendorDetails;

  List<JoinedUsers>? get joinedUsers;

  EventGroups? get eventGroups;

  GroupRequestDetail? get groupRequest;
}
