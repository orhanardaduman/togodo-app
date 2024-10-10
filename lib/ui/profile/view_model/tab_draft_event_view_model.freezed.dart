// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_draft_event_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabEventsDraftState {
  List<EventModel> get events => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;

  /// Create a copy of TabEventsDraftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabEventsDraftStateCopyWith<TabEventsDraftState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabEventsDraftStateCopyWith<$Res> {
  factory $TabEventsDraftStateCopyWith(
          TabEventsDraftState value, $Res Function(TabEventsDraftState) then) =
      _$TabEventsDraftStateCopyWithImpl<$Res, TabEventsDraftState>;
  @useResult
  $Res call({List<EventModel> events, bool loading, int pagination});
}

/// @nodoc
class _$TabEventsDraftStateCopyWithImpl<$Res, $Val extends TabEventsDraftState>
    implements $TabEventsDraftStateCopyWith<$Res> {
  _$TabEventsDraftStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabEventsDraftState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$TabEventsDraftStateImplCopyWith<$Res>
    implements $TabEventsDraftStateCopyWith<$Res> {
  factory _$$TabEventsDraftStateImplCopyWith(_$TabEventsDraftStateImpl value,
          $Res Function(_$TabEventsDraftStateImpl) then) =
      __$$TabEventsDraftStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EventModel> events, bool loading, int pagination});
}

/// @nodoc
class __$$TabEventsDraftStateImplCopyWithImpl<$Res>
    extends _$TabEventsDraftStateCopyWithImpl<$Res, _$TabEventsDraftStateImpl>
    implements _$$TabEventsDraftStateImplCopyWith<$Res> {
  __$$TabEventsDraftStateImplCopyWithImpl(_$TabEventsDraftStateImpl _value,
      $Res Function(_$TabEventsDraftStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabEventsDraftState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_$TabEventsDraftStateImpl(
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

class _$TabEventsDraftStateImpl implements _TabEventsDraftState {
  const _$TabEventsDraftStateImpl(
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
    return 'TabEventsDraftState(events: $events, loading: $loading, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabEventsDraftStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), loading, pagination);

  /// Create a copy of TabEventsDraftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabEventsDraftStateImplCopyWith<_$TabEventsDraftStateImpl> get copyWith =>
      __$$TabEventsDraftStateImplCopyWithImpl<_$TabEventsDraftStateImpl>(
          this, _$identity);
}

abstract class _TabEventsDraftState implements TabEventsDraftState {
  const factory _TabEventsDraftState(
      {final List<EventModel> events,
      final bool loading,
      final int pagination}) = _$TabEventsDraftStateImpl;

  @override
  List<EventModel> get events;
  @override
  bool get loading;
  @override
  int get pagination;

  /// Create a copy of TabEventsDraftState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabEventsDraftStateImplCopyWith<_$TabEventsDraftStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
