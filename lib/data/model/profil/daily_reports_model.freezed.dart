// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_reports_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyReportsModel _$DailyReportsModelFromJson(Map<String, dynamic> json) {
  return _DailyReportsModel.fromJson(json);
}

/// @nodoc
mixin _$DailyReportsModel {
  int? get total => throw _privateConstructorUsedError;
  int? get daily => throw _privateConstructorUsedError;

  /// Serializes this DailyReportsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyReportsModelCopyWith<DailyReportsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReportsModelCopyWith<$Res> {
  factory $DailyReportsModelCopyWith(
          DailyReportsModel value, $Res Function(DailyReportsModel) then) =
      _$DailyReportsModelCopyWithImpl<$Res, DailyReportsModel>;
  @useResult
  $Res call({int? total, int? daily});
}

/// @nodoc
class _$DailyReportsModelCopyWithImpl<$Res, $Val extends DailyReportsModel>
    implements $DailyReportsModelCopyWith<$Res> {
  _$DailyReportsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? daily = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      daily: freezed == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyReportsModelImplCopyWith<$Res>
    implements $DailyReportsModelCopyWith<$Res> {
  factory _$$DailyReportsModelImplCopyWith(_$DailyReportsModelImpl value,
          $Res Function(_$DailyReportsModelImpl) then) =
      __$$DailyReportsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, int? daily});
}

/// @nodoc
class __$$DailyReportsModelImplCopyWithImpl<$Res>
    extends _$DailyReportsModelCopyWithImpl<$Res, _$DailyReportsModelImpl>
    implements _$$DailyReportsModelImplCopyWith<$Res> {
  __$$DailyReportsModelImplCopyWithImpl(_$DailyReportsModelImpl _value,
      $Res Function(_$DailyReportsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? daily = freezed,
  }) {
    return _then(_$DailyReportsModelImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      daily: freezed == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyReportsModelImpl implements _DailyReportsModel {
  const _$DailyReportsModelImpl({this.total, this.daily});

  factory _$DailyReportsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyReportsModelImplFromJson(json);

  @override
  final int? total;
  @override
  final int? daily;

  @override
  String toString() {
    return 'DailyReportsModel(total: $total, daily: $daily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyReportsModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.daily, daily) || other.daily == daily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, daily);

  /// Create a copy of DailyReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyReportsModelImplCopyWith<_$DailyReportsModelImpl> get copyWith =>
      __$$DailyReportsModelImplCopyWithImpl<_$DailyReportsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyReportsModelImplToJson(
      this,
    );
  }
}

abstract class _DailyReportsModel implements DailyReportsModel {
  const factory _DailyReportsModel({final int? total, final int? daily}) =
      _$DailyReportsModelImpl;

  factory _DailyReportsModel.fromJson(Map<String, dynamic> json) =
      _$DailyReportsModelImpl.fromJson;

  @override
  int? get total;
  @override
  int? get daily;

  /// Create a copy of DailyReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyReportsModelImplCopyWith<_$DailyReportsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
