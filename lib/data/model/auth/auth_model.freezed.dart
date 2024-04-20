// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  String? get id => throw _privateConstructorUsedError;
  bool? get facebook => throw _privateConstructorUsedError;
  bool? get apple => throw _privateConstructorUsedError;
  bool? get email => throw _privateConstructorUsedError;
  bool? get twitter => throw _privateConstructorUsedError;
  bool? get google => throw _privateConstructorUsedError;
  bool? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call(
      {String? id,
      bool? facebook,
      bool? apple,
      bool? email,
      bool? twitter,
      bool? google,
      bool? otp});
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? facebook = freezed,
    Object? apple = freezed,
    Object? email = freezed,
    Object? twitter = freezed,
    Object? google = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as bool?,
      apple: freezed == apple
          ? _value.apple
          : apple // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as bool?,
      google: freezed == google
          ? _value.google
          : google // ignore: cast_nullable_to_non_nullable
              as bool?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthModelImplCopyWith<$Res>
    implements $AuthModelCopyWith<$Res> {
  factory _$$AuthModelImplCopyWith(
          _$AuthModelImpl value, $Res Function(_$AuthModelImpl) then) =
      __$$AuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      bool? facebook,
      bool? apple,
      bool? email,
      bool? twitter,
      bool? google,
      bool? otp});
}

/// @nodoc
class __$$AuthModelImplCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$AuthModelImpl>
    implements _$$AuthModelImplCopyWith<$Res> {
  __$$AuthModelImplCopyWithImpl(
      _$AuthModelImpl _value, $Res Function(_$AuthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? facebook = freezed,
    Object? apple = freezed,
    Object? email = freezed,
    Object? twitter = freezed,
    Object? google = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$AuthModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as bool?,
      apple: freezed == apple
          ? _value.apple
          : apple // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as bool?,
      google: freezed == google
          ? _value.google
          : google // ignore: cast_nullable_to_non_nullable
              as bool?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthModelImpl implements _AuthModel {
  const _$AuthModelImpl(
      {this.id,
      this.facebook,
      this.apple,
      this.email,
      this.twitter,
      this.google,
      this.otp});

  factory _$AuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthModelImplFromJson(json);

  @override
  final String? id;
  @override
  final bool? facebook;
  @override
  final bool? apple;
  @override
  final bool? email;
  @override
  final bool? twitter;
  @override
  final bool? google;
  @override
  final bool? otp;

  @override
  String toString() {
    return 'AuthModel(id: $id, facebook: $facebook, apple: $apple, email: $email, twitter: $twitter, google: $google, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.apple, apple) || other.apple == apple) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.google, google) || other.google == google) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, facebook, apple, email, twitter, google, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      __$$AuthModelImplCopyWithImpl<_$AuthModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthModelImplToJson(
      this,
    );
  }
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel(
      {final String? id,
      final bool? facebook,
      final bool? apple,
      final bool? email,
      final bool? twitter,
      final bool? google,
      final bool? otp}) = _$AuthModelImpl;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$AuthModelImpl.fromJson;

  @override
  String? get id;
  @override
  bool? get facebook;
  @override
  bool? get apple;
  @override
  bool? get email;
  @override
  bool? get twitter;
  @override
  bool? get google;
  @override
  bool? get otp;
  @override
  @JsonKey(ignore: true)
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
