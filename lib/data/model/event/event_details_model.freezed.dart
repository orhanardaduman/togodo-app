// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventDetailsModel _$EventDetailsModelFromJson(Map<String, dynamic> json) {
  return _EventDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$EventDetailsModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool? get likeStatus => throw _privateConstructorUsedError;
  bool? get joinStatus => throw _privateConstructorUsedError;
  int? get joinedUserCount => throw _privateConstructorUsedError;
  bool? get joinedStatus => throw _privateConstructorUsedError;
  bool? get isCurrentUser => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  bool? get isPrice => throw _privateConstructorUsedError;
  bool? get isQuotaFull => throw _privateConstructorUsedError;
  bool? get isPublish => throw _privateConstructorUsedError;
  bool? get requestStatus => throw _privateConstructorUsedError;
  bool? get isParticipants => throw _privateConstructorUsedError;
  bool? get isContract => throw _privateConstructorUsedError;
  bool? get isUserEvent => throw _privateConstructorUsedError;
  bool? get isClosedComment => throw _privateConstructorUsedError;
  bool? get openToJoinStatus => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  int? get participantsLimit => throw _privateConstructorUsedError;
  int? get shareCount => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get ticketUrl => throw _privateConstructorUsedError;
  String? get onlineUrl => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get mapLink => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get ratingLenght => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  VendorDetails? get vendorDetails => throw _privateConstructorUsedError;
  List<JoinedUsers>? get joinedUsers => throw _privateConstructorUsedError;
  List<Images>? get images => throw _privateConstructorUsedError;
  List<TagsModel>? get tags => throw _privateConstructorUsedError;
  List<Prices>? get prices => throw _privateConstructorUsedError;
  List<EventCommentModel>? get eventComment =>
      throw _privateConstructorUsedError;
  List<Request>? get request => throw _privateConstructorUsedError;
  List<Ratings>? get ratings => throw _privateConstructorUsedError;
  int? get sortNumber => throw _privateConstructorUsedError;
  EventGroups? get eventGroups => throw _privateConstructorUsedError;
  GroupRequestDetail? get groupRequest => throw _privateConstructorUsedError;

  /// Serializes this EventDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDetailsModelCopyWith<EventDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailsModelCopyWith<$Res> {
  factory $EventDetailsModelCopyWith(
          EventDetailsModel value, $Res Function(EventDetailsModel) then) =
      _$EventDetailsModelCopyWithImpl<$Res, EventDetailsModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? imageUrl,
      String? location,
      String? date,
      bool? likeStatus,
      bool? joinStatus,
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
      GroupRequestDetail? groupRequest});

  $VendorDetailsCopyWith<$Res>? get vendorDetails;
  $EventGroupsCopyWith<$Res>? get eventGroups;
  $GroupRequestDetailCopyWith<$Res>? get groupRequest;
}

