import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';

part 'discovery_map_model.freezed.dart';
part 'discovery_map_model.g.dart';

@freezed
class DiscoveryMapModel
    with _$DiscoveryMapModel
    implements EventCommonProperties {
  const factory DiscoveryMapModel({
    String? id,
    String? name,
    String? city,
    String? district,
    String? description,
    String? imageUrl,
    String? location,
    String? date,
    String? createdAt,
    String? resolution,
    bool? likeStatus,
    String? latitude,
    String? longitude,
    bool? isUserEvent,
    String? address,
    String? ticketUrl,
    int? joinedUserCount,
    String? startTime,
    String? endTime,
    bool? joinedStatus,
    bool? openToJoinStatus,
    bool? isClosedComment,
    bool? requestStatus,
    bool? isQuotaFull,
    bool? isCurrentUser,
    int? ratingLenght,
    double? rating,
    int? likeCount,
    int? shareCount,
    VendorDetails? vendorDetails,
    List<JoinedUsers>? joinedUsers,
    List<TagsModel>? tags,
  }) = _DiscoveryMapModel;

  factory DiscoveryMapModel.fromJson(Map<String, Object?> json) =>
      _$DiscoveryMapModelFromJson(json);
}
