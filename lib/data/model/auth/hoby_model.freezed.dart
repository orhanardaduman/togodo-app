// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hoby_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HobyModel _$HobyModelFromJson(Map<String, dynamic> json) {
  return _HobyModel.fromJson(json);
}

/// @nodoc
mixin _$HobyModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this HobyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HobyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HobyModelCopyWith<HobyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HobyModelCopyWith<$Res> {
  factory $HobyModelCopyWith(HobyModel value, $Res Function(HobyModel) then) =
      _$HobyModelCopyWithImpl<$Res, HobyModel>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$HobyModelCopyWithImpl<$Res, $Val extends HobyModel>
    implements $HobyModelCopyWith<$Res> {
  _$HobyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HobyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HobyModelImplCopyWith<$Res>
    implements $HobyModelCopyWith<$Res> {
  factory _$$HobyModelImplCopyWith(
          _$HobyModelImpl value, $Res Function(_$HobyModelImpl) then) =
      __$$HobyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$HobyModelImplCopyWithImpl<$Res>
    extends _$HobyModelCopyWithImpl<$Res, _$HobyModelImpl>
    implements _$$HobyModelImplCopyWith<$Res> {
  __$$HobyModelImplCopyWithImpl(
      _$HobyModelImpl _value, $Res Function(_$HobyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HobyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$HobyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HobyModelImpl implements _HobyModel {
  const _$HobyModelImpl({this.id, this.name});

  factory _$HobyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HobyModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'HobyModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HobyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of HobyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HobyModelImplCopyWith<_$HobyModelImpl> get copyWith =>
      __$$HobyModelImplCopyWithImpl<_$HobyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HobyModelImplToJson(
      this,
    );
  }
}

abstract class _HobyModel implements HobyModel {
  const factory _HobyModel({final int? id, final String? name}) =
      _$HobyModelImpl;

  factory _HobyModel.fromJson(Map<String, dynamic> json) =
      _$HobyModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of HobyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HobyModelImplCopyWith<_$HobyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
