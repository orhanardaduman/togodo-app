// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_search_with_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSearchWithEvents _$UserSearchWithEventsFromJson(Map<String, dynamic> json) {
  return _UserSearchWithEvents.fromJson(json);
}

/// @nodoc
mixin _$UserSearchWithEvents {
  List<Users>? get users => throw _privateConstructorUsedError;
  List<EventModel>? get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSearchWithEventsCopyWith<UserSearchWithEvents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchWithEventsCopyWith<$Res> {
  factory $UserSearchWithEventsCopyWith(UserSearchWithEvents value,
          $Res Function(UserSearchWithEvents) then) =
      _$UserSearchWithEventsCopyWithImpl<$Res, UserSearchWithEvents>;
  @useResult
  $Res call({List<Users>? users, List<EventModel>? events});
}

/// @nodoc
class _$UserSearchWithEventsCopyWithImpl<$Res,
        $Val extends UserSearchWithEvents>
    implements $UserSearchWithEventsCopyWith<$Res> {
  _$UserSearchWithEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Users>?,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSearchWithEventsImplCopyWith<$Res>
    implements $UserSearchWithEventsCopyWith<$Res> {
  factory _$$UserSearchWithEventsImplCopyWith(_$UserSearchWithEventsImpl value,
          $Res Function(_$UserSearchWithEventsImpl) then) =
      __$$UserSearchWithEventsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Users>? users, List<EventModel>? events});
}

/// @nodoc
class __$$UserSearchWithEventsImplCopyWithImpl<$Res>
    extends _$UserSearchWithEventsCopyWithImpl<$Res, _$UserSearchWithEventsImpl>
    implements _$$UserSearchWithEventsImplCopyWith<$Res> {
  __$$UserSearchWithEventsImplCopyWithImpl(_$UserSearchWithEventsImpl _value,
      $Res Function(_$UserSearchWithEventsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? events = freezed,
  }) {
    return _then(_$UserSearchWithEventsImpl(
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<Users>?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSearchWithEventsImpl
    with DiagnosticableTreeMixin
    implements _UserSearchWithEvents {
  const _$UserSearchWithEventsImpl(
      {final List<Users>? users, final List<EventModel>? events})
      : _users = users,
        _events = events;

  factory _$UserSearchWithEventsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSearchWithEventsImplFromJson(json);

  final List<Users>? _users;
  @override
  List<Users>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EventModel>? _events;
  @override
  List<EventModel>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSearchWithEvents(users: $users, events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSearchWithEvents'))
      ..add(DiagnosticsProperty('users', users))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchWithEventsImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchWithEventsImplCopyWith<_$UserSearchWithEventsImpl>
      get copyWith =>
          __$$UserSearchWithEventsImplCopyWithImpl<_$UserSearchWithEventsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSearchWithEventsImplToJson(
      this,
    );
  }
}

abstract class _UserSearchWithEvents implements UserSearchWithEvents {
  const factory _UserSearchWithEvents(
      {final List<Users>? users,
      final List<EventModel>? events}) = _$UserSearchWithEventsImpl;

  factory _UserSearchWithEvents.fromJson(Map<String, dynamic> json) =
      _$UserSearchWithEventsImpl.fromJson;

  @override
  List<Users>? get users;
  @override
  List<EventModel>? get events;
  @override
  @JsonKey(ignore: true)
  _$$UserSearchWithEventsImplCopyWith<_$UserSearchWithEventsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
mixin _$Users {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersCopyWith<Users> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res, Users>;
  @useResult
  $Res call({String? id, String? name, String? imageUrl, String? title});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res, $Val extends Users>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
abstract class _$$UsersImplCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$$UsersImplCopyWith(
          _$UsersImpl value, $Res Function(_$UsersImpl) then) =
      __$$UsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? imageUrl, String? title});
}

/// @nodoc
class __$$UsersImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersImpl>
    implements _$$UsersImplCopyWith<$Res> {
  __$$UsersImplCopyWithImpl(
      _$UsersImpl _value, $Res Function(_$UsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
  }) {
    return _then(_$UsersImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$UsersImpl with DiagnosticableTreeMixin implements _Users {
  const _$UsersImpl({this.id, this.name, this.imageUrl, this.title});

  factory _$UsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? imageUrl;
  @override
  final String? title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Users(id: $id, name: $name, imageUrl: $imageUrl, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Users'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      __$$UsersImplCopyWithImpl<_$UsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersImplToJson(
      this,
    );
  }
}

abstract class _Users implements Users {
  const factory _Users(
      {final String? id,
      final String? name,
      final String? imageUrl,
      final String? title}) = _$UsersImpl;

  factory _Users.fromJson(Map<String, dynamic> json) = _$UsersImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
