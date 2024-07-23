// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_profiles_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedProfilesEventsState {
  List<UserAccountsModel> get users => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get currentToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedProfilesEventsStateCopyWith<SavedProfilesEventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedProfilesEventsStateCopyWith<$Res> {
  factory $SavedProfilesEventsStateCopyWith(SavedProfilesEventsState value,
          $Res Function(SavedProfilesEventsState) then) =
      _$SavedProfilesEventsStateCopyWithImpl<$Res, SavedProfilesEventsState>;
  @useResult
  $Res call({List<UserAccountsModel> users, bool loading, String currentToken});
}

/// @nodoc
class _$SavedProfilesEventsStateCopyWithImpl<$Res,
        $Val extends SavedProfilesEventsState>
    implements $SavedProfilesEventsStateCopyWith<$Res> {
  _$SavedProfilesEventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? loading = null,
    Object? currentToken = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserAccountsModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentToken: null == currentToken
          ? _value.currentToken
          : currentToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedProfilesEventsStateImplCopyWith<$Res>
    implements $SavedProfilesEventsStateCopyWith<$Res> {
  factory _$$SavedProfilesEventsStateImplCopyWith(
          _$SavedProfilesEventsStateImpl value,
          $Res Function(_$SavedProfilesEventsStateImpl) then) =
      __$$SavedProfilesEventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserAccountsModel> users, bool loading, String currentToken});
}

/// @nodoc
class __$$SavedProfilesEventsStateImplCopyWithImpl<$Res>
    extends _$SavedProfilesEventsStateCopyWithImpl<$Res,
        _$SavedProfilesEventsStateImpl>
    implements _$$SavedProfilesEventsStateImplCopyWith<$Res> {
  __$$SavedProfilesEventsStateImplCopyWithImpl(
      _$SavedProfilesEventsStateImpl _value,
      $Res Function(_$SavedProfilesEventsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? loading = null,
    Object? currentToken = null,
  }) {
    return _then(_$SavedProfilesEventsStateImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserAccountsModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentToken: null == currentToken
          ? _value.currentToken
          : currentToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SavedProfilesEventsStateImpl implements _SavedProfilesEventsState {
  const _$SavedProfilesEventsStateImpl(
      {final List<UserAccountsModel> users = const [],
      this.loading = false,
      this.currentToken = ""})
      : _users = users;

  final List<UserAccountsModel> _users;
  @override
  @JsonKey()
  List<UserAccountsModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final String currentToken;

  @override
  String toString() {
    return 'SavedProfilesEventsState(users: $users, loading: $loading, currentToken: $currentToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedProfilesEventsStateImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.currentToken, currentToken) ||
                other.currentToken == currentToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_users), loading, currentToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedProfilesEventsStateImplCopyWith<_$SavedProfilesEventsStateImpl>
      get copyWith => __$$SavedProfilesEventsStateImplCopyWithImpl<
          _$SavedProfilesEventsStateImpl>(this, _$identity);
}

abstract class _SavedProfilesEventsState implements SavedProfilesEventsState {
  const factory _SavedProfilesEventsState(
      {final List<UserAccountsModel> users,
      final bool loading,
      final String currentToken}) = _$SavedProfilesEventsStateImpl;

  @override
  List<UserAccountsModel> get users;
  @override
  bool get loading;
  @override
  String get currentToken;
  @override
  @JsonKey(ignore: true)
  _$$SavedProfilesEventsStateImplCopyWith<_$SavedProfilesEventsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
