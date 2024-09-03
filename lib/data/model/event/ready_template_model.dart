import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togodo/data/model/profil/profil_model.dart';

part 'ready_template_model.freezed.dart';
part 'ready_template_model.g.dart';

@freezed
class ReadyTemplateModel with _$ReadyTemplateModel {
  const factory ReadyTemplateModel({
    String? id,
    String? title,
    int? sortTag,
    String? description,
    List<TagsModel>? tags,
    List<Images>? images,
  }) = _ReadyTemplateModel;

  factory ReadyTemplateModel.fromJson(Map<String, Object?> json) =>
      _$ReadyTemplateModelFromJson(json);
}
