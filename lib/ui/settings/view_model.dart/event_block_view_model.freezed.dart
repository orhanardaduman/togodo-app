// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_block_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventBlockState {
  List<UserSearchModel> get data => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventBlockStateCopyWith<EventBlockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventBlockStateCopyWith<$Res> {
  factory $EventBlockStateCopyWith(
          EventBlockState value, $Res Function(EventBlockState) then) =
      _$EventBlockStateCopyWithImpl<$Res, EventBlockState>;
  @useResult
  $Res call({List<UserSearchModel> data, bool loading, int pagination});
}

/// @nodoc
class _$EventBlockStateCopyWithImpl<$Res, $Val extends EventBlockState>
    implements $EventBlockStateCopyWith<$Res> {
  _$EventBlockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserSearchModel>,
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
abstract class _$$EventBlockStateImplCopyWith<$Res>
    implements $EventBlockStateCopyWith<$Res> {
  factory _$$EventBlockStateImplCopyWith(_$EventBlockStateImpl value,
          $Res Function(_$EventBlockStateImpl) then) =
      __$$EventBlockStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserSearchModel> data, bool loading, int pagination});
}

/// @nodoc
class __$$EventBlockStateImplCopyWithImpl<$Res>
    extends _$EventBlockStateCopyWithImpl<$Res, _$EventBlockStateImpl>
    implements _$$EventBlockStateImplCopyWith<$Res> {
  __$$EventBlockStateImplCopyWithImpl(
      _$EventBlockStateImpl _value, $Res Function(_$EventBlockStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_$EventBlockStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserSearchModel>,
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

class _$EventBlockStateImpl implements _EventBlockState {
  const _$EventBlockStateImpl(
      {final List<UserSearchModel> data = const [],
      this.loading = false,
      this.pagination = 0})
      : _data = data;

  final List<UserSearchModel> _data;
  @override
  @JsonKey()
  List<UserSearchModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int pagination;

  @override
  String toString() {
    return 'EventBlockState(data: $data, loading: $loading, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventBlockStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), loading, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventBlockStateImplCopyWith<_$EventBlockStateImpl> get copyWith =>
      __$$EventBlockStateImplCopyWithImpl<_$EventBlockStateImpl>(
          this, _$identity);
}

abstract class _EventBlockState implements EventBlockState {
  const factory _EventBlockState(
      {final List<UserSearchModel> data,
      final bool loading,
      final int pagination}) = _$EventBlockStateImpl;

  @override
  List<UserSearchModel> get data;
  @override
  bool get loading;
  @override
  int get pagination;
  @override
  @JsonKey(ignore: true)
  _$$EventBlockStateImplCopyWith<_$EventBlockStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
