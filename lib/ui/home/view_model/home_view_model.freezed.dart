// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<EventModel> get events => throw _privateConstructorUsedError;
  List<EventModel> get eventsDaily => throw _privateConstructorUsedError;
  bool get isToday => throw _privateConstructorUsedError;
  bool get isShimmerShow => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get enableShowcase => throw _privateConstructorUsedError;
  int get dailyIndex => throw _privateConstructorUsedError;
  int get forYouIndex => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<EventModel> events,
      List<EventModel> eventsDaily,
      bool isToday,
      bool isShimmerShow,
      bool loading,
      bool enableShowcase,
      int dailyIndex,
      int forYouIndex,
      int pagination});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? eventsDaily = null,
    Object? isToday = null,
    Object? isShimmerShow = null,
    Object? loading = null,
    Object? enableShowcase = null,
    Object? dailyIndex = null,
    Object? forYouIndex = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
      eventsDaily: null == eventsDaily
          ? _value.eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
      isToday: null == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool,
      isShimmerShow: null == isShimmerShow
          ? _value.isShimmerShow
          : isShimmerShow // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      enableShowcase: null == enableShowcase
          ? _value.enableShowcase
          : enableShowcase // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyIndex: null == dailyIndex
          ? _value.dailyIndex
          : dailyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      forYouIndex: null == forYouIndex
          ? _value.forYouIndex
          : forYouIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventModel> events,
      List<EventModel> eventsDaily,
      bool isToday,
      bool isShimmerShow,
      bool loading,
      bool enableShowcase,
      int dailyIndex,
      int forYouIndex,
      int pagination});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? eventsDaily = null,
    Object? isToday = null,
    Object? isShimmerShow = null,
    Object? loading = null,
    Object? enableShowcase = null,
    Object? dailyIndex = null,
    Object? forYouIndex = null,
    Object? pagination = null,
  }) {
    return _then(_$HomeStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
      eventsDaily: null == eventsDaily
          ? _value._eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
      isToday: null == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool,
      isShimmerShow: null == isShimmerShow
          ? _value.isShimmerShow
          : isShimmerShow // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      enableShowcase: null == enableShowcase
          ? _value.enableShowcase
          : enableShowcase // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyIndex: null == dailyIndex
          ? _value.dailyIndex
          : dailyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      forYouIndex: null == forYouIndex
          ? _value.forYouIndex
          : forYouIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {final List<EventModel> events = const [],
      final List<EventModel> eventsDaily = const [],
      this.isToday = false,
      this.isShimmerShow = false,
      this.loading = false,
      this.enableShowcase = false,
      this.dailyIndex = 0,
      this.forYouIndex = 0,
      this.pagination = 0})
      : _events = events,
        _eventsDaily = eventsDaily;

  final List<EventModel> _events;
  @override
  @JsonKey()
  List<EventModel> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final List<EventModel> _eventsDaily;
  @override
  @JsonKey()
  List<EventModel> get eventsDaily {
    if (_eventsDaily is EqualUnmodifiableListView) return _eventsDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventsDaily);
  }

  @override
  @JsonKey()
  final bool isToday;
  @override
  @JsonKey()
  final bool isShimmerShow;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool enableShowcase;
  @override
  @JsonKey()
  final int dailyIndex;
  @override
  @JsonKey()
  final int forYouIndex;
  @override
  @JsonKey()
  final int pagination;

  @override
  String toString() {
    return 'HomeState(events: $events, eventsDaily: $eventsDaily, isToday: $isToday, isShimmerShow: $isShimmerShow, loading: $loading, enableShowcase: $enableShowcase, dailyIndex: $dailyIndex, forYouIndex: $forYouIndex, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality()
                .equals(other._eventsDaily, _eventsDaily) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.isShimmerShow, isShimmerShow) ||
                other.isShimmerShow == isShimmerShow) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.enableShowcase, enableShowcase) ||
                other.enableShowcase == enableShowcase) &&
            (identical(other.dailyIndex, dailyIndex) ||
                other.dailyIndex == dailyIndex) &&
            (identical(other.forYouIndex, forYouIndex) ||
                other.forYouIndex == forYouIndex) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_eventsDaily),
      isToday,
      isShimmerShow,
      loading,
      enableShowcase,
      dailyIndex,
      forYouIndex,
      pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<EventModel> events,
      final List<EventModel> eventsDaily,
      final bool isToday,
      final bool isShimmerShow,
      final bool loading,
      final bool enableShowcase,
      final int dailyIndex,
      final int forYouIndex,
      final int pagination}) = _$HomeStateImpl;

  @override
  List<EventModel> get events;
  @override
  List<EventModel> get eventsDaily;
  @override
  bool get isToday;
  @override
  bool get isShimmerShow;
  @override
  bool get loading;
  @override
  bool get enableShowcase;
  @override
  int get dailyIndex;
  @override
  int get forYouIndex;
  @override
  int get pagination;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
