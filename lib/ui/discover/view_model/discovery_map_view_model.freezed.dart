// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_map_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscoveryMapState {
  List<DiscoveryMapModel> get data => throw _privateConstructorUsedError;
  DiscoveryMapModel? get selectedMap => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  LatLng? get currentLatLng => throw _privateConstructorUsedError;
  String? get placeName => throw _privateConstructorUsedError;
  Map<String, MarkerModel>? get additionalMarkers =>
      throw _privateConstructorUsedError;
  CameraPosition? get position => throw _privateConstructorUsedError;
  Set<Marker>? get markers => throw _privateConstructorUsedError;
  bool get hideCard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoveryMapStateCopyWith<DiscoveryMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoveryMapStateCopyWith<$Res> {
  factory $DiscoveryMapStateCopyWith(
          DiscoveryMapState value, $Res Function(DiscoveryMapState) then) =
      _$DiscoveryMapStateCopyWithImpl<$Res, DiscoveryMapState>;
  @useResult
  $Res call(
      {List<DiscoveryMapModel> data,
      DiscoveryMapModel? selectedMap,
      int pagination,
      bool loading,
      LatLng? currentLatLng,
      String? placeName,
      Map<String, MarkerModel>? additionalMarkers,
      CameraPosition? position,
      Set<Marker>? markers,
      bool hideCard});

  $DiscoveryMapModelCopyWith<$Res>? get selectedMap;
}

