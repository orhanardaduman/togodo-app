import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_accounts_model.freezed.dart';
part 'user_accounts_model.g.dart';

@freezed
class UserAccountsModel with _$UserAccountsModel {
  const factory UserAccountsModel({
    String? name,
    String? id,
    String? firebaseId,
    String? pp,
    String? token,
  }) = _UserAccountsModel;

  factory UserAccountsModel.fromJson(Map<String, Object?> json) =>
      _$UserAccountsModelFromJson(json);
}
