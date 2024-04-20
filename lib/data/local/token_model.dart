import 'package:freezed_annotation/freezed_annotation.dart';
part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    Token? token,
    String? profileImageUrl,
    String? userId,
    String? name,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, Object?> json) =>
      _$TokenModelFromJson(json);
}

@freezed
class Token with _$Token {
  const factory Token({
    String? accessToken,
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
    String? expiration,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);
}
