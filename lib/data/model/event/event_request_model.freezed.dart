// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventRequestModel _$EventRequestModelFromJson(Map<String, dynamic> json) {
  return _EventRequestModel.fromJson(json);
}

/// @nodoc
mixin _$EventRequestModel {
  String? get requestId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool? get requestStatus => throw _privateConstructorUsedError;
  Friend? get friend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventRequestModelCopyWith<EventRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventRequestModelCopyWith<$Res> {
  factory $EventRequestModelCopyWith(
          EventRequestModel value, $Res Function(EventRequestModel) then) =
      _$EventRequestModelCopyWithImpl<$Res, EventRequestModel>;
  @useResult
  $Res call(
      {String? requestId,
      String? userId,
      String? name,
      String? imageUrl,
      String? title,
      String? date,
      bool? requestStatus,
      Friend? friend});

  $FriendCopyWith<$Res>? get friend;
}

/// @nodoc
class _$EventRequestModelCopyWithImpl<$Res, $Val extends EventRequestModel>
    implements $EventRequestModelCopyWith<$Res> {
  _$EventRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? requestStatus = freezed,
    Object? friend = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      requestStatus: freezed == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      friend: freezed == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as Friend?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FriendCopyWith<$Res>? get friend {
    if (_value.friend == null) {
      return null;
    }

    return $FriendCopyWith<$Res>(_value.friend!, (value) {
      return _then(_value.copyWith(friend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventRequestModelImplCopyWith<$Res>
    implements $EventRequestModelCopyWith<$Res> {
  factory _$$EventRequestModelImplCopyWith(_$EventRequestModelImpl value,
          $Res Function(_$EventRequestModelImpl) then) =
      __$$EventRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? requestId,
      String? userId,
      String? name,
      String? imageUrl,
      String? title,
      String? date,
      bool? requestStatus,
      Friend? friend});

  @override
  $FriendCopyWith<$Res>? get friend;
}

/// @nodoc
class __$$EventRequestModelImplCopyWithImpl<$Res>
    extends _$EventRequestModelCopyWithImpl<$Res, _$EventRequestModelImpl>
    implements _$$EventRequestModelImplCopyWith<$Res> {
  __$$EventRequestModelImplCopyWithImpl(_$EventRequestModelImpl _value,
      $Res Function(_$EventRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? requestStatus = freezed,
    Object? friend = freezed,
  }) {
    return _then(_$EventRequestModelImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      requestStatus: freezed == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      friend: freezed == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as Friend?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventRequestModelImpl implements _EventRequestModel {
  const _$EventRequestModelImpl(
      {this.requestId,
      this.userId,
      this.name,
      this.imageUrl,
      this.title,
      this.date,
      this.requestStatus,
      this.friend});

  factory _$EventRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventRequestModelImplFromJson(json);

  @override
  final String? requestId;
  @override
  final String? userId;
  @override
  final String? name;
  @override
  final String? imageUrl;
  @override
  final String? title;
  @override
  final String? date;
  @override
  final bool? requestStatus;
  @override
  final Friend? friend;

  @override
  String toString() {
    return 'EventRequestModel(requestId: $requestId, userId: $userId, name: $name, imageUrl: $imageUrl, title: $title, date: $date, requestStatus: $requestStatus, friend: $friend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRequestModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.requestStatus, requestStatus) ||
                other.requestStatus == requestStatus) &&
            (identical(other.friend, friend) || other.friend == friend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, userId, name,
      imageUrl, title, date, requestStatus, friend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventRequestModelImplCopyWith<_$EventRequestModelImpl> get copyWith =>
      __$$EventRequestModelImplCopyWithImpl<_$EventRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventRequestModelImplToJson(
      this,
    );
  }
}

abstract class _EventRequestModel implements EventRequestModel {
  const factory _EventRequestModel(
      {final String? requestId,
      final String? userId,
      final String? name,
      final String? imageUrl,
      final String? title,
      final String? date,
      final bool? requestStatus,
      final Friend? friend}) = _$EventRequestModelImpl;

  factory _EventRequestModel.fromJson(Map<String, dynamic> json) =
      _$EventRequestModelImpl.fromJson;

  @override
  String? get requestId;
  @override
  String? get userId;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  String? get title;
  @override
  String? get date;
  @override
  bool? get requestStatus;
  @override
  Friend? get friend;
  @override
  @JsonKey(ignore: true)
  _$$EventRequestModelImplCopyWith<_$EventRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
mixin _$Friend {
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res, Friend>;
  @useResult
  $Res call({String? userId, String? name, String? imageUrl, String? title});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res, $Val extends Friend>
    implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendImplCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$$FriendImplCopyWith(
          _$FriendImpl value, $Res Function(_$FriendImpl) then) =
      __$$FriendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? name, String? imageUrl, String? title});
}

/// @nodoc
class __$$FriendImplCopyWithImpl<$Res>
    extends _$FriendCopyWithImpl<$Res, _$FriendImpl>
    implements _$$FriendImplCopyWith<$Res> {
  __$$FriendImplCopyWithImpl(
      _$FriendImpl _value, $Res Function(_$FriendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
  }) {
    return _then(_$FriendImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendImpl implements _Friend {
  const _$FriendImpl({this.userId, this.name, this.imageUrl, this.title});

  factory _$FriendImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? name;
  @override
  final String? imageUrl;
  @override
  final String? title;

  @override
  String toString() {
    return 'Friend(userId: $userId, name: $name, imageUrl: $imageUrl, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, imageUrl, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      __$$FriendImplCopyWithImpl<_$FriendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendImplToJson(
      this,
    );
  }
}

abstract class _Friend implements Friend {
  const factory _Friend(
      {final String? userId,
      final String? name,
      final String? imageUrl,
      final String? title}) = _$FriendImpl;

  factory _Friend.fromJson(Map<String, dynamic> json) = _$FriendImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