/// @nodoc
class _$DiscoveryMapStateCopyWithImpl<$Res, $Val extends DiscoveryMapState>
    implements $DiscoveryMapStateCopyWith<$Res> {
  _$DiscoveryMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? selectedMap = freezed,
    Object? pagination = null,
    Object? loading = null,
    Object? currentLatLng = freezed,
    Object? placeName = freezed,
    Object? additionalMarkers = freezed,
    Object? position = freezed,
    Object? markers = freezed,
    Object? hideCard = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiscoveryMapModel>,
      selectedMap: freezed == selectedMap
          ? _value.selectedMap
          : selectedMap // ignore: cast_nullable_to_non_nullable
              as DiscoveryMapModel?,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLatLng: freezed == currentLatLng
          ? _value.currentLatLng
          : currentLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalMarkers: freezed == additionalMarkers
          ? _value.additionalMarkers
          : additionalMarkers // ignore: cast_nullable_to_non_nullable
              as Map<String, MarkerModel>?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as CameraPosition?,
      markers: freezed == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>?,
      hideCard: null == hideCard
          ? _value.hideCard
          : hideCard // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscoveryMapModelCopyWith<$Res>? get selectedMap {
    if (_value.selectedMap == null) {
      return null;
    }

    return $DiscoveryMapModelCopyWith<$Res>(_value.selectedMap!, (value) {
      return _then(_value.copyWith(selectedMap: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscoveryMapStateImplCopyWith<$Res>
    implements $DiscoveryMapStateCopyWith<$Res> {
  factory _$$DiscoveryMapStateImplCopyWith(_$DiscoveryMapStateImpl value,
          $Res Function(_$DiscoveryMapStateImpl) then) =
      __$$DiscoveryMapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DiscoveryMapModel> data,
      DiscoveryMapModel? selectedMap,
      int pagination,
      bool loading,
      LatLng? currentLatLng,
      String? placeName,
      Map<String, MarkerModel>? additionalMarkers,
      CameraPosition? position,
      Set<Marker>? markers,
      bool hideCard});

  @override
  $DiscoveryMapModelCopyWith<$Res>? get selectedMap;
}

/// @nodoc
class __$$DiscoveryMapStateImplCopyWithImpl<$Res>
    extends _$DiscoveryMapStateCopyWithImpl<$Res, _$DiscoveryMapStateImpl>
    implements _$$DiscoveryMapStateImplCopyWith<$Res> {
  __$$DiscoveryMapStateImplCopyWithImpl(_$DiscoveryMapStateImpl _value,
      $Res Function(_$DiscoveryMapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? selectedMap = freezed,
    Object? pagination = null,
    Object? loading = null,
    Object? currentLatLng = freezed,
    Object? placeName = freezed,
    Object? additionalMarkers = freezed,
    Object? position = freezed,
    Object? markers = freezed,
    Object? hideCard = null,
  }) {
    return _then(_$DiscoveryMapStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiscoveryMapModel>,
      selectedMap: freezed == selectedMap
          ? _value.selectedMap
          : selectedMap // ignore: cast_nullable_to_non_nullable
              as DiscoveryMapModel?,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLatLng: freezed == currentLatLng
          ? _value.currentLatLng
          : currentLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalMarkers: freezed == additionalMarkers
          ? _value._additionalMarkers
          : additionalMarkers // ignore: cast_nullable_to_non_nullable
              as Map<String, MarkerModel>?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as CameraPosition?,
      markers: freezed == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>?,
      hideCard: null == hideCard
          ? _value.hideCard
          : hideCard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DiscoveryMapStateImpl
    with DiagnosticableTreeMixin
    implements _DiscoveryMapState {
  const _$DiscoveryMapStateImpl(
      {final List<DiscoveryMapModel> data = const [],
      this.selectedMap = null,
      this.pagination = 0,
      this.loading = false,
      this.currentLatLng = null,
      this.placeName = null,
      final Map<String, MarkerModel>? additionalMarkers = null,
      this.position = null,
      final Set<Marker>? markers = null,
      this.hideCard = false})
      : _data = data,
        _additionalMarkers = additionalMarkers,
        _markers = markers;

  final List<DiscoveryMapModel> _data;
  @override
  @JsonKey()
  List<DiscoveryMapModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final DiscoveryMapModel? selectedMap;
  @override
  @JsonKey()
  final int pagination;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final LatLng? currentLatLng;
  @override
  @JsonKey()
  final String? placeName;
  final Map<String, MarkerModel>? _additionalMarkers;
  @override
  @JsonKey()
  Map<String, MarkerModel>? get additionalMarkers {
    final value = _additionalMarkers;
    if (value == null) return null;
    if (_additionalMarkers is EqualUnmodifiableMapView)
      return _additionalMarkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final CameraPosition? position;
  final Set<Marker>? _markers;
  @override
  @JsonKey()
  Set<Marker>? get markers {
    final value = _markers;
    if (value == null) return null;
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  @JsonKey()
  final bool hideCard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiscoveryMapState(data: $data, selectedMap: $selectedMap, pagination: $pagination, loading: $loading, currentLatLng: $currentLatLng, placeName: $placeName, additionalMarkers: $additionalMarkers, position: $position, markers: $markers, hideCard: $hideCard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiscoveryMapState'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('selectedMap', selectedMap))
      ..add(DiagnosticsProperty('pagination', pagination))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('currentLatLng', currentLatLng))
      ..add(DiagnosticsProperty('placeName', placeName))
      ..add(DiagnosticsProperty('additionalMarkers', additionalMarkers))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('markers', markers))
      ..add(DiagnosticsProperty('hideCard', hideCard));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoveryMapStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.selectedMap, selectedMap) ||
                other.selectedMap == selectedMap) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.currentLatLng, currentLatLng) ||
                other.currentLatLng == currentLatLng) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            const DeepCollectionEquality()
                .equals(other._additionalMarkers, _additionalMarkers) &&
            (identical(other.position, position) ||
                other.position == position) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.hideCard, hideCard) ||
                other.hideCard == hideCard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      selectedMap,
      pagination,
      loading,
      currentLatLng,
      placeName,
      const DeepCollectionEquality().hash(_additionalMarkers),
      position,
      const DeepCollectionEquality().hash(_markers),
      hideCard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoveryMapStateImplCopyWith<_$DiscoveryMapStateImpl> get copyWith =>
      __$$DiscoveryMapStateImplCopyWithImpl<_$DiscoveryMapStateImpl>(
          this, _$identity);
}

abstract class _DiscoveryMapState implements DiscoveryMapState {
  const factory _DiscoveryMapState(
      {final List<DiscoveryMapModel> data,
      final DiscoveryMapModel? selectedMap,
      final int pagination,
      final bool loading,
      final LatLng? currentLatLng,
      final String? placeName,
      final Map<String, MarkerModel>? additionalMarkers,
      final CameraPosition? position,
      final Set<Marker>? markers,
      final bool hideCard}) = _$DiscoveryMapStateImpl;

  @override
  List<DiscoveryMapModel> get data;
  @override
  DiscoveryMapModel? get selectedMap;
  @override
  int get pagination;
  @override
  bool get loading;
  @override
  LatLng? get currentLatLng;
  @override
  String? get placeName;
  @override
  Map<String, MarkerModel>? get additionalMarkers;
  @override
  CameraPosition? get position;
  @override
  Set<Marker>? get markers;
  @override
  bool get hideCard;
  @override
  @JsonKey(ignore: true)
  _$$DiscoveryMapStateImplCopyWith<_$DiscoveryMapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
