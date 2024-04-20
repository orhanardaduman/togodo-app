// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscoveryState {
  List<DiscoveryModel> get data => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get pageLoading => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoveryStateCopyWith<DiscoveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoveryStateCopyWith<$Res> {
  factory $DiscoveryStateCopyWith(
          DiscoveryState value, $Res Function(DiscoveryState) then) =
      _$DiscoveryStateCopyWithImpl<$Res, DiscoveryState>;
  @useResult
  $Res call(
      {List<DiscoveryModel> data,
      int pagination,
      bool loading,
      bool pageLoading,
      String? location});
}

/// @nodoc
class _$DiscoveryStateCopyWithImpl<$Res, $Val extends DiscoveryState>
    implements $DiscoveryStateCopyWith<$Res> {
  _$DiscoveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? pagination = null,
    Object? loading = null,
    Object? pageLoading = null,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiscoveryModel>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLoading: null == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoveryStateImplCopyWith<$Res>
    implements $DiscoveryStateCopyWith<$Res> {
  factory _$$DiscoveryStateImplCopyWith(_$DiscoveryStateImpl value,
          $Res Function(_$DiscoveryStateImpl) then) =
      __$$DiscoveryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DiscoveryModel> data,
      int pagination,
      bool loading,
      bool pageLoading,
      String? location});
}

/// @nodoc
class __$$DiscoveryStateImplCopyWithImpl<$Res>
    extends _$DiscoveryStateCopyWithImpl<$Res, _$DiscoveryStateImpl>
    implements _$$DiscoveryStateImplCopyWith<$Res> {
  __$$DiscoveryStateImplCopyWithImpl(
      _$DiscoveryStateImpl _value, $Res Function(_$DiscoveryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? pagination = null,
    Object? loading = null,
    Object? pageLoading = null,
    Object? location = freezed,
  }) {
    return _then(_$DiscoveryStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiscoveryModel>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLoading: null == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DiscoveryStateImpl
    with DiagnosticableTreeMixin
    implements _DiscoveryState {
  const _$DiscoveryStateImpl(
      {final List<DiscoveryModel> data = const [],
      this.pagination = 0,
      this.loading = false,
      this.pageLoading = false,
      this.location = null})
      : _data = data;

  final List<DiscoveryModel> _data;
  @override
  @JsonKey()
  List<DiscoveryModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int pagination;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool pageLoading;
  @override
  @JsonKey()
  final String? location;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiscoveryState(data: $data, pagination: $pagination, loading: $loading, pageLoading: $pageLoading, location: $location)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiscoveryState'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('pagination', pagination))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('pageLoading', pageLoading))
      ..add(DiagnosticsProperty('location', location));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoveryStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      pagination,
      loading,
      pageLoading,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoveryStateImplCopyWith<_$DiscoveryStateImpl> get copyWith =>
      __$$DiscoveryStateImplCopyWithImpl<_$DiscoveryStateImpl>(
          this, _$identity);
}

abstract class _DiscoveryState implements DiscoveryState {
  const factory _DiscoveryState(
      {final List<DiscoveryModel> data,
      final int pagination,
      final bool loading,
      final bool pageLoading,
      final String? location}) = _$DiscoveryStateImpl;

  @override
  List<DiscoveryModel> get data;
  @override
  int get pagination;
  @override
  bool get loading;
  @override
  bool get pageLoading;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$DiscoveryStateImplCopyWith<_$DiscoveryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
