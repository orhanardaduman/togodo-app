// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ready_template_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadyTemplateState {
  List<ReadyTemplateModel> get data => throw _privateConstructorUsedError;
  Map<int, List<ReadyTemplateModel>>? get groupedData =>
      throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get dataLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadyTemplateStateCopyWith<ReadyTemplateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyTemplateStateCopyWith<$Res> {
  factory $ReadyTemplateStateCopyWith(
          ReadyTemplateState value, $Res Function(ReadyTemplateState) then) =
      _$ReadyTemplateStateCopyWithImpl<$Res, ReadyTemplateState>;
  @useResult
  $Res call(
      {List<ReadyTemplateModel> data,
      Map<int, List<ReadyTemplateModel>>? groupedData,
      int pagination,
      bool loading,
      bool dataLoading});
}

/// @nodoc
class _$ReadyTemplateStateCopyWithImpl<$Res, $Val extends ReadyTemplateState>
    implements $ReadyTemplateStateCopyWith<$Res> {
  _$ReadyTemplateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? groupedData = freezed,
    Object? pagination = null,
    Object? loading = null,
    Object? dataLoading = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReadyTemplateModel>,
      groupedData: freezed == groupedData
          ? _value.groupedData
          : groupedData // ignore: cast_nullable_to_non_nullable
              as Map<int, List<ReadyTemplateModel>>?,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      dataLoading: null == dataLoading
          ? _value.dataLoading
          : dataLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadyTemplateStateImplCopyWith<$Res>
    implements $ReadyTemplateStateCopyWith<$Res> {
  factory _$$ReadyTemplateStateImplCopyWith(_$ReadyTemplateStateImpl value,
          $Res Function(_$ReadyTemplateStateImpl) then) =
      __$$ReadyTemplateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReadyTemplateModel> data,
      Map<int, List<ReadyTemplateModel>>? groupedData,
      int pagination,
      bool loading,
      bool dataLoading});
}

/// @nodoc
class __$$ReadyTemplateStateImplCopyWithImpl<$Res>
    extends _$ReadyTemplateStateCopyWithImpl<$Res, _$ReadyTemplateStateImpl>
    implements _$$ReadyTemplateStateImplCopyWith<$Res> {
  __$$ReadyTemplateStateImplCopyWithImpl(_$ReadyTemplateStateImpl _value,
      $Res Function(_$ReadyTemplateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? groupedData = freezed,
    Object? pagination = null,
    Object? loading = null,
    Object? dataLoading = null,
  }) {
    return _then(_$ReadyTemplateStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReadyTemplateModel>,
      groupedData: freezed == groupedData
          ? _value._groupedData
          : groupedData // ignore: cast_nullable_to_non_nullable
              as Map<int, List<ReadyTemplateModel>>?,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      dataLoading: null == dataLoading
          ? _value.dataLoading
          : dataLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReadyTemplateStateImpl implements _ReadyTemplateState {
  const _$ReadyTemplateStateImpl(
      {final List<ReadyTemplateModel> data = const [],
      final Map<int, List<ReadyTemplateModel>>? groupedData = null,
      this.pagination = 0,
      this.loading = false,
      this.dataLoading = false})
      : _data = data,
        _groupedData = groupedData;

  final List<ReadyTemplateModel> _data;
  @override
  @JsonKey()
  List<ReadyTemplateModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final Map<int, List<ReadyTemplateModel>>? _groupedData;
  @override
  @JsonKey()
  Map<int, List<ReadyTemplateModel>>? get groupedData {
    final value = _groupedData;
    if (value == null) return null;
    if (_groupedData is EqualUnmodifiableMapView) return _groupedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int pagination;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool dataLoading;

  @override
  String toString() {
    return 'ReadyTemplateState(data: $data, groupedData: $groupedData, pagination: $pagination, loading: $loading, dataLoading: $dataLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadyTemplateStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._groupedData, _groupedData) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.dataLoading, dataLoading) ||
                other.dataLoading == dataLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_groupedData),
      pagination,
      loading,
      dataLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadyTemplateStateImplCopyWith<_$ReadyTemplateStateImpl> get copyWith =>
      __$$ReadyTemplateStateImplCopyWithImpl<_$ReadyTemplateStateImpl>(
          this, _$identity);
}

abstract class _ReadyTemplateState implements ReadyTemplateState {
  const factory _ReadyTemplateState(
      {final List<ReadyTemplateModel> data,
      final Map<int, List<ReadyTemplateModel>>? groupedData,
      final int pagination,
      final bool loading,
      final bool dataLoading}) = _$ReadyTemplateStateImpl;

  @override
  List<ReadyTemplateModel> get data;
  @override
  Map<int, List<ReadyTemplateModel>>? get groupedData;
  @override
  int get pagination;
  @override
  bool get loading;
  @override
  bool get dataLoading;
  @override
  @JsonKey(ignore: true)
  _$$ReadyTemplateStateImplCopyWith<_$ReadyTemplateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