/// @nodoc
class _$EventDetailsModelCopyWithImpl<$Res, $Val extends EventDetailsModel>
    implements $EventDetailsModelCopyWith<$Res> {
  _$EventDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDetailsModel
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
    Object? joinStatus = freezed,
    Object? joinedUserCount = freezed,
    Object? joinedStatus = freezed,
    Object? isCurrentUser = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? resolution = freezed,
    Object? isPrice = freezed,
    Object? isQuotaFull = freezed,
    Object? isPublish = freezed,
    Object? requestStatus = freezed,
    Object? isParticipants = freezed,
    Object? isContract = freezed,
    Object? isUserEvent = freezed,
    Object? isClosedComment = freezed,
    Object? openToJoinStatus = freezed,
    Object? likeCount = freezed,
    Object? participantsLimit = freezed,
    Object? shareCount = freezed,
    Object? price = freezed,
    Object? ticketUrl = freezed,
    Object? onlineUrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? mapLink = freezed,
    Object? address = freezed,
    Object? ratingLenght = freezed,
    Object? rating = freezed,
    Object? vendorDetails = freezed,
    Object? joinedUsers = freezed,
    Object? images = freezed,
    Object? tags = freezed,
    Object? prices = freezed,
    Object? eventComment = freezed,
    Object? request = freezed,
    Object? ratings = freezed,
    Object? sortNumber = freezed,
    Object? eventGroups = freezed,
    Object? groupRequest = freezed,
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
      joinStatus: freezed == joinStatus
          ? _value.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedUserCount: freezed == joinedUserCount
          ? _value.joinedUserCount
          : joinedUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      joinedStatus: freezed == joinedStatus
          ? _value.joinedStatus
          : joinedStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
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
      isPrice: freezed == isPrice
          ? _value.isPrice
          : isPrice // ignore: cast_nullable_to_non_nullable
              as bool?,
      isQuotaFull: freezed == isQuotaFull
          ? _value.isQuotaFull
          : isQuotaFull // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      requestStatus: freezed == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isParticipants: freezed == isParticipants
          ? _value.isParticipants
          : isParticipants // ignore: cast_nullable_to_non_nullable
              as bool?,
      isContract: freezed == isContract
          ? _value.isContract
          : isContract // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUserEvent: freezed == isUserEvent
          ? _value.isUserEvent
          : isUserEvent // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosedComment: freezed == isClosedComment
          ? _value.isClosedComment
          : isClosedComment // ignore: cast_nullable_to_non_nullable
              as bool?,
      openToJoinStatus: freezed == openToJoinStatus
          ? _value.openToJoinStatus
          : openToJoinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      participantsLimit: freezed == participantsLimit
          ? _value.participantsLimit
          : participantsLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      shareCount: freezed == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketUrl: freezed == ticketUrl
          ? _value.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineUrl: freezed == onlineUrl
          ? _value.onlineUrl
          : onlineUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      mapLink: freezed == mapLink
          ? _value.mapLink
          : mapLink // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingLenght: freezed == ratingLenght
          ? _value.ratingLenght
          : ratingLenght // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      vendorDetails: freezed == vendorDetails
          ? _value.vendorDetails
          : vendorDetails // ignore: cast_nullable_to_non_nullable
              as VendorDetails?,
      joinedUsers: freezed == joinedUsers
          ? _value.joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<JoinedUsers>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Prices>?,
      eventComment: freezed == eventComment
          ? _value.eventComment
          : eventComment // ignore: cast_nullable_to_non_nullable
              as List<EventCommentModel>?,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as List<Request>?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Ratings>?,
      sortNumber: freezed == sortNumber
          ? _value.sortNumber
          : sortNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      eventGroups: freezed == eventGroups
          ? _value.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as EventGroups?,
      groupRequest: freezed == groupRequest
          ? _value.groupRequest
          : groupRequest // ignore: cast_nullable_to_non_nullable
              as GroupRequestDetail?,
    ) as $Val);
  }

  /// Create a copy of EventDetailsModel
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

  /// Create a copy of EventDetailsModel
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

  /// Create a copy of EventDetailsModel
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
}

/// @nodoc
abstract class _$$EventDetailsModelImplCopyWith<$Res>
    implements $EventDetailsModelCopyWith<$Res> {
  factory _$$EventDetailsModelImplCopyWith(_$EventDetailsModelImpl value,
          $Res Function(_$EventDetailsModelImpl) then) =
      __$$EventDetailsModelImplCopyWithImpl<$Res>;
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
      bool? joinStatus,
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
      GroupRequestDetail? groupRequest});

  @override
  $VendorDetailsCopyWith<$Res>? get vendorDetails;
  @override
  $EventGroupsCopyWith<$Res>? get eventGroups;
  @override
  $GroupRequestDetailCopyWith<$Res>? get groupRequest;
}

