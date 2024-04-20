// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WelcomeState {
  Result<SearchModel?>? get news => throw _privateConstructorUsedError;
  List<SearchModel> get club => throw _privateConstructorUsedError;
  List<SearchModel> get league => throw _privateConstructorUsedError;
  List<SearchModel> get coach => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WelcomeStateCopyWith<WelcomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeStateCopyWith<$Res> {
  factory $WelcomeStateCopyWith(
          WelcomeState value, $Res Function(WelcomeState) then) =
      _$WelcomeStateCopyWithImpl<$Res, WelcomeState>;
  @useResult
  $Res call(
      {Result<SearchModel?>? news,
      List<SearchModel> club,
      List<SearchModel> league,
      List<SearchModel> coach,
      bool loading});

  $ResultCopyWith<SearchModel?, $Res>? get news;
}

/// @nodoc
class _$WelcomeStateCopyWithImpl<$Res, $Val extends WelcomeState>
    implements $WelcomeStateCopyWith<$Res> {
  _$WelcomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = freezed,
    Object? club = null,
    Object? league = null,
    Object? coach = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      news: freezed == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as Result<SearchModel?>?,
      club: null == club
          ? _value.club
          : club // ignore: cast_nullable_to_non_nullable
              as List<SearchModel>,
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as List<SearchModel>,
      coach: null == coach
          ? _value.coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<SearchModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<SearchModel?, $Res>? get news {
    if (_value.news == null) {
      return null;
    }

    return $ResultCopyWith<SearchModel?, $Res>(_value.news!, (value) {
      return _then(_value.copyWith(news: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WelcomeStateImplCopyWith<$Res>
    implements $WelcomeStateCopyWith<$Res> {
  factory _$$WelcomeStateImplCopyWith(
          _$WelcomeStateImpl value, $Res Function(_$WelcomeStateImpl) then) =
      __$$WelcomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<SearchModel?>? news,
      List<SearchModel> club,
      List<SearchModel> league,
      List<SearchModel> coach,
      bool loading});

  @override
  $ResultCopyWith<SearchModel?, $Res>? get news;
}

/// @nodoc
class __$$WelcomeStateImplCopyWithImpl<$Res>
    extends _$WelcomeStateCopyWithImpl<$Res, _$WelcomeStateImpl>
    implements _$$WelcomeStateImplCopyWith<$Res> {
  __$$WelcomeStateImplCopyWithImpl(
      _$WelcomeStateImpl _value, $Res Function(_$WelcomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = freezed,
    Object? club = null,
    Object? league = null,
    Object? coach = null,
    Object? loading = null,
  }) {
    return _then(_$WelcomeStateImpl(
      news: freezed == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as Result<SearchModel?>?,
      club: null == club
          ? _value._club
          : club // ignore: cast_nullable_to_non_nullable
              as List<SearchModel>,
      league: null == league
          ? _value._league
          : league // ignore: cast_nullable_to_non_nullable
              as List<SearchModel>,
      coach: null == coach
          ? _value._coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<SearchModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WelcomeStateImpl implements _WelcomeState {
  const _$WelcomeStateImpl(
      {this.news = const Result.success(data: null),
      final List<SearchModel> club = const [],
      final List<SearchModel> league = const [],
      final List<SearchModel> coach = const [],
      this.loading = false})
      : _club = club,
        _league = league,
        _coach = coach;

  @override
  @JsonKey()
  final Result<SearchModel?>? news;
  final List<SearchModel> _club;
  @override
  @JsonKey()
  List<SearchModel> get club {
    if (_club is EqualUnmodifiableListView) return _club;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_club);
  }

  final List<SearchModel> _league;
  @override
  @JsonKey()
  List<SearchModel> get league {
    if (_league is EqualUnmodifiableListView) return _league;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_league);
  }

  final List<SearchModel> _coach;
  @override
  @JsonKey()
  List<SearchModel> get coach {
    if (_coach is EqualUnmodifiableListView) return _coach;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coach);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'WelcomeState(news: $news, club: $club, league: $league, coach: $coach, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WelcomeStateImpl &&
            (identical(other.news, news) || other.news == news) &&
            const DeepCollectionEquality().equals(other._club, _club) &&
            const DeepCollectionEquality().equals(other._league, _league) &&
            const DeepCollectionEquality().equals(other._coach, _coach) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      news,
      const DeepCollectionEquality().hash(_club),
      const DeepCollectionEquality().hash(_league),
      const DeepCollectionEquality().hash(_coach),
      loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WelcomeStateImplCopyWith<_$WelcomeStateImpl> get copyWith =>
      __$$WelcomeStateImplCopyWithImpl<_$WelcomeStateImpl>(this, _$identity);
}

abstract class _WelcomeState implements WelcomeState {
  const factory _WelcomeState(
      {final Result<SearchModel?>? news,
      final List<SearchModel> club,
      final List<SearchModel> league,
      final List<SearchModel> coach,
      final bool loading}) = _$WelcomeStateImpl;

  @override
  Result<SearchModel?>? get news;
  @override
  List<SearchModel> get club;
  @override
  List<SearchModel> get league;
  @override
  List<SearchModel> get coach;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$WelcomeStateImplCopyWith<_$WelcomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
