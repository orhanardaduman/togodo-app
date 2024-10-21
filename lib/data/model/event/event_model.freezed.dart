// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool? get likeStatus => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  int? get joinedUserCount => throw _privateConstructorUsedError;
  bool? get isQuotaFull => throw _privateConstructorUsedError;
  bool? get joinedStatus => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get ticketUrl => throw _privateConstructorUsedError;
  bool? get requestStatus => throw _privateConstructorUsedError;
  bool? get isCurrentUser => throw _privateConstructorUsedError;
  bool? get isClosedComment => throw _privateConstructorUsedError;
  bool? get openToJoinStatus => throw _privateConstructorUsedError;
  bool? get joinStatus => throw _privateConstructorUsedError;
  bool? get searching => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get ratingLenght => throw _privateConstructorUsedError;
  bool? get isPublish => throw _privateConstructorUsedError;
  bool? get isUserEvent => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  int? get shareCount => throw _privateConstructorUsedError;
  int? get participantsLimit => throw _privateConstructorUsedError;
  String? get aspectRatio => throw _privateConstructorUsedError;
  VendorDetails? get vendorDetails => throw _privateConstructorUsedError;
  List<JoinedUsers>? get joinedUsers => throw _privateConstructorUsedError;
  GroupRequestDetail? get groupRequest => throw _privateConstructorUsedError;
  EventGroups? get eventGroups => throw _privateConstructorUsedError;

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {String? id,
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
      bool? searching,
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
      EventGroups? eventGroups});

  $VendorDetailsCopyWith<$Res>? get vendorDetails;
  $GroupRequestDetailCopyWith<$Res>? get groupRequest;
  $EventGroupsCopyWith<$Res>? get eventGroups;
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? location = freezed,
    Object? date = freezed,
    Object? likeStatus = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? resolution = freezed,
    Object? joinedUserCount = freezed,
    Object? isQuotaFull = freezed,
    Object? joinedStatus = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? ticketUrl = freezed,
    Object? requestStatus = freezed,
    Object? isCurrentUser = freezed,
    Object? isClosedComment = freezed,
    Object? openToJoinStatus = freezed,
    Object? joinStatus = freezed,
    Object? searching = freezed,
    Object? rating = freezed,
    Object? ratingLenght = freezed,
    Object? isPublish = freezed,
    Object? isUserEvent = freezed,
    Object? likeCount = freezed,
    Object? shareCount = freezed,
    Object? participantsLimit = freezed,
    Object? aspectRatio = freezed,
    Object? vendorDetails = freezed,
    Object? joinedUsers = freezed,
    Object? groupRequest = freezed,
    Object? eventGroups = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      likeStatus: freezed == likeStatus
          ? _value.likeStatus
          : likeStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedUserCount: freezed == joinedUserCount
          ? _value.joinedUserCount
          : joinedUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isQuotaFull: freezed == isQuotaFull
          ? _value.isQuotaFull
          : isQuotaFull // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedStatus: freezed == joinedStatus
          ? _value.joinedStatus
          : joinedStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketUrl: freezed == ticketUrl
          ? _value.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requestStatus: freezed == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosedComment: freezed == isClosedComment
          ? _value.isClosedComment
          : isClosedComment // ignore: cast_nullable_to_non_nullable
              as bool?,
      openToJoinStatus: freezed == openToJoinStatus
          ? _value.openToJoinStatus
          : openToJoinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinStatus: freezed == joinStatus
          ? _value.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      searching: freezed == searching
          ? _value.searching
          : searching // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingLenght: freezed == ratingLenght
          ? _value.ratingLenght
          : ratingLenght // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUserEvent: freezed == isUserEvent
          ? _value.isUserEvent
          : isUserEvent // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      shareCount: freezed == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int?,
      participantsLimit: freezed == participantsLimit
          ? _value.participantsLimit
          : participantsLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      aspectRatio: freezed == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorDetails: freezed == vendorDetails
          ? _value.vendorDetails
          : vendorDetails // ignore: cast_nullable_to_non_nullable
              as VendorDetails?,
      joinedUsers: freezed == joinedUsers
          ? _value.joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<JoinedUsers>?,
      groupRequest: freezed == groupRequest
          ? _value.groupRequest
          : groupRequest // ignore: cast_nullable_to_non_nullable
              as GroupRequestDetail?,
      eventGroups: freezed == eventGroups
          ? _value.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as EventGroups?,
    ) as $Val);
  }

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorDetailsCopyWith<$Res>? get vendorDetails {
    if (_value.vendorDetails == null) {
      return null;
    }

    return $VendorDetailsCopyWith<$Res>(_value.vendorDetails!, (value) {
      return _then(_value.copyWith(vendorDetails: value) as $Val);
    });
  }

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupRequestDetailCopyWith<$Res>? get groupRequest {
    if (_value.groupRequest == null) {
      return null;
    }

    return $GroupRequestDetailCopyWith<$Res>(_value.groupRequest!, (value) {
      return _then(_value.copyWith(groupRequest: value) as $Val);
    });
  }

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventGroupsCopyWith<$Res>? get eventGroups {
    if (_value.eventGroups == null) {
      return null;
    }

    return $EventGroupsCopyWith<$Res>(_value.eventGroups!, (value) {
      return _then(_value.copyWith(eventGroups: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
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
      bool? searching,
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
      EventGroups? eventGroups});

  @override
  $VendorDetailsCopyWith<$Res>? get vendorDetails;
  @override
  $GroupRequestDetailCopyWith<$Res>? get groupRequest;
  @override
  $EventGroupsCopyWith<$Res>? get eventGroups;
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? location = freezed,
    Object? date = freezed,
    Object? likeStatus = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? resolution = freezed,
    Object? joinedUserCount = freezed,
    Object? isQuotaFull = freezed,
    Object? joinedStatus = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? ticketUrl = freezed,
    Object? requestStatus = freezed,
    Object? isCurrentUser = freezed,
    Object? isClosedComment = freezed,
    Object? openToJoinStatus = freezed,
    Object? joinStatus = freezed,
    Object? searching = freezed,
    Object? rating = freezed,
    Object? ratingLenght = freezed,
    Object? isPublish = freezed,
    Object? isUserEvent = freezed,
    Object? likeCount = freezed,
    Object? shareCount = freezed,
    Object? participantsLimit = freezed,
    Object? aspectRatio = freezed,
    Object? vendorDetails = freezed,
    Object? joinedUsers = freezed,
    Object? groupRequest = freezed,
    Object? eventGroups = freezed,
  }) {
    return _then(_$EventModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      likeStatus: freezed == likeStatus
          ? _value.likeStatus
          : likeStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedUserCount: freezed == joinedUserCount
          ? _value.joinedUserCount
          : joinedUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isQuotaFull: freezed == isQuotaFull
          ? _value.isQuotaFull
          : isQuotaFull // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedStatus: freezed == joinedStatus
          ? _value.joinedStatus
          : joinedStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketUrl: freezed == ticketUrl
          ? _value.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requestStatus: freezed == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosedComment: freezed == isClosedComment
          ? _value.isClosedComment
          : isClosedComment // ignore: cast_nullable_to_non_nullable
              as bool?,
      openToJoinStatus: freezed == openToJoinStatus
          ? _value.openToJoinStatus
          : openToJoinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinStatus: freezed == joinStatus
          ? _value.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      searching: freezed == searching
          ? _value.searching
          : searching // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingLenght: freezed == ratingLenght
          ? _value.ratingLenght
          : ratingLenght // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUserEvent: freezed == isUserEvent
          ? _value.isUserEvent
          : isUserEvent // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      shareCount: freezed == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int?,
      participantsLimit: freezed == participantsLimit
          ? _value.participantsLimit
          : participantsLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      aspectRatio: freezed == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorDetails: freezed == vendorDetails
          ? _value.vendorDetails
          : vendorDetails // ignore: cast_nullable_to_non_nullable
              as VendorDetails?,
      joinedUsers: freezed == joinedUsers
          ? _value._joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<JoinedUsers>?,
      groupRequest: freezed == groupRequest
          ? _value.groupRequest
          : groupRequest // ignore: cast_nullable_to_non_nullable
              as GroupRequestDetail?,
      eventGroups: freezed == eventGroups
          ? _value.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as EventGroups?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.location,
      this.date,
      this.likeStatus,
      this.startTime,
      this.endTime,
      this.resolution,
      this.joinedUserCount,
      this.isQuotaFull,
      this.joinedStatus,
      this.latitude,
      this.longitude,
      this.ticketUrl,
      this.requestStatus,
      this.isCurrentUser,
      this.isClosedComment,
      this.openToJoinStatus,
      this.joinStatus,
      this.searching,
      this.rating,
      this.ratingLenght,
      this.isPublish,
      this.isUserEvent,
      this.likeCount,
      this.shareCount,
      this.participantsLimit,
      this.aspectRatio,
      this.vendorDetails,
      final List<JoinedUsers>? joinedUsers,
      this.groupRequest,
      this.eventGroups})
      : _joinedUsers = joinedUsers;

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? location;
  @override
  final String? date;
  @override
  final bool? likeStatus;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? resolution;
  @override
  final int? joinedUserCount;
  @override
  final bool? isQuotaFull;
  @override
  final bool? joinedStatus;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  final String? ticketUrl;
  @override
  final bool? requestStatus;
  @override
  final bool? isCurrentUser;
  @override
  final bool? isClosedComment;
  @override
  final bool? openToJoinStatus;
  @override
  final bool? joinStatus;
  @override
  final bool? searching;
  @override
  final double? rating;
  @override
  final int? ratingLenght;
  @override
  final bool? isPublish;
  @override
  final bool? isUserEvent;
  @override
  final int? likeCount;
  @override
  final int? shareCount;
  @override
  final int? participantsLimit;
  @override
  final String? aspectRatio;
  @override
  final VendorDetails? vendorDetails;
  final List<JoinedUsers>? _joinedUsers;
  @override
  List<JoinedUsers>? get joinedUsers {
    final value = _joinedUsers;
    if (value == null) return null;
    if (_joinedUsers is EqualUnmodifiableListView) return _joinedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final GroupRequestDetail? groupRequest;
  @override
  final EventGroups? eventGroups;

  @override
  String toString() {
    return 'EventModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, location: $location, date: $date, likeStatus: $likeStatus, startTime: $startTime, endTime: $endTime, resolution: $resolution, joinedUserCount: $joinedUserCount, isQuotaFull: $isQuotaFull, joinedStatus: $joinedStatus, latitude: $latitude, longitude: $longitude, ticketUrl: $ticketUrl, requestStatus: $requestStatus, isCurrentUser: $isCurrentUser, isClosedComment: $isClosedComment, openToJoinStatus: $openToJoinStatus, joinStatus: $joinStatus, searching: $searching, rating: $rating, ratingLenght: $ratingLenght, isPublish: $isPublish, isUserEvent: $isUserEvent, likeCount: $likeCount, shareCount: $shareCount, participantsLimit: $participantsLimit, aspectRatio: $aspectRatio, vendorDetails: $vendorDetails, joinedUsers: $joinedUsers, groupRequest: $groupRequest, eventGroups: $eventGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.likeStatus, likeStatus) ||
                other.likeStatus == likeStatus) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.joinedUserCount, joinedUserCount) ||
                other.joinedUserCount == joinedUserCount) &&
            (identical(other.isQuotaFull, isQuotaFull) ||
                other.isQuotaFull == isQuotaFull) &&
            (identical(other.joinedStatus, joinedStatus) ||
                other.joinedStatus == joinedStatus) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.ticketUrl, ticketUrl) ||
                other.ticketUrl == ticketUrl) &&
            (identical(other.requestStatus, requestStatus) ||
                other.requestStatus == requestStatus) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.isClosedComment, isClosedComment) ||
                other.isClosedComment == isClosedComment) &&
            (identical(other.openToJoinStatus, openToJoinStatus) ||
                other.openToJoinStatus == openToJoinStatus) &&
            (identical(other.joinStatus, joinStatus) ||
                other.joinStatus == joinStatus) &&
            (identical(other.searching, searching) ||
                other.searching == searching) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingLenght, ratingLenght) ||
                other.ratingLenght == ratingLenght) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.isUserEvent, isUserEvent) ||
                other.isUserEvent == isUserEvent) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.shareCount, shareCount) ||
                other.shareCount == shareCount) &&
            (identical(other.participantsLimit, participantsLimit) ||
                other.participantsLimit == participantsLimit) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.vendorDetails, vendorDetails) ||
                other.vendorDetails == vendorDetails) &&
            const DeepCollectionEquality()
                .equals(other._joinedUsers, _joinedUsers) &&
            (identical(other.groupRequest, groupRequest) ||
                other.groupRequest == groupRequest) &&
            (identical(other.eventGroups, eventGroups) ||
                other.eventGroups == eventGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        imageUrl,
        location,
        date,
        likeStatus,
        startTime,
        endTime,
        resolution,
        joinedUserCount,
        isQuotaFull,
        joinedStatus,
        latitude,
        longitude,
        ticketUrl,
        requestStatus,
        isCurrentUser,
        isClosedComment,
        openToJoinStatus,
        joinStatus,
        searching,
        rating,
        ratingLenght,
        isPublish,
        isUserEvent,
        likeCount,
        shareCount,
        participantsLimit,
        aspectRatio,
        vendorDetails,
        const DeepCollectionEquality().hash(_joinedUsers),
        groupRequest,
        eventGroups
      ]);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {final String? id,
      final String? name,
      final String? description,
      final String? imageUrl,
      final String? location,
      final String? date,
      final bool? likeStatus,
      final String? startTime,
      final String? endTime,
      final String? resolution,
      final int? joinedUserCount,
      final bool? isQuotaFull,
      final bool? joinedStatus,
      final String? latitude,
      final String? longitude,
      final String? ticketUrl,
      final bool? requestStatus,
      final bool? isCurrentUser,
      final bool? isClosedComment,
      final bool? openToJoinStatus,
      final bool? joinStatus,
      final bool? searching,
      final double? rating,
      final int? ratingLenght,
      final bool? isPublish,
      final bool? isUserEvent,
      final int? likeCount,
      final int? shareCount,
      final int? participantsLimit,
      final String? aspectRatio,
      final VendorDetails? vendorDetails,
      final List<JoinedUsers>? joinedUsers,
      final GroupRequestDetail? groupRequest,
      final EventGroups? eventGroups}) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  String? get location;
  @override
  String? get date;
  @override
  bool? get likeStatus;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get resolution;
  @override
  int? get joinedUserCount;
  @override
  bool? get isQuotaFull;
  @override
  bool? get joinedStatus;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  String? get ticketUrl;
  @override
  bool? get requestStatus;
  @override
  bool? get isCurrentUser;
  @override
  bool? get isClosedComment;
  @override
  bool? get openToJoinStatus;
  @override
  bool? get joinStatus;
  @override
  bool? get searching;
  @override
  double? get rating;
  @override
  int? get ratingLenght;
  @override
  bool? get isPublish;
  @override
  bool? get isUserEvent;
  @override
  int? get likeCount;
  @override
  int? get shareCount;
  @override
  int? get participantsLimit;
  @override
  String? get aspectRatio;
  @override
  VendorDetails? get vendorDetails;
  @override
  List<JoinedUsers>? get joinedUsers;
  @override
  GroupRequestDetail? get groupRequest;
  @override
  EventGroups? get eventGroups;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorDetails _$VendorDetailsFromJson(Map<String, dynamic> json) {
  return _VendorDetails.fromJson(json);
}

