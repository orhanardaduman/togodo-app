import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_login_model.freezed.dart';
part 'firebase_login_model.g.dart';

@freezed
class FirebaseLoginModel with _$FirebaseLoginModel {
  const factory FirebaseLoginModel({
    String? idToken,
    String? deviceId,
    String? location,
    String? name,
    String? email,
    String? surname,
    String? phoneNumber,
    String? imagePath,
  }) = _FirebaseLoginModel;

  factory FirebaseLoginModel.fromJson(Map<String, Object?> json) =>
      _$FirebaseLoginModelFromJson(json);
}
