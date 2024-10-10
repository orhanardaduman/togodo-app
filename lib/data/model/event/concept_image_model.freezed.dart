// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concept_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConceptImageModel _$ConceptImageModelFromJson(Map<String, dynamic> json) {
  return _ConceptImageModel.fromJson(json);
}

/// @nodoc
mixin _$ConceptImageModel {
  int? get number => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  bool? get isClick => throw _privateConstructorUsedError;

  /// Serializes this ConceptImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConceptImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConceptImageModelCopyWith<ConceptImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptImageModelCopyWith<$Res> {
  factory $ConceptImageModelCopyWith(
          ConceptImageModel value, $Res Function(ConceptImageModel) then) =
      _$ConceptImageModelCopyWithImpl<$Res, ConceptImageModel>;
  @useResult
  $Res call(
      {int? number, String? downloadUrl, bool? isSelected, bool? isClick});
}

/// @nodoc
class _$ConceptImageModelCopyWithImpl<$Res, $Val extends ConceptImageModel>
    implements $ConceptImageModelCopyWith<$Res> {
  _$ConceptImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConceptImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? downloadUrl = freezed,
    Object? isSelected = freezed,
    Object? isClick = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClick: freezed == isClick
          ? _value.isClick
          : isClick // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConceptImageModelImplCopyWith<$Res>
    implements $ConceptImageModelCopyWith<$Res> {
  factory _$$ConceptImageModelImplCopyWith(_$ConceptImageModelImpl value,
          $Res Function(_$ConceptImageModelImpl) then) =
      __$$ConceptImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? number, String? downloadUrl, bool? isSelected, bool? isClick});
}

/// @nodoc
class __$$ConceptImageModelImplCopyWithImpl<$Res>
    extends _$ConceptImageModelCopyWithImpl<$Res, _$ConceptImageModelImpl>
    implements _$$ConceptImageModelImplCopyWith<$Res> {
  __$$ConceptImageModelImplCopyWithImpl(_$ConceptImageModelImpl _value,
      $Res Function(_$ConceptImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? downloadUrl = freezed,
    Object? isSelected = freezed,
    Object? isClick = freezed,
  }) {
    return _then(_$ConceptImageModelImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClick: freezed == isClick
          ? _value.isClick
          : isClick // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConceptImageModelImpl implements _ConceptImageModel {
  const _$ConceptImageModelImpl(
      {this.number, this.downloadUrl, this.isSelected, this.isClick});

  factory _$ConceptImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConceptImageModelImplFromJson(json);

  @override
  final int? number;
  @override
  final String? downloadUrl;
  @override
  final bool? isSelected;
  @override
  final bool? isClick;

  @override
  String toString() {
    return 'ConceptImageModel(number: $number, downloadUrl: $downloadUrl, isSelected: $isSelected, isClick: $isClick)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptImageModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isClick, isClick) || other.isClick == isClick));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, number, downloadUrl, isSelected, isClick);

  /// Create a copy of ConceptImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptImageModelImplCopyWith<_$ConceptImageModelImpl> get copyWith =>
      __$$ConceptImageModelImplCopyWithImpl<_$ConceptImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConceptImageModelImplToJson(
      this,
    );
  }
}

abstract class _ConceptImageModel implements ConceptImageModel {
  const factory _ConceptImageModel(
      {final int? number,
      final String? downloadUrl,
      final bool? isSelected,
      final bool? isClick}) = _$ConceptImageModelImpl;

  factory _ConceptImageModel.fromJson(Map<String, dynamic> json) =
      _$ConceptImageModelImpl.fromJson;

  @override
  int? get number;
  @override
  String? get downloadUrl;
  @override
  bool? get isSelected;
  @override
  bool? get isClick;

  /// Create a copy of ConceptImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptImageModelImplCopyWith<_$ConceptImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
