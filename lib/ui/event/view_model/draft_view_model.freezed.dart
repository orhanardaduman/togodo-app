// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DraftState {
  List<EventModel> get data => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get dataLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DraftStateCopyWith<DraftState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftStateCopyWith<$Res> {
  factory $DraftStateCopyWith(
          DraftState value, $Res Function(DraftState) then) =
      _$DraftStateCopyWithImpl<$Res, DraftState>;
  @useResult
  $Res call(
      {List<EventModel> data, int pagination, bool loading, bool dataLoading});
}

/// @nodoc
class _$DraftStateCopyWithImpl<$Res, $Val extends DraftState>
    implements $DraftStateCopyWith<$Res> {
  _$DraftStateCopyWithImpl(this._value, this._then);

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
    Object? dataLoading = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
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
abstract class _$$DraftStateImplCopyWith<$Res>
    implements $DraftStateCopyWith<$Res> {
  factory _$$DraftStateImplCopyWith(
          _$DraftStateImpl value, $Res Function(_$DraftStateImpl) then) =
      __$$DraftStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventModel> data, int pagination, bool loading, bool dataLoading});
}

/// @nodoc
class __$$DraftStateImplCopyWithImpl<$Res>
    extends _$DraftStateCopyWithImpl<$Res, _$DraftStateImpl>
    implements _$$DraftStateImplCopyWith<$Res> {
  __$$DraftStateImplCopyWithImpl(
      _$DraftStateImpl _value, $Res Function(_$DraftStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? pagination = null,
    Object? loading = null,
    Object? dataLoading = null,
  }) {
    return _then(_$DraftStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
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

class _$DraftStateImpl implements _DraftState {
  const _$DraftStateImpl(
      {final List<EventModel> data = const [],
      this.pagination = 0,
      this.loading = false,
      this.dataLoading = false})
      : _data = data;

  final List<EventModel> _data;
  @override
  @JsonKey()
  List<EventModel> get data {
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
  final bool dataLoading;

  @override
  String toString() {
    return 'DraftState(data: $data, pagination: $pagination, loading: $loading, dataLoading: $dataLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
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
      pagination,
      loading,
      dataLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftStateImplCopyWith<_$DraftStateImpl> get copyWith =>
      __$$DraftStateImplCopyWithImpl<_$DraftStateImpl>(this, _$identity);
}

abstract class _DraftState implements DraftState {
  const factory _DraftState(
      {final List<EventModel> data,
      final int pagination,
      final bool loading,
      final bool dataLoading}) = _$DraftStateImpl;

  @override
  List<EventModel> get data;
  @override
  int get pagination;
  @override
  bool get loading;
  @override
  bool get dataLoading;
  @override
  @JsonKey(ignore: true)
  _$$DraftStateImplCopyWith<_$DraftStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
