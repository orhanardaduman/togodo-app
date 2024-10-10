// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return _TokenModel.fromJson(json);
}

/// @nodoc
mixin _$TokenModel {
  Token? get token => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this TokenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenModelCopyWith<TokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenModelCopyWith<$Res> {
  factory $TokenModelCopyWith(
          TokenModel value, $Res Function(TokenModel) then) =
      _$TokenModelCopyWithImpl<$Res, TokenModel>;
  @useResult
  $Res call(
      {Token? token, String? profileImageUrl, String? userId, String? name});

  $TokenCopyWith<$Res>? get token;
}

/// @nodoc
class _$TokenModelCopyWithImpl<$Res, $Val extends TokenModel>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? profileImageUrl = freezed,
    Object? userId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TokenModelImplCopyWith<$Res>
    implements $TokenModelCopyWith<$Res> {
  factory _$$TokenModelImplCopyWith(
          _$TokenModelImpl value, $Res Function(_$TokenModelImpl) then) =
      __$$TokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Token? token, String? profileImageUrl, String? userId, String? name});

  @override
  $TokenCopyWith<$Res>? get token;
}

/// @nodoc
class __$$TokenModelImplCopyWithImpl<$Res>
    extends _$TokenModelCopyWithImpl<$Res, _$TokenModelImpl>
    implements _$$TokenModelImplCopyWith<$Res> {
  __$$TokenModelImplCopyWithImpl(
      _$TokenModelImpl _value, $Res Function(_$TokenModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? profileImageUrl = freezed,
    Object? userId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$TokenModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenModelImpl implements _TokenModel {
  const _$TokenModelImpl(
      {this.token, this.profileImageUrl, this.userId, this.name});

  factory _$TokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenModelImplFromJson(json);

  @override
  final Token? token;
  @override
  final String? profileImageUrl;
  @override
  final String? userId;
  @override
  final String? name;

  @override
  String toString() {
    return 'TokenModel(token: $token, profileImageUrl: $profileImageUrl, userId: $userId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, profileImageUrl, userId, name);

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenModelImplCopyWith<_$TokenModelImpl> get copyWith =>
      __$$TokenModelImplCopyWithImpl<_$TokenModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenModelImplToJson(
      this,
    );
  }
}

abstract class _TokenModel implements TokenModel {
  const factory _TokenModel(
      {final Token? token,
      final String? profileImageUrl,
      final String? userId,
      final String? name}) = _$TokenModelImpl;

  factory _TokenModel.fromJson(Map<String, dynamic> json) =
      _$TokenModelImpl.fromJson;

  @override
  Token? get token;
  @override
  String? get profileImageUrl;
  @override
  String? get userId;
  @override
  String? get name;

  /// Create a copy of TokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenModelImplCopyWith<_$TokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String? get accessToken => throw _privateConstructorUsedError;
  String? get birthdayDate => throw _privateConstructorUsedError;
  String? get firebaseUid => throw _privateConstructorUsedError;
  int? get notReadingCount => throw _privateConstructorUsedError;
  int? get completionRate => throw _privateConstructorUsedError;
  bool? get titleCompletion => throw _privateConstructorUsedError;
  String? get eMail => throw _privateConstructorUsedError;
  int? get userType => throw _privateConstructorUsedError;
  bool? get socialMediaCompletion => throw _privateConstructorUsedError;
  bool? get tagCompletion => throw _privateConstructorUsedError;
  bool? get bioCompletion => throw _privateConstructorUsedError;
  String? get expiration => throw _privateConstructorUsedError;

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call(
      {String? accessToken,
      String? birthdayDate,
      String? firebaseUid,
      int? notReadingCount,
      int? completionRate,
      bool? titleCompletion,
      String? eMail,
      int? userType,
      bool? socialMediaCompletion,
      bool? tagCompletion,
      bool? bioCompletion,
      String? expiration});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? birthdayDate = freezed,
    Object? firebaseUid = freezed,
    Object? notReadingCount = freezed,
    Object? completionRate = freezed,
    Object? titleCompletion = freezed,
    Object? eMail = freezed,
    Object? userType = freezed,
    Object? socialMediaCompletion = freezed,
    Object? tagCompletion = freezed,
    Object? bioCompletion = freezed,
    Object? expiration = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdayDate: freezed == birthdayDate
          ? _value.birthdayDate
          : birthdayDate // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseUid: freezed == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String?,
      notReadingCount: freezed == notReadingCount
          ? _value.notReadingCount
          : notReadingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      completionRate: freezed == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      titleCompletion: freezed == titleCompletion
          ? _value.titleCompletion
          : titleCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      eMail: freezed == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      socialMediaCompletion: freezed == socialMediaCompletion
          ? _value.socialMediaCompletion
          : socialMediaCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      tagCompletion: freezed == tagCompletion
          ? _value.tagCompletion
          : tagCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      bioCompletion: freezed == bioCompletion
          ? _value.bioCompletion
          : bioCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiration: freezed == expiration
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$TokenImplCopyWith(
          _$TokenImpl value, $Res Function(_$TokenImpl) then) =
      __$$TokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? accessToken,
      String? birthdayDate,
      String? firebaseUid,
      int? notReadingCount,
      int? completionRate,
      bool? titleCompletion,
      String? eMail,
      int? userType,
      bool? socialMediaCompletion,
      bool? tagCompletion,
      bool? bioCompletion,
      String? expiration});
}

/// @nodoc
class __$$TokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenImpl>
    implements _$$TokenImplCopyWith<$Res> {
  __$$TokenImplCopyWithImpl(
      _$TokenImpl _value, $Res Function(_$TokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? birthdayDate = freezed,
    Object? firebaseUid = freezed,
    Object? notReadingCount = freezed,
    Object? completionRate = freezed,
    Object? titleCompletion = freezed,
    Object? eMail = freezed,
    Object? userType = freezed,
    Object? socialMediaCompletion = freezed,
    Object? tagCompletion = freezed,
    Object? bioCompletion = freezed,
    Object? expiration = freezed,
  }) {
    return _then(_$TokenImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdayDate: freezed == birthdayDate
          ? _value.birthdayDate
          : birthdayDate // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseUid: freezed == firebaseUid
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String?,
      notReadingCount: freezed == notReadingCount
          ? _value.notReadingCount
          : notReadingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      completionRate: freezed == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      titleCompletion: freezed == titleCompletion
          ? _value.titleCompletion
          : titleCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      eMail: freezed == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      socialMediaCompletion: freezed == socialMediaCompletion
          ? _value.socialMediaCompletion
          : socialMediaCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      tagCompletion: freezed == tagCompletion
          ? _value.tagCompletion
          : tagCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      bioCompletion: freezed == bioCompletion
          ? _value.bioCompletion
          : bioCompletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiration: freezed == expiration
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenImpl implements _Token {
  const _$TokenImpl(
      {this.accessToken,
      this.birthdayDate,
      this.firebaseUid,
      this.notReadingCount,
      this.completionRate,
      this.titleCompletion,
      this.eMail,
      this.userType,
      this.socialMediaCompletion,
      this.tagCompletion,
      this.bioCompletion,
      this.expiration});

  factory _$TokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenImplFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? birthdayDate;
  @override
  final String? firebaseUid;
  @override
  final int? notReadingCount;
  @override
  final int? completionRate;
  @override
  final bool? titleCompletion;
  @override
  final String? eMail;
  @override
  final int? userType;
  @override
  final bool? socialMediaCompletion;
  @override
  final bool? tagCompletion;
  @override
  final bool? bioCompletion;
  @override
  final String? expiration;

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, birthdayDate: $birthdayDate, firebaseUid: $firebaseUid, notReadingCount: $notReadingCount, completionRate: $completionRate, titleCompletion: $titleCompletion, eMail: $eMail, userType: $userType, socialMediaCompletion: $socialMediaCompletion, tagCompletion: $tagCompletion, bioCompletion: $bioCompletion, expiration: $expiration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.birthdayDate, birthdayDate) ||
                other.birthdayDate == birthdayDate) &&
            (identical(other.firebaseUid, firebaseUid) ||
                other.firebaseUid == firebaseUid) &&
            (identical(other.notReadingCount, notReadingCount) ||
                other.notReadingCount == notReadingCount) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.titleCompletion, titleCompletion) ||
                other.titleCompletion == titleCompletion) &&
            (identical(other.eMail, eMail) || other.eMail == eMail) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.socialMediaCompletion, socialMediaCompletion) ||
                other.socialMediaCompletion == socialMediaCompletion) &&
            (identical(other.tagCompletion, tagCompletion) ||
                other.tagCompletion == tagCompletion) &&
            (identical(other.bioCompletion, bioCompletion) ||
                other.bioCompletion == bioCompletion) &&
            (identical(other.expiration, expiration) ||
                other.expiration == expiration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      birthdayDate,
      firebaseUid,
      notReadingCount,
      completionRate,
      titleCompletion,
      eMail,
      userType,
      socialMediaCompletion,
      tagCompletion,
      bioCompletion,
      expiration);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      __$$TokenImplCopyWithImpl<_$TokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenImplToJson(
      this,
    );
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {final String? accessToken,
      final String? birthdayDate,
      final String? firebaseUid,
      final int? notReadingCount,
      final int? completionRate,
      final bool? titleCompletion,
      final String? eMail,
      final int? userType,
      final bool? socialMediaCompletion,
      final bool? tagCompletion,
      final bool? bioCompletion,
      final String? expiration}) = _$TokenImpl;

  factory _Token.fromJson(Map<String, dynamic> json) = _$TokenImpl.fromJson;

  @override
  String? get accessToken;
  @override
  String? get birthdayDate;
  @override
  String? get firebaseUid;
  @override
  int? get notReadingCount;
  @override
  int? get completionRate;
  @override
  bool? get titleCompletion;
  @override
  String? get eMail;
  @override
  int? get userType;
  @override
  bool? get socialMediaCompletion;
  @override
  bool? get tagCompletion;
  @override
  bool? get bioCompletion;
  @override
  String? get expiration;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