/// @nodoc
class __$$EventDetailsModelImplCopyWithImpl<$Res>
    extends _$EventDetailsModelCopyWithImpl<$Res, _$EventDetailsModelImpl>
    implements _$$EventDetailsModelImplCopyWith<$Res> {
  __$$EventDetailsModelImplCopyWithImpl(_$EventDetailsModelImpl _value,
      $Res Function(_$EventDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDetailsModel
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
    Object? joinStatus = freezed,
    Object? joinedUserCount = freezed,
    Object? joinedStatus = freezed,
    Object? isCurrentUser = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? resolution = freezed,
    Object? isPrice = freezed,
    Object? isQuotaFull = freezed,
    Object? isPublish = freezed,
    Object? requestStatus = freezed,
    Object? isParticipants = freezed,
    Object? isContract = freezed,
    Object? isUserEvent = freezed,
    Object? isClosedComment = freezed,
    Object? openToJoinStatus = freezed,
    Object? likeCount = freezed,
    Object? participantsLimit = freezed,
    Object? shareCount = freezed,
    Object? price = freezed,
    Object? ticketUrl = freezed,
    Object? onlineUrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? mapLink = freezed,
    Object? address = freezed,
    Object? ratingLenght = freezed,
    Object? rating = freezed,
    Object? vendorDetails = freezed,
    Object? joinedUsers = freezed,
    Object? images = freezed,
    Object? tags = freezed,
    Object? prices = freezed,
    Object? eventComment = freezed,
    Object? request = freezed,
    Object? ratings = freezed,
    Object? sortNumber = freezed,
    Object? eventGroups = freezed,
    Object? groupRequest = freezed,
  }) {
    return _then(_$EventDetailsModelImpl(
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
      joinStatus: freezed == joinStatus
          ? _value.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedUserCount: freezed == joinedUserCount
          ? _value.joinedUserCount
          : joinedUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      joinedStatus: freezed == joinedStatus
          ? _value.joinedStatus
          : joinedStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
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
      isPrice: freezed == isPrice
          ? _value.isPrice
          : isPrice // ignore: cast_nullable_to_non_nullable
              as bool?,
      isQuotaFull: freezed == isQuotaFull
          ? _value.isQuotaFull
          : isQuotaFull // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      requestStatus: freezed == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isParticipants: freezed == isParticipants
          ? _value.isParticipants
          : isParticipants // ignore: cast_nullable_to_non_nullable
              as bool?,
      isContract: freezed == isContract
          ? _value.isContract
          : isContract // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUserEvent: freezed == isUserEvent
          ? _value.isUserEvent
          : isUserEvent // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosedComment: freezed == isClosedComment
          ? _value.isClosedComment
          : isClosedComment // ignore: cast_nullable_to_non_nullable
              as bool?,
      openToJoinStatus: freezed == openToJoinStatus
          ? _value.openToJoinStatus
          : openToJoinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      participantsLimit: freezed == participantsLimit
          ? _value.participantsLimit
          : participantsLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      shareCount: freezed == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketUrl: freezed == ticketUrl
          ? _value.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineUrl: freezed == onlineUrl
          ? _value.onlineUrl
          : onlineUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      mapLink: freezed == mapLink
          ? _value.mapLink
          : mapLink // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingLenght: freezed == ratingLenght
          ? _value.ratingLenght
          : ratingLenght // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      vendorDetails: freezed == vendorDetails
          ? _value.vendorDetails
          : vendorDetails // ignore: cast_nullable_to_non_nullable
              as VendorDetails?,
      joinedUsers: freezed == joinedUsers
          ? _value._joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<JoinedUsers>?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
      prices: freezed == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Prices>?,
      eventComment: freezed == eventComment
          ? _value._eventComment
          : eventComment // ignore: cast_nullable_to_non_nullable
              as List<EventCommentModel>?,
      request: freezed == request
          ? _value._request
          : request // ignore: cast_nullable_to_non_nullable
              as List<Request>?,
      ratings: freezed == ratings
          ? _value._ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Ratings>?,
      sortNumber: freezed == sortNumber
          ? _value.sortNumber
          : sortNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      eventGroups: freezed == eventGroups
          ? _value.eventGroups
          : eventGroups // ignore: cast_nullable_to_non_nullable
              as EventGroups?,
      groupRequest: freezed == groupRequest
          ? _value.groupRequest
          : groupRequest // ignore: cast_nullable_to_non_nullable
              as GroupRequestDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDetailsModelImpl implements _EventDetailsModel {
  const _$EventDetailsModelImpl(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.location,
      this.date,
      this.likeStatus,
      this.joinStatus,
      this.joinedUserCount,
      this.joinedStatus,
      this.isCurrentUser,
      this.startTime,
      this.endTime,
      this.resolution,
      this.isPrice,
      this.isQuotaFull,
      this.isPublish,
      this.requestStatus,
      this.isParticipants,
      this.isContract,
      this.isUserEvent,
      this.isClosedComment,
      this.openToJoinStatus,
      this.likeCount,
      this.participantsLimit,
      this.shareCount,
      this.price,
      this.ticketUrl,
      this.onlineUrl,
      this.latitude,
      this.longitude,
      this.mapLink,
      this.address,
      this.ratingLenght,
      this.rating,
      this.vendorDetails,
      final List<JoinedUsers>? joinedUsers,
      final List<Images>? images,
      final List<TagsModel>? tags,
      final List<Prices>? prices,
      final List<EventCommentModel>? eventComment,
      final List<Request>? request,
      final List<Ratings>? ratings,
      this.sortNumber,
      this.eventGroups,
      this.groupRequest})
      : _joinedUsers = joinedUsers,
        _images = images,
        _tags = tags,
        _prices = prices,
        _eventComment = eventComment,
        _request = request,
        _ratings = ratings;

  factory _$EventDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDetailsModelImplFromJson(json);

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
  final bool? joinStatus;
  @override
  final int? joinedUserCount;
  @override
  final bool? joinedStatus;
  @override
  final bool? isCurrentUser;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? resolution;
  @override
  final bool? isPrice;
  @override
  final bool? isQuotaFull;
  @override
  final bool? isPublish;
  @override
  final bool? requestStatus;
  @override
  final bool? isParticipants;
  @override
  final bool? isContract;
  @override
  final bool? isUserEvent;
  @override
  final bool? isClosedComment;
  @override
  final bool? openToJoinStatus;
  @override
  final int? likeCount;
  @override
  final int? participantsLimit;
  @override
  final int? shareCount;
  @override
  final String? price;
  @override
  final String? ticketUrl;
  @override
  final String? onlineUrl;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  final String? mapLink;
  @override
  final String? address;
  @override
  final int? ratingLenght;
  @override
  final double? rating;
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

  final List<Images>? _images;
  @override
  List<Images>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagsModel>? _tags;
  @override
  List<TagsModel>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Prices>? _prices;
  @override
  List<Prices>? get prices {
    final value = _prices;
    if (value == null) return null;
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EventCommentModel>? _eventComment;
  @override
  List<EventCommentModel>? get eventComment {
    final value = _eventComment;
    if (value == null) return null;
    if (_eventComment is EqualUnmodifiableListView) return _eventComment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Request>? _request;
  @override
  List<Request>? get request {
    final value = _request;
    if (value == null) return null;
    if (_request is EqualUnmodifiableListView) return _request;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Ratings>? _ratings;
  @override
  List<Ratings>? get ratings {
    final value = _ratings;
    if (value == null) return null;
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? sortNumber;
  @override
  final EventGroups? eventGroups;
  @override
  final GroupRequestDetail? groupRequest;

  @override
  String toString() {
    return 'EventDetailsModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, location: $location, date: $date, likeStatus: $likeStatus, joinStatus: $joinStatus, joinedUserCount: $joinedUserCount, joinedStatus: $joinedStatus, isCurrentUser: $isCurrentUser, startTime: $startTime, endTime: $endTime, resolution: $resolution, isPrice: $isPrice, isQuotaFull: $isQuotaFull, isPublish: $isPublish, requestStatus: $requestStatus, isParticipants: $isParticipants, isContract: $isContract, isUserEvent: $isUserEvent, isClosedComment: $isClosedComment, openToJoinStatus: $openToJoinStatus, likeCount: $likeCount, participantsLimit: $participantsLimit, shareCount: $shareCount, price: $price, ticketUrl: $ticketUrl, onlineUrl: $onlineUrl, latitude: $latitude, longitude: $longitude, mapLink: $mapLink, address: $address, ratingLenght: $ratingLenght, rating: $rating, vendorDetails: $vendorDetails, joinedUsers: $joinedUsers, images: $images, tags: $tags, prices: $prices, eventComment: $eventComment, request: $request, ratings: $ratings, sortNumber: $sortNumber, eventGroups: $eventGroups, groupRequest: $groupRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailsModelImpl &&
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
            (identical(other.joinStatus, joinStatus) ||
                other.joinStatus == joinStatus) &&
            (identical(other.joinedUserCount, joinedUserCount) ||
                other.joinedUserCount == joinedUserCount) &&
            (identical(other.joinedStatus, joinedStatus) ||
                other.joinedStatus == joinedStatus) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.isPrice, isPrice) || other.isPrice == isPrice) &&
            (identical(other.isQuotaFull, isQuotaFull) ||
                other.isQuotaFull == isQuotaFull) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.requestStatus, requestStatus) ||
                other.requestStatus == requestStatus) &&
            (identical(other.isParticipants, isParticipants) ||
                other.isParticipants == isParticipants) &&
            (identical(other.isContract, isContract) ||
                other.isContract == isContract) &&
            (identical(other.isUserEvent, isUserEvent) ||
                other.isUserEvent == isUserEvent) &&
            (identical(other.isClosedComment, isClosedComment) ||
                other.isClosedComment == isClosedComment) &&
            (identical(other.openToJoinStatus, openToJoinStatus) ||
                other.openToJoinStatus == openToJoinStatus) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.participantsLimit, participantsLimit) ||
                other.participantsLimit == participantsLimit) &&
            (identical(other.shareCount, shareCount) ||
                other.shareCount == shareCount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ticketUrl, ticketUrl) ||
                other.ticketUrl == ticketUrl) &&
            (identical(other.onlineUrl, onlineUrl) ||
                other.onlineUrl == onlineUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.mapLink, mapLink) || other.mapLink == mapLink) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.ratingLenght, ratingLenght) ||
                other.ratingLenght == ratingLenght) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.vendorDetails, vendorDetails) ||
                other.vendorDetails == vendorDetails) &&
            const DeepCollectionEquality()
                .equals(other._joinedUsers, _joinedUsers) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._prices, _prices) &&
            const DeepCollectionEquality()
                .equals(other._eventComment, _eventComment) &&
            const DeepCollectionEquality().equals(other._request, _request) &&
            const DeepCollectionEquality().equals(other._ratings, _ratings) &&
            (identical(other.sortNumber, sortNumber) ||
                other.sortNumber == sortNumber) &&
            (identical(other.eventGroups, eventGroups) ||
                other.eventGroups == eventGroups) &&
            (identical(other.groupRequest, groupRequest) ||
                other.groupRequest == groupRequest));
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
        joinStatus,
        joinedUserCount,
        joinedStatus,
        isCurrentUser,
        startTime,
        endTime,
        resolution,
        isPrice,
        isQuotaFull,
        isPublish,
        requestStatus,
        isParticipants,
        isContract,
        isUserEvent,
        isClosedComment,
        openToJoinStatus,
        likeCount,
        participantsLimit,
        shareCount,
        price,
        ticketUrl,
        onlineUrl,
        latitude,
        longitude,
        mapLink,
        address,
        ratingLenght,
        rating,
        vendorDetails,
        const DeepCollectionEquality().hash(_joinedUsers),
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_prices),
        const DeepCollectionEquality().hash(_eventComment),
        const DeepCollectionEquality().hash(_request),
        const DeepCollectionEquality().hash(_ratings),
        sortNumber,
        eventGroups,
        groupRequest
      ]);

  /// Create a copy of EventDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailsModelImplCopyWith<_$EventDetailsModelImpl> get copyWith =>
      __$$EventDetailsModelImplCopyWithImpl<_$EventDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _EventDetailsModel implements EventDetailsModel {
  const factory _EventDetailsModel(
      {final String? id,
      final String? name,
      final String? description,
      final String? imageUrl,
      final String? location,
      final String? date,
      final bool? likeStatus,
      final bool? joinStatus,
      final int? joinedUserCount,
      final bool? joinedStatus,
      final bool? isCurrentUser,
      final String? startTime,
      final String? endTime,
      final String? resolution,
      final bool? isPrice,
      final bool? isQuotaFull,
      final bool? isPublish,
      final bool? requestStatus,
      final bool? isParticipants,
      final bool? isContract,
      final bool? isUserEvent,
      final bool? isClosedComment,
      final bool? openToJoinStatus,
      final int? likeCount,
      final int? participantsLimit,
      final int? shareCount,
      final String? price,
      final String? ticketUrl,
      final String? onlineUrl,
      final String? latitude,
      final String? longitude,
      final String? mapLink,
      final String? address,
      final int? ratingLenght,
      final double? rating,
      final VendorDetails? vendorDetails,
      final List<JoinedUsers>? joinedUsers,
      final List<Images>? images,
      final List<TagsModel>? tags,
      final List<Prices>? prices,
      final List<EventCommentModel>? eventComment,
      final List<Request>? request,
      final List<Ratings>? ratings,
      final int? sortNumber,
      final EventGroups? eventGroups,
      final GroupRequestDetail? groupRequest}) = _$EventDetailsModelImpl;

  factory _EventDetailsModel.fromJson(Map<String, dynamic> json) =
      _$EventDetailsModelImpl.fromJson;

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
  bool? get joinStatus;
  @override
  int? get joinedUserCount;
  @override
  bool? get joinedStatus;
  @override
  bool? get isCurrentUser;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get resolution;
  @override
  bool? get isPrice;
  @override
  bool? get isQuotaFull;
  @override
  bool? get isPublish;
  @override
  bool? get requestStatus;
  @override
  bool? get isParticipants;
  @override
  bool? get isContract;
  @override
  bool? get isUserEvent;
  @override
  bool? get isClosedComment;
  @override
  bool? get openToJoinStatus;
  @override
  int? get likeCount;
  @override
  int? get participantsLimit;
  @override
  int? get shareCount;
  @override
  String? get price;
  @override
  String? get ticketUrl;
  @override
  String? get onlineUrl;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  String? get mapLink;
  @override
  String? get address;
  @override
  int? get ratingLenght;
  @override
  double? get rating;
  @override
  VendorDetails? get vendorDetails;
  @override
  List<JoinedUsers>? get joinedUsers;
  @override
  List<Images>? get images;
  @override
  List<TagsModel>? get tags;
  @override
  List<Prices>? get prices;
  @override
  List<EventCommentModel>? get eventComment;
  @override
  List<Request>? get request;
  @override
  List<Ratings>? get ratings;
  @override
  int? get sortNumber;
  @override
  EventGroups? get eventGroups;
  @override
  GroupRequestDetail? get groupRequest;

  /// Create a copy of EventDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDetailsModelImplCopyWith<_$EventDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Prices _$PricesFromJson(Map<String, dynamic> json) {
  return _Prices.fromJson(json);
}

