// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SecurityState {
  int get pagination => throw _privateConstructorUsedError;

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecurityStateCopyWith<SecurityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityStateCopyWith<$Res> {
  factory $SecurityStateCopyWith(
          SecurityState value, $Res Function(SecurityState) then) =
      _$SecurityStateCopyWithImpl<$Res, SecurityState>;
  @useResult
  $Res call({int pagination});
}

/// @nodoc
class _$SecurityStateCopyWithImpl<$Res, $Val extends SecurityState>
    implements $SecurityStateCopyWith<$Res> {
  _$SecurityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecurityStateImplCopyWith<$Res>
    implements $SecurityStateCopyWith<$Res> {
  factory _$$SecurityStateImplCopyWith(
          _$SecurityStateImpl value, $Res Function(_$SecurityStateImpl) then) =
      __$$SecurityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pagination});
}

/// @nodoc
class __$$SecurityStateImplCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$SecurityStateImpl>
    implements _$$SecurityStateImplCopyWith<$Res> {
  __$$SecurityStateImplCopyWithImpl(
      _$SecurityStateImpl _value, $Res Function(_$SecurityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_$SecurityStateImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SecurityStateImpl implements _SecurityState {
  const _$SecurityStateImpl({this.pagination = 0});

  @override
  @JsonKey()
  final int pagination;

  @override
  String toString() {
    return 'SecurityState(pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityStateImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityStateImplCopyWith<_$SecurityStateImpl> get copyWith =>
      __$$SecurityStateImplCopyWithImpl<_$SecurityStateImpl>(this, _$identity);
}

abstract class _SecurityState implements SecurityState {
  const factory _SecurityState({final int pagination}) = _$SecurityStateImpl;

  @override
  int get pagination;

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecurityStateImplCopyWith<_$SecurityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
