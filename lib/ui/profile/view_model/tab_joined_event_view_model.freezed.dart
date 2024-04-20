// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_joined_event_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabEventsJoinedState {
  List<EventModel> get events => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabEventsJoinedStateCopyWith<TabEventsJoinedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabEventsJoinedStateCopyWith<$Res> {
  factory $TabEventsJoinedStateCopyWith(TabEventsJoinedState value,
          $Res Function(TabEventsJoinedState) then) =
      _$TabEventsJoinedStateCopyWithImpl<$Res, TabEventsJoinedState>;
  @useResult
  $Res call({List<EventModel> events, bool loading, int pagination});
}

/// @nodoc
class _$TabEventsJoinedStateCopyWithImpl<$Res,
        $Val extends TabEventsJoinedState>
    implements $TabEventsJoinedStateCopyWith<$Res> {
  _$TabEventsJoinedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabEventsJoinedStateImplCopyWith<$Res>
    implements $TabEventsJoinedStateCopyWith<$Res> {
  factory _$$TabEventsJoinedStateImplCopyWith(_$TabEventsJoinedStateImpl value,
          $Res Function(_$TabEventsJoinedStateImpl) then) =
      __$$TabEventsJoinedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EventModel> events, bool loading, int pagination});
}

/// @nodoc
class __$$TabEventsJoinedStateImplCopyWithImpl<$Res>
    extends _$TabEventsJoinedStateCopyWithImpl<$Res, _$TabEventsJoinedStateImpl>
    implements _$$TabEventsJoinedStateImplCopyWith<$Res> {
  __$$TabEventsJoinedStateImplCopyWithImpl(_$TabEventsJoinedStateImpl _value,
      $Res Function(_$TabEventsJoinedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_$TabEventsJoinedStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TabEventsJoinedStateImpl implements _TabEventsJoinedState {
  const _$TabEventsJoinedStateImpl(
      {final List<EventModel> events = const [],
      this.loading = false,
      this.pagination = 0})
      : _events = events;

  final List<EventModel> _events;
  @override
  @JsonKey()
  List<EventModel> get events {
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
  String toString() {
    return 'TabEventsJoinedState(events: $events, loading: $loading, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabEventsJoinedStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), loading, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabEventsJoinedStateImplCopyWith<_$TabEventsJoinedStateImpl>
      get copyWith =>
          __$$TabEventsJoinedStateImplCopyWithImpl<_$TabEventsJoinedStateImpl>(
              this, _$identity);
}

abstract class _TabEventsJoinedState implements TabEventsJoinedState {
  const factory _TabEventsJoinedState(
      {final List<EventModel> events,
      final bool loading,
      final int pagination}) = _$TabEventsJoinedStateImpl;

  @override
  List<EventModel> get events;
  @override
  bool get loading;
  @override
  int get pagination;
  @override
  @JsonKey(ignore: true)
  _$$TabEventsJoinedStateImplCopyWith<_$TabEventsJoinedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
