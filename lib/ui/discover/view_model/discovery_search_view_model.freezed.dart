// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_search_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscoverySearchState {
  bool get isShowClearFilter => throw _privateConstructorUsedError;
  bool get isRefresh => throw _privateConstructorUsedError;

  /// Create a copy of DiscoverySearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscoverySearchStateCopyWith<DiscoverySearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverySearchStateCopyWith<$Res> {
  factory $DiscoverySearchStateCopyWith(DiscoverySearchState value,
          $Res Function(DiscoverySearchState) then) =
      _$DiscoverySearchStateCopyWithImpl<$Res, DiscoverySearchState>;
  @useResult
  $Res call({bool isShowClearFilter, bool isRefresh});
}

/// @nodoc
class _$DiscoverySearchStateCopyWithImpl<$Res,
        $Val extends DiscoverySearchState>
    implements $DiscoverySearchStateCopyWith<$Res> {
  _$DiscoverySearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscoverySearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowClearFilter = null,
    Object? isRefresh = null,
  }) {
    return _then(_value.copyWith(
      isShowClearFilter: null == isShowClearFilter
          ? _value.isShowClearFilter
          : isShowClearFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoveryStateImplCopyWith<$Res>
    implements $DiscoverySearchStateCopyWith<$Res> {
  factory _$$DiscoveryStateImplCopyWith(_$DiscoveryStateImpl value,
          $Res Function(_$DiscoveryStateImpl) then) =
      __$$DiscoveryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isShowClearFilter, bool isRefresh});
}

/// @nodoc
class __$$DiscoveryStateImplCopyWithImpl<$Res>
    extends _$DiscoverySearchStateCopyWithImpl<$Res, _$DiscoveryStateImpl>
    implements _$$DiscoveryStateImplCopyWith<$Res> {
  __$$DiscoveryStateImplCopyWithImpl(
      _$DiscoveryStateImpl _value, $Res Function(_$DiscoveryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscoverySearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowClearFilter = null,
    Object? isRefresh = null,
  }) {
    return _then(_$DiscoveryStateImpl(
      isShowClearFilter: null == isShowClearFilter
          ? _value.isShowClearFilter
          : isShowClearFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DiscoveryStateImpl implements _DiscoveryState {
  const _$DiscoveryStateImpl(
      {this.isShowClearFilter = false, this.isRefresh = false});

  @override
  @JsonKey()
  final bool isShowClearFilter;
  @override
  @JsonKey()
  final bool isRefresh;

  @override
  String toString() {
    return 'DiscoverySearchState(isShowClearFilter: $isShowClearFilter, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoveryStateImpl &&
            (identical(other.isShowClearFilter, isShowClearFilter) ||
                other.isShowClearFilter == isShowClearFilter) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isShowClearFilter, isRefresh);

  /// Create a copy of DiscoverySearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoveryStateImplCopyWith<_$DiscoveryStateImpl> get copyWith =>
      __$$DiscoveryStateImplCopyWithImpl<_$DiscoveryStateImpl>(
          this, _$identity);
}

abstract class _DiscoveryState implements DiscoverySearchState {
  const factory _DiscoveryState(
      {final bool isShowClearFilter,
      final bool isRefresh}) = _$DiscoveryStateImpl;

  @override
  bool get isShowClearFilter;
  @override
  bool get isRefresh;

  /// Create a copy of DiscoverySearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscoveryStateImplCopyWith<_$DiscoveryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
