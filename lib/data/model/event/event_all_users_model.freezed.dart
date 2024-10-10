// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_all_users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventAllUsersModel _$EventAllUsersModelFromJson(Map<String, dynamic> json) {
  return _EventAllUsersModel.fromJson(json);
}

/// @nodoc
mixin _$EventAllUsersModel {
  int? get total => throw _privateConstructorUsedError;
  List<EventFriendInviteModel>? get users => throw _privateConstructorUsedError;

  /// Serializes this EventAllUsersModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventAllUsersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventAllUsersModelCopyWith<EventAllUsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventAllUsersModelCopyWith<$Res> {
  factory $EventAllUsersModelCopyWith(
          EventAllUsersModel value, $Res Function(EventAllUsersModel) then) =
      _$EventAllUsersModelCopyWithImpl<$Res, EventAllUsersModel>;
  @useResult
  $Res call({int? total, List<EventFriendInviteModel>? users});
}

/// @nodoc
class _$EventAllUsersModelCopyWithImpl<$Res, $Val extends EventAllUsersModel>
    implements $EventAllUsersModelCopyWith<$Res> {
  _$EventAllUsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventAllUsersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EventFriendInviteModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventAllUsersModelImplCopyWith<$Res>
    implements $EventAllUsersModelCopyWith<$Res> {
  factory _$$EventAllUsersModelImplCopyWith(_$EventAllUsersModelImpl value,
          $Res Function(_$EventAllUsersModelImpl) then) =
      __$$EventAllUsersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<EventFriendInviteModel>? users});
}

/// @nodoc
class __$$EventAllUsersModelImplCopyWithImpl<$Res>
    extends _$EventAllUsersModelCopyWithImpl<$Res, _$EventAllUsersModelImpl>
    implements _$$EventAllUsersModelImplCopyWith<$Res> {
  __$$EventAllUsersModelImplCopyWithImpl(_$EventAllUsersModelImpl _value,
      $Res Function(_$EventAllUsersModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventAllUsersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? users = freezed,
  }) {
    return _then(_$EventAllUsersModelImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EventFriendInviteModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventAllUsersModelImpl implements _EventAllUsersModel {
  const _$EventAllUsersModelImpl(
      {this.total, final List<EventFriendInviteModel>? users})
      : _users = users;

  factory _$EventAllUsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventAllUsersModelImplFromJson(json);

  @override
  final int? total;
  final List<EventFriendInviteModel>? _users;
  @override
  List<EventFriendInviteModel>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventAllUsersModel(total: $total, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventAllUsersModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_users));

  /// Create a copy of EventAllUsersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventAllUsersModelImplCopyWith<_$EventAllUsersModelImpl> get copyWith =>
      __$$EventAllUsersModelImplCopyWithImpl<_$EventAllUsersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventAllUsersModelImplToJson(
      this,
    );
  }
}

abstract class _EventAllUsersModel implements EventAllUsersModel {
  const factory _EventAllUsersModel(
      {final int? total,
      final List<EventFriendInviteModel>? users}) = _$EventAllUsersModelImpl;

  factory _EventAllUsersModel.fromJson(Map<String, dynamic> json) =
      _$EventAllUsersModelImpl.fromJson;

  @override
  int? get total;
  @override
  List<EventFriendInviteModel>? get users;

  /// Create a copy of EventAllUsersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventAllUsersModelImplCopyWith<_$EventAllUsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