/// @nodoc
mixin _$VendorDetails {
  bool? get isUserEvent => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this VendorDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorDetailsCopyWith<VendorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorDetailsCopyWith<$Res> {
  factory $VendorDetailsCopyWith(
          VendorDetails value, $Res Function(VendorDetails) then) =
      _$VendorDetailsCopyWithImpl<$Res, VendorDetails>;
  @useResult
  $Res call(
      {bool? isUserEvent,
      String? id,
      String? name,
      String? surname,
      String? imageUrl});
}

/// @nodoc
class _$VendorDetailsCopyWithImpl<$Res, $Val extends VendorDetails>
    implements $VendorDetailsCopyWith<$Res> {
  _$VendorDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUserEvent = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isUserEvent: freezed == isUserEvent
          ? _value.isUserEvent
          : isUserEvent // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorDetailsImplCopyWith<$Res>
    implements $VendorDetailsCopyWith<$Res> {
  factory _$$VendorDetailsImplCopyWith(
          _$VendorDetailsImpl value, $Res Function(_$VendorDetailsImpl) then) =
      __$$VendorDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isUserEvent,
      String? id,
      String? name,
      String? surname,
      String? imageUrl});
}

/// @nodoc
class __$$VendorDetailsImplCopyWithImpl<$Res>
    extends _$VendorDetailsCopyWithImpl<$Res, _$VendorDetailsImpl>
    implements _$$VendorDetailsImplCopyWith<$Res> {
  __$$VendorDetailsImplCopyWithImpl(
      _$VendorDetailsImpl _value, $Res Function(_$VendorDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUserEvent = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$VendorDetailsImpl(
      isUserEvent: freezed == isUserEvent
          ? _value.isUserEvent
          : isUserEvent // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorDetailsImpl implements _VendorDetails {
  const _$VendorDetailsImpl(
      {this.isUserEvent, this.id, this.name, this.surname, this.imageUrl});

  factory _$VendorDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorDetailsImplFromJson(json);

  @override
  final bool? isUserEvent;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'VendorDetails(isUserEvent: $isUserEvent, id: $id, name: $name, surname: $surname, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorDetailsImpl &&
            (identical(other.isUserEvent, isUserEvent) ||
                other.isUserEvent == isUserEvent) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isUserEvent, id, name, surname, imageUrl);

  /// Create a copy of VendorDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorDetailsImplCopyWith<_$VendorDetailsImpl> get copyWith =>
      __$$VendorDetailsImplCopyWithImpl<_$VendorDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorDetailsImplToJson(
      this,
    );
  }
}

abstract class _VendorDetails implements VendorDetails {
  const factory _VendorDetails(
      {final bool? isUserEvent,
      final String? id,
      final String? name,
      final String? surname,
      final String? imageUrl}) = _$VendorDetailsImpl;

  factory _VendorDetails.fromJson(Map<String, dynamic> json) =
      _$VendorDetailsImpl.fromJson;

  @override
  bool? get isUserEvent;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get surname;
  @override
  String? get imageUrl;

  /// Create a copy of VendorDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorDetailsImplCopyWith<_$VendorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupRequestDetail _$GroupRequestDetailFromJson(Map<String, dynamic> json) {
  return _GroupRequestDetail.fromJson(json);
}

/// @nodoc
mixin _$GroupRequestDetail {
  String? get id => throw _privateConstructorUsedError;
  bool? get isStatisfied => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  GroupUsers? get aspNetUsers => throw _privateConstructorUsedError;

  /// Serializes this GroupRequestDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupRequestDetailCopyWith<GroupRequestDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupRequestDetailCopyWith<$Res> {
  factory $GroupRequestDetailCopyWith(
          GroupRequestDetail value, $Res Function(GroupRequestDetail) then) =
      _$GroupRequestDetailCopyWithImpl<$Res, GroupRequestDetail>;
  @useResult
  $Res call(
      {String? id,
      bool? isStatisfied,
      bool? isDeleted,
      String? eventId,
      GroupUsers? aspNetUsers});

  $GroupUsersCopyWith<$Res>? get aspNetUsers;
}

/// @nodoc
class _$GroupRequestDetailCopyWithImpl<$Res, $Val extends GroupRequestDetail>
    implements $GroupRequestDetailCopyWith<$Res> {
  _$GroupRequestDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isStatisfied = freezed,
    Object? isDeleted = freezed,
    Object? eventId = freezed,
    Object? aspNetUsers = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isStatisfied: freezed == isStatisfied
          ? _value.isStatisfied
          : isStatisfied // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      aspNetUsers: freezed == aspNetUsers
          ? _value.aspNetUsers
          : aspNetUsers // ignore: cast_nullable_to_non_nullable
              as GroupUsers?,
    ) as $Val);
  }

  /// Create a copy of GroupRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupUsersCopyWith<$Res>? get aspNetUsers {
    if (_value.aspNetUsers == null) {
      return null;
    }

    return $GroupUsersCopyWith<$Res>(_value.aspNetUsers!, (value) {
      return _then(_value.copyWith(aspNetUsers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupRequestDetailImplCopyWith<$Res>
    implements $GroupRequestDetailCopyWith<$Res> {
  factory _$$GroupRequestDetailImplCopyWith(_$GroupRequestDetailImpl value,
          $Res Function(_$GroupRequestDetailImpl) then) =
      __$$GroupRequestDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      bool? isStatisfied,
      bool? isDeleted,
      String? eventId,
      GroupUsers? aspNetUsers});

  @override
  $GroupUsersCopyWith<$Res>? get aspNetUsers;
}

/// @nodoc
class __$$GroupRequestDetailImplCopyWithImpl<$Res>
    extends _$GroupRequestDetailCopyWithImpl<$Res, _$GroupRequestDetailImpl>
    implements _$$GroupRequestDetailImplCopyWith<$Res> {
  __$$GroupRequestDetailImplCopyWithImpl(_$GroupRequestDetailImpl _value,
      $Res Function(_$GroupRequestDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isStatisfied = freezed,
    Object? isDeleted = freezed,
    Object? eventId = freezed,
    Object? aspNetUsers = freezed,
  }) {
    return _then(_$GroupRequestDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isStatisfied: freezed == isStatisfied
          ? _value.isStatisfied
          : isStatisfied // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      aspNetUsers: freezed == aspNetUsers
          ? _value.aspNetUsers
          : aspNetUsers // ignore: cast_nullable_to_non_nullable
              as GroupUsers?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupRequestDetailImpl implements _GroupRequestDetail {
  const _$GroupRequestDetailImpl(
      {this.id,
      this.isStatisfied,
      this.isDeleted,
      this.eventId,
      this.aspNetUsers});

  factory _$GroupRequestDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupRequestDetailImplFromJson(json);

  @override
  final String? id;
  @override
  final bool? isStatisfied;
  @override
  final bool? isDeleted;
  @override
  final String? eventId;
  @override
  final GroupUsers? aspNetUsers;

  @override
  String toString() {
    return 'GroupRequestDetail(id: $id, isStatisfied: $isStatisfied, isDeleted: $isDeleted, eventId: $eventId, aspNetUsers: $aspNetUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupRequestDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isStatisfied, isStatisfied) ||
                other.isStatisfied == isStatisfied) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.aspNetUsers, aspNetUsers) ||
                other.aspNetUsers == aspNetUsers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, isStatisfied, isDeleted, eventId, aspNetUsers);

  /// Create a copy of GroupRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupRequestDetailImplCopyWith<_$GroupRequestDetailImpl> get copyWith =>
      __$$GroupRequestDetailImplCopyWithImpl<_$GroupRequestDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupRequestDetailImplToJson(
      this,
    );
  }
}

abstract class _GroupRequestDetail implements GroupRequestDetail {
  const factory _GroupRequestDetail(
      {final String? id,
      final bool? isStatisfied,
      final bool? isDeleted,
      final String? eventId,
      final GroupUsers? aspNetUsers}) = _$GroupRequestDetailImpl;

  factory _GroupRequestDetail.fromJson(Map<String, dynamic> json) =
      _$GroupRequestDetailImpl.fromJson;

  @override
  String? get id;
  @override
  bool? get isStatisfied;
  @override
  bool? get isDeleted;
  @override
  String? get eventId;
  @override
  GroupUsers? get aspNetUsers;

  /// Create a copy of GroupRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupRequestDetailImplCopyWith<_$GroupRequestDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupRequestCreateData _$GroupRequestCreateDataFromJson(
    Map<String, dynamic> json) {
  return _GroupRequestCreateData.fromJson(json);
}

/// @nodoc
mixin _$GroupRequestCreateData {
  GroupRequestDetail? get groupRequest => throw _privateConstructorUsedError;
  EventGroups? get eventGroups => throw _privateConstructorUsedError;

  /// Serializes this GroupRequestCreateData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupRequestCreateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupRequestCreateDataCopyWith<GroupRequestCreateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupRequestCreateDataCopyWith<$Res> {
  factory $GroupRequestCreateDataCopyWith(GroupRequestCreateData value,
          $Res Function(GroupRequestCreateData) then) =
      _$GroupRequestCreateDataCopyWithImpl<$Res, GroupRequestCreateData>;
  @useResult
  $Res call({GroupRequestDetail? groupRequest, EventGroups? eventGroups});

  $GroupRequestDetailCopyWith<$Res>? get groupRequest;
  $EventGroupsCopyWith<$Res>? get eventGroups;
}

/// @nodoc
class _$GroupRequestCreateDataCopyWithImpl<$Res,
        $Val extends GroupRequestCreateData>
    implements $GroupRequestCreateDataCopyWith<$Res> {
  _$GroupRequestCreateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupRequestCreateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupRequest = freezed,
    Object? eventGroups = freezed,
  }) {
    return _then(_value.copyWith(
      groupRequest: freezed == groupRequest
          ? _value.groupRequest
          : groupRequest // ignore: cast_nullable_to_non_nullable
              as GroupRequestDetail?,
      eventGroups: freezed == eventGroups
          ? _value.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as EventGroups?,
    ) as $Val);
  }

  /// Create a copy of GroupRequestCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupRequestDetailCopyWith<$Res>? get groupRequest {
    if (_value.groupRequest == null) {
      return null;
    }

    return $GroupRequestDetailCopyWith<$Res>(_value.groupRequest!, (value) {
      return _then(_value.copyWith(groupRequest: value) as $Val);
    });
  }

  /// Create a copy of GroupRequestCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventGroupsCopyWith<$Res>? get eventGroups {
    if (_value.eventGroups == null) {
      return null;
    }

    return $EventGroupsCopyWith<$Res>(_value.eventGroups!, (value) {
      return _then(_value.copyWith(eventGroups: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupRequestCreateDataImplCopyWith<$Res>
    implements $GroupRequestCreateDataCopyWith<$Res> {
  factory _$$GroupRequestCreateDataImplCopyWith(
          _$GroupRequestCreateDataImpl value,
          $Res Function(_$GroupRequestCreateDataImpl) then) =
      __$$GroupRequestCreateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GroupRequestDetail? groupRequest, EventGroups? eventGroups});

  @override
  $GroupRequestDetailCopyWith<$Res>? get groupRequest;
  @override
  $EventGroupsCopyWith<$Res>? get eventGroups;
}

/// @nodoc
class __$$GroupRequestCreateDataImplCopyWithImpl<$Res>
    extends _$GroupRequestCreateDataCopyWithImpl<$Res,
        _$GroupRequestCreateDataImpl>
    implements _$$GroupRequestCreateDataImplCopyWith<$Res> {
  __$$GroupRequestCreateDataImplCopyWithImpl(
      _$GroupRequestCreateDataImpl _value,
      $Res Function(_$GroupRequestCreateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupRequestCreateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupRequest = freezed,
    Object? eventGroups = freezed,
  }) {
    return _then(_$GroupRequestCreateDataImpl(
      groupRequest: freezed == groupRequest
          ? _value.groupRequest
          : groupRequest // ignore: cast_nullable_to_non_nullable
              as GroupRequestDetail?,
      eventGroups: freezed == eventGroups
          ? _value.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as EventGroups?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupRequestCreateDataImpl implements _GroupRequestCreateData {
  const _$GroupRequestCreateDataImpl({this.groupRequest, this.eventGroups});

  factory _$GroupRequestCreateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupRequestCreateDataImplFromJson(json);

  @override
  final GroupRequestDetail? groupRequest;
  @override
  final EventGroups? eventGroups;

  @override
  String toString() {
    return 'GroupRequestCreateData(groupRequest: $groupRequest, eventGroups: $eventGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupRequestCreateDataImpl &&
            (identical(other.groupRequest, groupRequest) ||
                other.groupRequest == groupRequest) &&
            (identical(other.eventGroups, eventGroups) ||
                other.eventGroups == eventGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupRequest, eventGroups);

  /// Create a copy of GroupRequestCreateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupRequestCreateDataImplCopyWith<_$GroupRequestCreateDataImpl>
      get copyWith => __$$GroupRequestCreateDataImplCopyWithImpl<
          _$GroupRequestCreateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupRequestCreateDataImplToJson(
      this,
    );
  }
}

abstract class _GroupRequestCreateData implements GroupRequestCreateData {
  const factory _GroupRequestCreateData(
      {final GroupRequestDetail? groupRequest,
      final EventGroups? eventGroups}) = _$GroupRequestCreateDataImpl;

  factory _GroupRequestCreateData.fromJson(Map<String, dynamic> json) =
      _$GroupRequestCreateDataImpl.fromJson;

  @override
  GroupRequestDetail? get groupRequest;
  @override
  EventGroups? get eventGroups;

  /// Create a copy of GroupRequestCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupRequestCreateDataImplCopyWith<_$GroupRequestCreateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GroupUsers _$GroupUsersFromJson(Map<String, dynamic> json) {
  return _GroupUsers.fromJson(json);
}

/// @nodoc
mixin _$GroupUsers {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this GroupUsers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupUsersCopyWith<GroupUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupUsersCopyWith<$Res> {
  factory $GroupUsersCopyWith(
          GroupUsers value, $Res Function(GroupUsers) then) =
      _$GroupUsersCopyWithImpl<$Res, GroupUsers>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? surname,
      String? imageUrl,
      String? title});
}

/// @nodoc
class _$GroupUsersCopyWithImpl<$Res, $Val extends GroupUsers>
    implements $GroupUsersCopyWith<$Res> {
  _$GroupUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupUsersImplCopyWith<$Res>
    implements $GroupUsersCopyWith<$Res> {
  factory _$$GroupUsersImplCopyWith(
          _$GroupUsersImpl value, $Res Function(_$GroupUsersImpl) then) =
      __$$GroupUsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? surname,
      String? imageUrl,
      String? title});
}

/// @nodoc
class __$$GroupUsersImplCopyWithImpl<$Res>
    extends _$GroupUsersCopyWithImpl<$Res, _$GroupUsersImpl>
    implements _$$GroupUsersImplCopyWith<$Res> {
  __$$GroupUsersImplCopyWithImpl(
      _$GroupUsersImpl _value, $Res Function(_$GroupUsersImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
  }) {
    return _then(_$GroupUsersImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupUsersImpl implements _GroupUsers {
  const _$GroupUsersImpl(
      {this.id, this.name, this.surname, this.imageUrl, this.title});

  factory _$GroupUsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupUsersImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? imageUrl;
  @override
  final String? title;

  @override
  String toString() {
    return 'GroupUsers(id: $id, name: $name, surname: $surname, imageUrl: $imageUrl, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupUsersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, surname, imageUrl, title);

  /// Create a copy of GroupUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupUsersImplCopyWith<_$GroupUsersImpl> get copyWith =>
      __$$GroupUsersImplCopyWithImpl<_$GroupUsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupUsersImplToJson(
      this,
    );
  }
}

abstract class _GroupUsers implements GroupUsers {
  const factory _GroupUsers(
      {final String? id,
      final String? name,
      final String? surname,
      final String? imageUrl,
      final String? title}) = _$GroupUsersImpl;

  factory _GroupUsers.fromJson(Map<String, dynamic> json) =
      _$GroupUsersImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get surname;
  @override
  String? get imageUrl;
  @override
  String? get title;

  /// Create a copy of GroupUsers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupUsersImplCopyWith<_$GroupUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventGroups _$EventGroupsFromJson(Map<String, dynamic> json) {
  return _EventGroups.fromJson(json);
}

/// @nodoc
mixin _$EventGroups {
  String? get id => throw _privateConstructorUsedError;
  List<GroupRequestDetail>? get requests => throw _privateConstructorUsedError;
  EventModel? get event => throw _privateConstructorUsedError;

  /// Serializes this EventGroups to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventGroups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventGroupsCopyWith<EventGroups> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventGroupsCopyWith<$Res> {
  factory $EventGroupsCopyWith(
          EventGroups value, $Res Function(EventGroups) then) =
      _$EventGroupsCopyWithImpl<$Res, EventGroups>;
  @useResult
  $Res call(
      {String? id, List<GroupRequestDetail>? requests, EventModel? event});

  $EventModelCopyWith<$Res>? get event;
}

/// @nodoc
class _$EventGroupsCopyWithImpl<$Res, $Val extends EventGroups>
    implements $EventGroupsCopyWith<$Res> {
  _$EventGroupsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventGroups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? requests = freezed,
    Object? event = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      requests: freezed == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<GroupRequestDetail>?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventModel?,
    ) as $Val);
  }

  /// Create a copy of EventGroups
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventModelCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventModelCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventGroupsImplCopyWith<$Res>
    implements $EventGroupsCopyWith<$Res> {
  factory _$$EventGroupsImplCopyWith(
          _$EventGroupsImpl value, $Res Function(_$EventGroupsImpl) then) =
      __$$EventGroupsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, List<GroupRequestDetail>? requests, EventModel? event});

  @override
  $EventModelCopyWith<$Res>? get event;
}

/// @nodoc
class __$$EventGroupsImplCopyWithImpl<$Res>
    extends _$EventGroupsCopyWithImpl<$Res, _$EventGroupsImpl>
    implements _$$EventGroupsImplCopyWith<$Res> {
  __$$EventGroupsImplCopyWithImpl(
      _$EventGroupsImpl _value, $Res Function(_$EventGroupsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventGroups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? requests = freezed,
    Object? event = freezed,
  }) {
    return _then(_$EventGroupsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      requests: freezed == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<GroupRequestDetail>?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventGroupsImpl implements _EventGroups {
  const _$EventGroupsImpl(
      {this.id, final List<GroupRequestDetail>? requests, this.event})
      : _requests = requests;

  factory _$EventGroupsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventGroupsImplFromJson(json);

  @override
  final String? id;
  final List<GroupRequestDetail>? _requests;
  @override
  List<GroupRequestDetail>? get requests {
    final value = _requests;
    if (value == null) return null;
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final EventModel? event;

  @override
  String toString() {
    return 'EventGroups(id: $id, requests: $requests, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventGroupsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._requests, _requests) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_requests), event);

  /// Create a copy of EventGroups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventGroupsImplCopyWith<_$EventGroupsImpl> get copyWith =>
      __$$EventGroupsImplCopyWithImpl<_$EventGroupsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventGroupsImplToJson(
      this,
    );
  }
}

abstract class _EventGroups implements EventGroups {
  const factory _EventGroups(
      {final String? id,
      final List<GroupRequestDetail>? requests,
      final EventModel? event}) = _$EventGroupsImpl;

  factory _EventGroups.fromJson(Map<String, dynamic> json) =
      _$EventGroupsImpl.fromJson;

  @override
  String? get id;
  @override
  List<GroupRequestDetail>? get requests;
  @override
  EventModel? get event;

  /// Create a copy of EventGroups
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventGroupsImplCopyWith<_$EventGroupsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JoinedUsers _$JoinedUsersFromJson(Map<String, dynamic> json) {
  return _JoinedUsers.fromJson(json);
}

/// @nodoc
mixin _$JoinedUsers {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this JoinedUsers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JoinedUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JoinedUsersCopyWith<JoinedUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinedUsersCopyWith<$Res> {
  factory $JoinedUsersCopyWith(
          JoinedUsers value, $Res Function(JoinedUsers) then) =
      _$JoinedUsersCopyWithImpl<$Res, JoinedUsers>;
  @useResult
  $Res call({String? imageUrl, String? name, String? userId});
}

/// @nodoc
class _$JoinedUsersCopyWithImpl<$Res, $Val extends JoinedUsers>
    implements $JoinedUsersCopyWith<$Res> {
  _$JoinedUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinedUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinedUsersImplCopyWith<$Res>
    implements $JoinedUsersCopyWith<$Res> {
  factory _$$JoinedUsersImplCopyWith(
          _$JoinedUsersImpl value, $Res Function(_$JoinedUsersImpl) then) =
      __$$JoinedUsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageUrl, String? name, String? userId});
}

/// @nodoc
class __$$JoinedUsersImplCopyWithImpl<$Res>
    extends _$JoinedUsersCopyWithImpl<$Res, _$JoinedUsersImpl>
    implements _$$JoinedUsersImplCopyWith<$Res> {
  __$$JoinedUsersImplCopyWithImpl(
      _$JoinedUsersImpl _value, $Res Function(_$JoinedUsersImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinedUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$JoinedUsersImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinedUsersImpl implements _JoinedUsers {
  const _$JoinedUsersImpl({this.imageUrl, this.name, this.userId});

  factory _$JoinedUsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinedUsersImplFromJson(json);

  @override
  final String? imageUrl;
  @override
  final String? name;
  @override
  final String? userId;

  @override
  String toString() {
    return 'JoinedUsers(imageUrl: $imageUrl, name: $name, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinedUsersImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, name, userId);

  /// Create a copy of JoinedUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinedUsersImplCopyWith<_$JoinedUsersImpl> get copyWith =>
      __$$JoinedUsersImplCopyWithImpl<_$JoinedUsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinedUsersImplToJson(
      this,
    );
  }
}

abstract class _JoinedUsers implements JoinedUsers {
  const factory _JoinedUsers(
      {final String? imageUrl,
      final String? name,
      final String? userId}) = _$JoinedUsersImpl;

  factory _JoinedUsers.fromJson(Map<String, dynamic> json) =
      _$JoinedUsersImpl.fromJson;

  @override
  String? get imageUrl;
  @override
  String? get name;
  @override
  String? get userId;

  /// Create a copy of JoinedUsers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinedUsersImplCopyWith<_$JoinedUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
