// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'likes_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikesState {
  List<EventModel> get events => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;

  /// Create a copy of LikesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikesStateCopyWith<LikesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikesStateCopyWith<$Res> {
  factory $LikesStateCopyWith(
          LikesState value, $Res Function(LikesState) then) =
      _$LikesStateCopyWithImpl<$Res, LikesState>;
  @useResult
  $Res call({List<EventModel> events, bool loading, int pagination});
}

/// @nodoc
class _$LikesStateCopyWithImpl<$Res, $Val extends LikesState>
    implements $LikesStateCopyWith<$Res> {
  _$LikesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikesState
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
abstract class _$$LikesStateImplCopyWith<$Res>
    implements $LikesStateCopyWith<$Res> {
  factory _$$LikesStateImplCopyWith(
          _$LikesStateImpl value, $Res Function(_$LikesStateImpl) then) =
      __$$LikesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EventModel> events, bool loading, int pagination});
}

/// @nodoc
class __$$LikesStateImplCopyWithImpl<$Res>
    extends _$LikesStateCopyWithImpl<$Res, _$LikesStateImpl>
    implements _$$LikesStateImplCopyWith<$Res> {
  __$$LikesStateImplCopyWithImpl(
      _$LikesStateImpl _value, $Res Function(_$LikesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_$LikesStateImpl(
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

class _$LikesStateImpl implements _LikesState {
  const _$LikesStateImpl(
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
    return 'LikesState(events: $events, loading: $loading, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikesStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), loading, pagination);

  /// Create a copy of LikesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikesStateImplCopyWith<_$LikesStateImpl> get copyWith =>
      __$$LikesStateImplCopyWithImpl<_$LikesStateImpl>(this, _$identity);
}

abstract class _LikesState implements LikesState {
  const factory _LikesState(
      {final List<EventModel> events,
      final bool loading,
      final int pagination}) = _$LikesStateImpl;

  @override
  List<EventModel> get events;
  @override
  bool get loading;
  @override
  int get pagination;

  /// Create a copy of LikesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikesStateImplCopyWith<_$LikesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
