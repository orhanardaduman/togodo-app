// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_request_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventRequestState {
  List<EventRequestModel> get events => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventRequestStateCopyWith<EventRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventRequestStateCopyWith<$Res> {
  factory $EventRequestStateCopyWith(
          EventRequestState value, $Res Function(EventRequestState) then) =
      _$EventRequestStateCopyWithImpl<$Res, EventRequestState>;
  @useResult
  $Res call({List<EventRequestModel> events, bool loading, int pagination});
}

/// @nodoc
class _$EventRequestStateCopyWithImpl<$Res, $Val extends EventRequestState>
    implements $EventRequestStateCopyWith<$Res> {
  _$EventRequestStateCopyWithImpl(this._value, this._then);

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
              as List<EventRequestModel>,
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
abstract class _$$EventRequestStateImplCopyWith<$Res>
    implements $EventRequestStateCopyWith<$Res> {
  factory _$$EventRequestStateImplCopyWith(_$EventRequestStateImpl value,
          $Res Function(_$EventRequestStateImpl) then) =
      __$$EventRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EventRequestModel> events, bool loading, int pagination});
}

/// @nodoc
class __$$EventRequestStateImplCopyWithImpl<$Res>
    extends _$EventRequestStateCopyWithImpl<$Res, _$EventRequestStateImpl>
    implements _$$EventRequestStateImplCopyWith<$Res> {
  __$$EventRequestStateImplCopyWithImpl(_$EventRequestStateImpl _value,
      $Res Function(_$EventRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_$EventRequestStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventRequestModel>,
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

class _$EventRequestStateImpl implements _EventRequestState {
  const _$EventRequestStateImpl(
      {final List<EventRequestModel> events = const [],
      this.loading = false,
      this.pagination = 0})
      : _events = events;

  final List<EventRequestModel> _events;
  @override
  @JsonKey()
  List<EventRequestModel> get events {
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
    return 'EventRequestState(events: $events, loading: $loading, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRequestStateImpl &&
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
  _$$EventRequestStateImplCopyWith<_$EventRequestStateImpl> get copyWith =>
      __$$EventRequestStateImplCopyWithImpl<_$EventRequestStateImpl>(
          this, _$identity);
}

abstract class _EventRequestState implements EventRequestState {
  const factory _EventRequestState(
      {final List<EventRequestModel> events,
      final bool loading,
      final int pagination}) = _$EventRequestStateImpl;

  @override
  List<EventRequestModel> get events;
  @override
  bool get loading;
  @override
  int get pagination;
  @override
  @JsonKey(ignore: true)
  _$$EventRequestStateImplCopyWith<_$EventRequestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
