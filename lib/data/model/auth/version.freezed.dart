// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
mixin _$Version {
  String? get id => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get appStore => throw _privateConstructorUsedError;
  String? get googlePlay => throw _privateConstructorUsedError;

  /// Serializes this Version to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Version
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res, Version>;
  @useResult
  $Res call({String? id, String? number, String? appStore, String? googlePlay});
}

/// @nodoc
class _$VersionCopyWithImpl<$Res, $Val extends Version>
    implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Version
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? appStore = freezed,
    Object? googlePlay = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      appStore: freezed == appStore
          ? _value.appStore
          : appStore // ignore: cast_nullable_to_non_nullable
              as String?,
      googlePlay: freezed == googlePlay
          ? _value.googlePlay
          : googlePlay // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionImplCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$$VersionImplCopyWith(
          _$VersionImpl value, $Res Function(_$VersionImpl) then) =
      __$$VersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? number, String? appStore, String? googlePlay});
}

/// @nodoc
class __$$VersionImplCopyWithImpl<$Res>
    extends _$VersionCopyWithImpl<$Res, _$VersionImpl>
    implements _$$VersionImplCopyWith<$Res> {
  __$$VersionImplCopyWithImpl(
      _$VersionImpl _value, $Res Function(_$VersionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Version
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? appStore = freezed,
    Object? googlePlay = freezed,
  }) {
    return _then(_$VersionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      appStore: freezed == appStore
          ? _value.appStore
          : appStore // ignore: cast_nullable_to_non_nullable
              as String?,
      googlePlay: freezed == googlePlay
          ? _value.googlePlay
          : googlePlay // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VersionImpl implements _Version {
  const _$VersionImpl({this.id, this.number, this.appStore, this.googlePlay});

  factory _$VersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionImplFromJson(json);

  @override
  final String? id;
  @override
  final String? number;
  @override
  final String? appStore;
  @override
  final String? googlePlay;

  @override
  String toString() {
    return 'Version(id: $id, number: $number, appStore: $appStore, googlePlay: $googlePlay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.appStore, appStore) ||
                other.appStore == appStore) &&
            (identical(other.googlePlay, googlePlay) ||
                other.googlePlay == googlePlay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, number, appStore, googlePlay);

  /// Create a copy of Version
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionImplCopyWith<_$VersionImpl> get copyWith =>
      __$$VersionImplCopyWithImpl<_$VersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionImplToJson(
      this,
    );
  }
}

abstract class _Version implements Version {
  const factory _Version(
      {final String? id,
      final String? number,
      final String? appStore,
      final String? googlePlay}) = _$VersionImpl;

  factory _Version.fromJson(Map<String, dynamic> json) = _$VersionImpl.fromJson;

  @override
  String? get id;
  @override
  String? get number;
  @override
  String? get appStore;
  @override
  String? get googlePlay;

  /// Create a copy of Version
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VersionImplCopyWith<_$VersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