/// @nodoc
mixin _$Prices {
  String? get name => throw _privateConstructorUsedError;
  String? get fee => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;

  /// Serializes this Prices to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricesCopyWith<Prices> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricesCopyWith<$Res> {
  factory $PricesCopyWith(Prices value, $Res Function(Prices) then) =
      _$PricesCopyWithImpl<$Res, Prices>;
  @useResult
  $Res call({String? name, String? fee, String? currency});
}

/// @nodoc
class _$PricesCopyWithImpl<$Res, $Val extends Prices>
    implements $PricesCopyWith<$Res> {
  _$PricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? fee = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricesImplCopyWith<$Res> implements $PricesCopyWith<$Res> {
  factory _$$PricesImplCopyWith(
          _$PricesImpl value, $Res Function(_$PricesImpl) then) =
      __$$PricesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? fee, String? currency});
}

/// @nodoc
class __$$PricesImplCopyWithImpl<$Res>
    extends _$PricesCopyWithImpl<$Res, _$PricesImpl>
    implements _$$PricesImplCopyWith<$Res> {
  __$$PricesImplCopyWithImpl(
      _$PricesImpl _value, $Res Function(_$PricesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? fee = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$PricesImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricesImpl implements _Prices {
  const _$PricesImpl({this.name, this.fee, this.currency});

  factory _$PricesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricesImplFromJson(json);

  @override
  final String? name;
  @override
  final String? fee;
  @override
  final String? currency;

  @override
  String toString() {
    return 'Prices(name: $name, fee: $fee, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, fee, currency);

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricesImplCopyWith<_$PricesImpl> get copyWith =>
      __$$PricesImplCopyWithImpl<_$PricesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricesImplToJson(
      this,
    );
  }
}

abstract class _Prices implements Prices {
  const factory _Prices(
      {final String? name,
      final String? fee,
      final String? currency}) = _$PricesImpl;

  factory _Prices.fromJson(Map<String, dynamic> json) = _$PricesImpl.fromJson;

  @override
  String? get name;
  @override
  String? get fee;
  @override
  String? get currency;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricesImplCopyWith<_$PricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Request _$RequestFromJson(Map<String, dynamic> json) {
  return _Request.fromJson(json);
}

/// @nodoc
mixin _$Request {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this Request to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCopyWith<Request> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res, Request>;
  @useResult
  $Res call({String? imageUrl, String? name});
}

/// @nodoc
class _$RequestCopyWithImpl<$Res, $Val extends Request>
    implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestImplCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$$RequestImplCopyWith(
          _$RequestImpl value, $Res Function(_$RequestImpl) then) =
      __$$RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageUrl, String? name});
}

/// @nodoc
class __$$RequestImplCopyWithImpl<$Res>
    extends _$RequestCopyWithImpl<$Res, _$RequestImpl>
    implements _$$RequestImplCopyWith<$Res> {
  __$$RequestImplCopyWithImpl(
      _$RequestImpl _value, $Res Function(_$RequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_$RequestImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestImpl implements _Request {
  const _$RequestImpl({this.imageUrl, this.name});

  factory _$RequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestImplFromJson(json);

  @override
  final String? imageUrl;
  @override
  final String? name;

  @override
  String toString() {
    return 'Request(imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, name);

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      __$$RequestImplCopyWithImpl<_$RequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestImplToJson(
      this,
    );
  }
}

abstract class _Request implements Request {
  const factory _Request({final String? imageUrl, final String? name}) =
      _$RequestImpl;

  factory _Request.fromJson(Map<String, dynamic> json) = _$RequestImpl.fromJson;

  @override
  String? get imageUrl;
  @override
  String? get name;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return _Ratings.fromJson(json);
}

/// @nodoc
mixin _$Ratings {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Ratings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingsCopyWith<Ratings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingsCopyWith<$Res> {
  factory $RatingsCopyWith(Ratings value, $Res Function(Ratings) then) =
      _$RatingsCopyWithImpl<$Res, Ratings>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? userId,
      String? imageUrl,
      String? description,
      double? rating,
      String? createdAt});
}

/// @nodoc
class _$RatingsCopyWithImpl<$Res, $Val extends Ratings>
    implements $RatingsCopyWith<$Res> {
  _$RatingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingsImplCopyWith<$Res> implements $RatingsCopyWith<$Res> {
  factory _$$RatingsImplCopyWith(
          _$RatingsImpl value, $Res Function(_$RatingsImpl) then) =
      __$$RatingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? userId,
      String? imageUrl,
      String? description,
      double? rating,
      String? createdAt});
}

/// @nodoc
class __$$RatingsImplCopyWithImpl<$Res>
    extends _$RatingsCopyWithImpl<$Res, _$RatingsImpl>
    implements _$$RatingsImplCopyWith<$Res> {
  __$$RatingsImplCopyWithImpl(
      _$RatingsImpl _value, $Res Function(_$RatingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$RatingsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingsImpl implements _Ratings {
  const _$RatingsImpl(
      {this.id,
      this.name,
      this.userId,
      this.imageUrl,
      this.description,
      this.rating,
      this.createdAt});

  factory _$RatingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingsImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? userId;
  @override
  final String? imageUrl;
  @override
  final String? description;
  @override
  final double? rating;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'Ratings(id: $id, name: $name, userId: $userId, imageUrl: $imageUrl, description: $description, rating: $rating, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, userId, imageUrl, description, rating, createdAt);

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingsImplCopyWith<_$RatingsImpl> get copyWith =>
      __$$RatingsImplCopyWithImpl<_$RatingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingsImplToJson(
      this,
    );
  }
}

abstract class _Ratings implements Ratings {
  const factory _Ratings(
      {final String? id,
      final String? name,
      final String? userId,
      final String? imageUrl,
      final String? description,
      final double? rating,
      final String? createdAt}) = _$RatingsImpl;

  factory _Ratings.fromJson(Map<String, dynamic> json) = _$RatingsImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get userId;
  @override
  String? get imageUrl;
  @override
  String? get description;
  @override
  double? get rating;
  @override
  String? get createdAt;

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingsImplCopyWith<_$RatingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
