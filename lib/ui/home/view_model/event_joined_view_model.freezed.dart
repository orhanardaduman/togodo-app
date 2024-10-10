// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_joined_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventJoinedState {
  List<EventFriendInviteModel> get events => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Create a copy of EventJoinedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventJoinedStateCopyWith<EventJoinedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventJoinedStateCopyWith<$Res> {
  factory $EventJoinedStateCopyWith(
          EventJoinedState value, $Res Function(EventJoinedState) then) =
      _$EventJoinedStateCopyWithImpl<$Res, EventJoinedState>;
  @useResult
  $Res call(
      {List<EventFriendInviteModel> events,
      bool loading,
      int pagination,
      int totalCount});
}

/// @nodoc
class _$EventJoinedStateCopyWithImpl<$Res, $Val extends EventJoinedState>
    implements $EventJoinedStateCopyWith<$Res> {
  _$EventJoinedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventJoinedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? loading = null,
    Object? pagination = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventFriendInviteModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventJoinedStateImplCopyWith<$Res>
    implements $EventJoinedStateCopyWith<$Res> {
  factory _$$EventJoinedStateImplCopyWith(_$EventJoinedStateImpl value,
          $Res Function(_$EventJoinedStateImpl) then) =
      __$$EventJoinedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventFriendInviteModel> events,
      bool loading,
      int pagination,
      int totalCount});
}

/// @nodoc
class __$$EventJoinedStateImplCopyWithImpl<$Res>
    extends _$EventJoinedStateCopyWithImpl<$Res, _$EventJoinedStateImpl>
    implements _$$EventJoinedStateImplCopyWith<$Res> {
  __$$EventJoinedStateImplCopyWithImpl(_$EventJoinedStateImpl _value,
      $Res Function(_$EventJoinedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventJoinedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? loading = null,
    Object? pagination = null,
    Object? totalCount = null,
  }) {
    return _then(_$EventJoinedStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventFriendInviteModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EventJoinedStateImpl implements _EventJoinedState {
  const _$EventJoinedStateImpl(
      {final List<EventFriendInviteModel> events = const [],
      this.loading = false,
      this.pagination = 0,
      this.totalCount = 0})
      : _events = events;

  final List<EventFriendInviteModel> _events;
  @override
  @JsonKey()
  List<EventFriendInviteModel> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int pagination;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'EventJoinedState(events: $events, loading: $loading, pagination: $pagination, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventJoinedStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      loading,
      pagination,
      totalCount);

  /// Create a copy of EventJoinedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventJoinedStateImplCopyWith<_$EventJoinedStateImpl> get copyWith =>
      __$$EventJoinedStateImplCopyWithImpl<_$EventJoinedStateImpl>(
          this, _$identity);
}

abstract class _EventJoinedState implements EventJoinedState {
  const factory _EventJoinedState(
      {final List<EventFriendInviteModel> events,
      final bool loading,
      final int pagination,
      final int totalCount}) = _$EventJoinedStateImpl;

  @override
  List<EventFriendInviteModel> get events;
  @override
  bool get loading;
  @override
  int get pagination;
  @override
  int get totalCount;

  /// Create a copy of EventJoinedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventJoinedStateImplCopyWith<_$EventJoinedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
