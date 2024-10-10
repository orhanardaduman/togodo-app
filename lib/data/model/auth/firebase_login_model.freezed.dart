// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirebaseLoginModel _$FirebaseLoginModelFromJson(Map<String, dynamic> json) {
  return _FirebaseLoginModel.fromJson(json);
}

/// @nodoc
mixin _$FirebaseLoginModel {
  String? get idToken => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  /// Serializes this FirebaseLoginModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FirebaseLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirebaseLoginModelCopyWith<FirebaseLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseLoginModelCopyWith<$Res> {
  factory $FirebaseLoginModelCopyWith(
          FirebaseLoginModel value, $Res Function(FirebaseLoginModel) then) =
      _$FirebaseLoginModelCopyWithImpl<$Res, FirebaseLoginModel>;
  @useResult
  $Res call(
      {String? idToken,
      String? deviceId,
      String? location,
      String? name,
      String? email,
      String? surname,
      String? phoneNumber,
      String? imagePath});
}

/// @nodoc
class _$FirebaseLoginModelCopyWithImpl<$Res, $Val extends FirebaseLoginModel>
    implements $FirebaseLoginModelCopyWith<$Res> {
  _$FirebaseLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? deviceId = freezed,
    Object? location = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? surname = freezed,
    Object? phoneNumber = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirebaseLoginModelImplCopyWith<$Res>
    implements $FirebaseLoginModelCopyWith<$Res> {
  factory _$$FirebaseLoginModelImplCopyWith(_$FirebaseLoginModelImpl value,
          $Res Function(_$FirebaseLoginModelImpl) then) =
      __$$FirebaseLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idToken,
      String? deviceId,
      String? location,
      String? name,
      String? email,
      String? surname,
      String? phoneNumber,
      String? imagePath});
}

/// @nodoc
class __$$FirebaseLoginModelImplCopyWithImpl<$Res>
    extends _$FirebaseLoginModelCopyWithImpl<$Res, _$FirebaseLoginModelImpl>
    implements _$$FirebaseLoginModelImplCopyWith<$Res> {
  __$$FirebaseLoginModelImplCopyWithImpl(_$FirebaseLoginModelImpl _value,
      $Res Function(_$FirebaseLoginModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? deviceId = freezed,
    Object? location = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? surname = freezed,
    Object? phoneNumber = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_$FirebaseLoginModelImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseLoginModelImpl implements _FirebaseLoginModel {
  const _$FirebaseLoginModelImpl(
      {this.idToken,
      this.deviceId,
      this.location,
      this.name,
      this.email,
      this.surname,
      this.phoneNumber,
      this.imagePath});

  factory _$FirebaseLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseLoginModelImplFromJson(json);

  @override
  final String? idToken;
  @override
  final String? deviceId;
  @override
  final String? location;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? surname;
  @override
  final String? phoneNumber;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'FirebaseLoginModel(idToken: $idToken, deviceId: $deviceId, location: $location, name: $name, email: $email, surname: $surname, phoneNumber: $phoneNumber, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseLoginModelImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken, deviceId, location,
      name, email, surname, phoneNumber, imagePath);

  /// Create a copy of FirebaseLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseLoginModelImplCopyWith<_$FirebaseLoginModelImpl> get copyWith =>
      __$$FirebaseLoginModelImplCopyWithImpl<_$FirebaseLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseLoginModelImplToJson(
      this,
    );
  }
}

abstract class _FirebaseLoginModel implements FirebaseLoginModel {
  const factory _FirebaseLoginModel(
      {final String? idToken,
      final String? deviceId,
      final String? location,
      final String? name,
      final String? email,
      final String? surname,
      final String? phoneNumber,
      final String? imagePath}) = _$FirebaseLoginModelImpl;

  factory _FirebaseLoginModel.fromJson(Map<String, dynamic> json) =
      _$FirebaseLoginModelImpl.fromJson;

  @override
  String? get idToken;
  @override
  String? get deviceId;
  @override
  String? get location;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get surname;
  @override
  String? get phoneNumber;
  @override
  String? get imagePath;

  /// Create a copy of FirebaseLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseLoginModelImplCopyWith<_$FirebaseLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
