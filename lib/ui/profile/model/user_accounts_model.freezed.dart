// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_accounts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAccountsModel _$UserAccountsModelFromJson(Map<String, dynamic> json) {
  return _UserAccountsModel.fromJson(json);
}

/// @nodoc
mixin _$UserAccountsModel {
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get firebaseId => throw _privateConstructorUsedError;
  String? get pp => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this UserAccountsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAccountsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountsModelCopyWith<UserAccountsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountsModelCopyWith<$Res> {
  factory $UserAccountsModelCopyWith(
          UserAccountsModel value, $Res Function(UserAccountsModel) then) =
      _$UserAccountsModelCopyWithImpl<$Res, UserAccountsModel>;
  @useResult
  $Res call(
      {String? name,
      String? id,
      String? firebaseId,
      String? pp,
      String? token});
}

/// @nodoc
class _$UserAccountsModelCopyWithImpl<$Res, $Val extends UserAccountsModel>
    implements $UserAccountsModelCopyWith<$Res> {
  _$UserAccountsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccountsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? firebaseId = freezed,
    Object? pp = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseId: freezed == firebaseId
          ? _value.firebaseId
          : firebaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      pp: freezed == pp
          ? _value.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAccountsModelImplCopyWith<$Res>
    implements $UserAccountsModelCopyWith<$Res> {
  factory _$$UserAccountsModelImplCopyWith(_$UserAccountsModelImpl value,
          $Res Function(_$UserAccountsModelImpl) then) =
      __$$UserAccountsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? id,
      String? firebaseId,
      String? pp,
      String? token});
}

/// @nodoc
class __$$UserAccountsModelImplCopyWithImpl<$Res>
    extends _$UserAccountsModelCopyWithImpl<$Res, _$UserAccountsModelImpl>
    implements _$$UserAccountsModelImplCopyWith<$Res> {
  __$$UserAccountsModelImplCopyWithImpl(_$UserAccountsModelImpl _value,
      $Res Function(_$UserAccountsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccountsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? firebaseId = freezed,
    Object? pp = freezed,
    Object? token = freezed,
  }) {
    return _then(_$UserAccountsModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseId: freezed == firebaseId
          ? _value.firebaseId
          : firebaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      pp: freezed == pp
          ? _value.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccountsModelImpl implements _UserAccountsModel {
  const _$UserAccountsModelImpl(
      {this.name, this.id, this.firebaseId, this.pp, this.token});

  factory _$UserAccountsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccountsModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? id;
  @override
  final String? firebaseId;
  @override
  final String? pp;
  @override
  final String? token;

  @override
  String toString() {
    return 'UserAccountsModel(name: $name, id: $id, firebaseId: $firebaseId, pp: $pp, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountsModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firebaseId, firebaseId) ||
                other.firebaseId == firebaseId) &&
            (identical(other.pp, pp) || other.pp == pp) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, firebaseId, pp, token);

  /// Create a copy of UserAccountsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccountsModelImplCopyWith<_$UserAccountsModelImpl> get copyWith =>
      __$$UserAccountsModelImplCopyWithImpl<_$UserAccountsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccountsModelImplToJson(
      this,
    );
  }
}

abstract class _UserAccountsModel implements UserAccountsModel {
  const factory _UserAccountsModel(
      {final String? name,
      final String? id,
      final String? firebaseId,
      final String? pp,
      final String? token}) = _$UserAccountsModelImpl;

  factory _UserAccountsModel.fromJson(Map<String, dynamic> json) =
      _$UserAccountsModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get id;
  @override
  String? get firebaseId;
  @override
  String? get pp;
  @override
  String? get token;

  /// Create a copy of UserAccountsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAccountsModelImplCopyWith<_$UserAccountsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
