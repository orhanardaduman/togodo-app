// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_relations_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlockRelationsState {
  List<UserSearchModel> get blockRelations =>
      throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;

  /// Create a copy of BlockRelationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockRelationsStateCopyWith<BlockRelationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockRelationsStateCopyWith<$Res> {
  factory $BlockRelationsStateCopyWith(
          BlockRelationsState value, $Res Function(BlockRelationsState) then) =
      _$BlockRelationsStateCopyWithImpl<$Res, BlockRelationsState>;
  @useResult
  $Res call(
      {List<UserSearchModel> blockRelations, bool loading, int pagination});
}

/// @nodoc
class _$BlockRelationsStateCopyWithImpl<$Res, $Val extends BlockRelationsState>
    implements $BlockRelationsStateCopyWith<$Res> {
  _$BlockRelationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockRelationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockRelations = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      blockRelations: null == blockRelations
          ? _value.blockRelations
          : blockRelations // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BlockRelationsStateImplCopyWith<$Res>
    implements $BlockRelationsStateCopyWith<$Res> {
  factory _$$BlockRelationsStateImplCopyWith(_$BlockRelationsStateImpl value,
          $Res Function(_$BlockRelationsStateImpl) then) =
      __$$BlockRelationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserSearchModel> blockRelations, bool loading, int pagination});
}

/// @nodoc
class __$$BlockRelationsStateImplCopyWithImpl<$Res>
    extends _$BlockRelationsStateCopyWithImpl<$Res, _$BlockRelationsStateImpl>
    implements _$$BlockRelationsStateImplCopyWith<$Res> {
  __$$BlockRelationsStateImplCopyWithImpl(_$BlockRelationsStateImpl _value,
      $Res Function(_$BlockRelationsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockRelationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockRelations = null,
    Object? loading = null,
    Object? pagination = null,
  }) {
    return _then(_$BlockRelationsStateImpl(
      blockRelations: null == blockRelations
          ? _value._blockRelations
          : blockRelations // ignore: cast_nullable_to_non_nullable
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

class _$BlockRelationsStateImpl implements _BlockRelationsState {
  const _$BlockRelationsStateImpl(
      {final List<UserSearchModel> blockRelations = const [],
      this.loading = false,
      this.pagination = 0})
      : _blockRelations = blockRelations;

  final List<UserSearchModel> _blockRelations;
  @override
  @JsonKey()
  List<UserSearchModel> get blockRelations {
    if (_blockRelations is EqualUnmodifiableListView) return _blockRelations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockRelations);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int pagination;

  @override
  String toString() {
    return 'BlockRelationsState(blockRelations: $blockRelations, loading: $loading, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockRelationsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._blockRelations, _blockRelations) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_blockRelations),
      loading,
      pagination);

  /// Create a copy of BlockRelationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockRelationsStateImplCopyWith<_$BlockRelationsStateImpl> get copyWith =>
      __$$BlockRelationsStateImplCopyWithImpl<_$BlockRelationsStateImpl>(
          this, _$identity);
}

abstract class _BlockRelationsState implements BlockRelationsState {
  const factory _BlockRelationsState(
      {final List<UserSearchModel> blockRelations,
      final bool loading,
      final int pagination}) = _$BlockRelationsStateImpl;

  @override
  List<UserSearchModel> get blockRelations;
  @override
  bool get loading;
  @override
  int get pagination;

  /// Create a copy of BlockRelationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockRelationsStateImplCopyWith<_$BlockRelationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
