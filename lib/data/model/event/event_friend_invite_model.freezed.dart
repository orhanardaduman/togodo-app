// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_friend_invite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventFriendInviteModel _$EventFriendInviteModelFromJson(
    Map<String, dynamic> json) {
  return _EventFriendInviteModel.fromJson(json);
}

/// @nodoc
mixin _$EventFriendInviteModel {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get invateId => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  bool? get inviteStatus => throw _privateConstructorUsedError;
  bool? get sendByOtherUser => throw _privateConstructorUsedError;
  bool? get inviteStatusData => throw _privateConstructorUsedError;
  bool? get isFriend => throw _privateConstructorUsedError;
  bool? get isCurrentUser => throw _privateConstructorUsedError;
  bool? get isAccepted => throw _privateConstructorUsedError;
  bool? get isBlocked => throw _privateConstructorUsedError;
  bool? get isFriendRequest => throw _privateConstructorUsedError;
  bool? get isRequest => throw _privateConstructorUsedError;

  /// Serializes this EventFriendInviteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventFriendInviteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventFriendInviteModelCopyWith<EventFriendInviteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventFriendInviteModelCopyWith<$Res> {
  factory $EventFriendInviteModelCopyWith(EventFriendInviteModel value,
          $Res Function(EventFriendInviteModel) then) =
      _$EventFriendInviteModelCopyWithImpl<$Res, EventFriendInviteModel>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? imageUrl,
      String? title,
      String? invateId,
      int? type,
      bool? inviteStatus,
      bool? sendByOtherUser,
      bool? inviteStatusData,
      bool? isFriend,
      bool? isCurrentUser,
      bool? isAccepted,
      bool? isBlocked,
      bool? isFriendRequest,
      bool? isRequest});
}

/// @nodoc
class _$EventFriendInviteModelCopyWithImpl<$Res,
        $Val extends EventFriendInviteModel>
    implements $EventFriendInviteModelCopyWith<$Res> {
  _$EventFriendInviteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventFriendInviteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? invateId = freezed,
    Object? type = freezed,
    Object? inviteStatus = freezed,
    Object? sendByOtherUser = freezed,
    Object? inviteStatusData = freezed,
    Object? isFriend = freezed,
    Object? isCurrentUser = freezed,
    Object? isAccepted = freezed,
    Object? isBlocked = freezed,
    Object? isFriendRequest = freezed,
    Object? isRequest = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      invateId: freezed == invateId
          ? _value.invateId
          : invateId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteStatus: freezed == inviteStatus
          ? _value.inviteStatus
          : inviteStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      sendByOtherUser: freezed == sendByOtherUser
          ? _value.sendByOtherUser
          : sendByOtherUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteStatusData: freezed == inviteStatusData
          ? _value.inviteStatusData
          : inviteStatusData // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriendRequest: freezed == isFriendRequest
          ? _value.isFriendRequest
          : isFriendRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequest: freezed == isRequest
          ? _value.isRequest
          : isRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventFriendInviteModelImplCopyWith<$Res>
    implements $EventFriendInviteModelCopyWith<$Res> {
  factory _$$EventFriendInviteModelImplCopyWith(
          _$EventFriendInviteModelImpl value,
          $Res Function(_$EventFriendInviteModelImpl) then) =
      __$$EventFriendInviteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? imageUrl,
      String? title,
      String? invateId,
      int? type,
      bool? inviteStatus,
      bool? sendByOtherUser,
      bool? inviteStatusData,
      bool? isFriend,
      bool? isCurrentUser,
      bool? isAccepted,
      bool? isBlocked,
      bool? isFriendRequest,
      bool? isRequest});
}

