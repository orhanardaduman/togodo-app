import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';

part 'event_details_model.freezed.dart';
part 'event_details_model.g.dart';

@freezed
class EventDetailsModel
    with _$EventDetailsModel
    implements EventCommonProperties {
  const factory EventDetailsModel({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? location,
    String? date,
    bool? likeStatus,
    int? joinedUserCount,
    bool? joinedStatus,
    bool? isCurrentUser,
    String? startTime,
    String? endTime,
    String? resolution,
    bool? isPrice,
    bool? isQuotaFull,
    bool? isPublish,
    bool? requestStatus,
    bool? isParticipants,
    bool? isContract,
    bool? isUserEvent,
    bool? isClosedComment,
    bool? openToJoinStatus,
    int? likeCount,
    int? participantsLimit,
    int? shareCount,
    String? price,
    String? ticketUrl,
    String? onlineUrl,
    String? latitude,
    String? longitude,
    String? mapLink,
    String? address,
    int? ratingLenght,
    double? rating,
    VendorDetails? vendorDetails,
    List<JoinedUsers>? joinedUsers,
    List<Images>? images,
    List<TagsModel>? tags,
    List<Prices>? prices,
    List<EventCommentModel>? eventComment,
    List<Request>? request,
    List<Ratings>? ratings,
    int? sortNumber,
    EventGroups? eventGroups,
    GroupRequestDetail? groupRequest,
  }) = _EventDetailsModel;

  factory EventDetailsModel.fromJson(Map<String, Object?> json) =>
      _$EventDetailsModelFromJson(json);
}

@freezed
class Prices with _$Prices {
  const factory Prices({
    String? name,
    String? fee,
    String? currency,
  }) = _Prices;

  factory Prices.fromJson(Map<String, Object?> json) => _$PricesFromJson(json);
}

@freezed
class Request with _$Request {
  const factory Request({
    String? imageUrl,
    String? name,
  }) = _Request;

  factory Request.fromJson(Map<String, Object?> json) =>
      _$RequestFromJson(json);
}

@freezed
class Ratings with _$Ratings {
  const factory Ratings({
    String? id,
    String? name,
    String? userId,
    String? imageUrl,
    String? description,
    double? rating,
    String? createdAt,
  }) = _Ratings;

  factory Ratings.fromJson(Map<String, Object?> json) =>
      _$RatingsFromJson(json);
}
