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
    double? rating,
    bool? isPublish,
    bool? isUserEvent,
    int? likeCount,
    int? shareCount,
    VendorDetails? vendorDetails,
    List<JoinedUsers>? joinedUsers,
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
  bool? get joinedStatus;
  bool? get requestStatus;
  bool? get isClosedComment;
  bool? get isQuotaFull;
  bool? get isCurrentUser;
  bool? get openToJoinStatus;
  bool? get isUserEvent;
  int? get likeCount;
  int? get shareCount;
  VendorDetails? get vendorDetails;
  List<JoinedUsers>? get joinedUsers;
}