/// @nodoc
class __$$EventFriendInviteModelImplCopyWithImpl<$Res>
    extends _$EventFriendInviteModelCopyWithImpl<$Res,
        _$EventFriendInviteModelImpl>
    implements _$$EventFriendInviteModelImplCopyWith<$Res> {
  __$$EventFriendInviteModelImplCopyWithImpl(
      _$EventFriendInviteModelImpl _value,
      $Res Function(_$EventFriendInviteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventFriendInviteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? invateId = freezed,
    Object? type = freezed,
    Object? inviteStatus = freezed,
    Object? sendByOtherUser = freezed,
    Object? inviteStatusData = freezed,
    Object? isFriend = freezed,
    Object? isCurrentUser = freezed,
    Object? isAccepted = freezed,
    Object? isBlocked = freezed,
    Object? isFriendRequest = freezed,
    Object? isRequest = freezed,
  }) {
    return _then(_$EventFriendInviteModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      invateId: freezed == invateId
          ? _value.invateId
          : invateId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteStatus: freezed == inviteStatus
          ? _value.inviteStatus
          : inviteStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      sendByOtherUser: freezed == sendByOtherUser
          ? _value.sendByOtherUser
          : sendByOtherUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteStatusData: freezed == inviteStatusData
          ? _value.inviteStatusData
          : inviteStatusData // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriendRequest: freezed == isFriendRequest
          ? _value.isFriendRequest
          : isFriendRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequest: freezed == isRequest
          ? _value.isRequest
          : isRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventFriendInviteModelImpl implements _EventFriendInviteModel {
  const _$EventFriendInviteModelImpl(
      {this.id,
      this.userId,
      this.name,
      this.imageUrl,
      this.title,
      this.invateId,
      this.type,
      this.inviteStatus,
      this.sendByOtherUser,
      this.inviteStatusData,
      this.isFriend,
      this.isCurrentUser,
      this.isAccepted,
      this.isBlocked,
      this.isFriendRequest,
      this.isRequest});

  factory _$EventFriendInviteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventFriendInviteModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? name;
  @override
  final String? imageUrl;
  @override
  final String? title;
  @override
  final String? invateId;
  @override
  final int? type;
  @override
  final bool? inviteStatus;
  @override
  final bool? sendByOtherUser;
  @override
  final bool? inviteStatusData;
  @override
  final bool? isFriend;
  @override
  final bool? isCurrentUser;
  @override
  final bool? isAccepted;
  @override
  final bool? isBlocked;
  @override
  final bool? isFriendRequest;
  @override
  final bool? isRequest;

  @override
  String toString() {
    return 'EventFriendInviteModel(id: $id, userId: $userId, name: $name, imageUrl: $imageUrl, title: $title, invateId: $invateId, type: $type, inviteStatus: $inviteStatus, sendByOtherUser: $sendByOtherUser, inviteStatusData: $inviteStatusData, isFriend: $isFriend, isCurrentUser: $isCurrentUser, isAccepted: $isAccepted, isBlocked: $isBlocked, isFriendRequest: $isFriendRequest, isRequest: $isRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventFriendInviteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.invateId, invateId) ||
                other.invateId == invateId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.inviteStatus, inviteStatus) ||
                other.inviteStatus == inviteStatus) &&
            (identical(other.sendByOtherUser, sendByOtherUser) ||
                other.sendByOtherUser == sendByOtherUser) &&
            (identical(other.inviteStatusData, inviteStatusData) ||
                other.inviteStatusData == inviteStatusData) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isFriendRequest, isFriendRequest) ||
                other.isFriendRequest == isFriendRequest) &&
            (identical(other.isRequest, isRequest) ||
                other.isRequest == isRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      imageUrl,
      title,
      invateId,
      type,
      inviteStatus,
      sendByOtherUser,
      inviteStatusData,
      isFriend,
      isCurrentUser,
      isAccepted,
      isBlocked,
      isFriendRequest,
      isRequest);

  /// Create a copy of EventFriendInviteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventFriendInviteModelImplCopyWith<_$EventFriendInviteModelImpl>
      get copyWith => __$$EventFriendInviteModelImplCopyWithImpl<
          _$EventFriendInviteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventFriendInviteModelImplToJson(
      this,
    );
  }
}

abstract class _EventFriendInviteModel implements EventFriendInviteModel {
  const factory _EventFriendInviteModel(
      {final String? id,
      final String? userId,
      final String? name,
      final String? imageUrl,
      final String? title,
      final String? invateId,
      final int? type,
      final bool? inviteStatus,
      final bool? sendByOtherUser,
      final bool? inviteStatusData,
      final bool? isFriend,
      final bool? isCurrentUser,
      final bool? isAccepted,
      final bool? isBlocked,
      final bool? isFriendRequest,
      final bool? isRequest}) = _$EventFriendInviteModelImpl;

  factory _EventFriendInviteModel.fromJson(Map<String, dynamic> json) =
      _$EventFriendInviteModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  String? get title;
  @override
  String? get invateId;
  @override
  int? get type;
  @override
  bool? get inviteStatus;
  @override
  bool? get sendByOtherUser;
  @override
  bool? get inviteStatusData;
  @override
  bool? get isFriend;
  @override
  bool? get isCurrentUser;
  @override
  bool? get isAccepted;
  @override
  bool? get isBlocked;
  @override
  bool? get isFriendRequest;
  @override
  bool? get isRequest;

  /// Create a copy of EventFriendInviteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventFriendInviteModelImplCopyWith<_$EventFriendInviteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
