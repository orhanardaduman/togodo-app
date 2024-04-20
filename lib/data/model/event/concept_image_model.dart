import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept_image_model.freezed.dart';
part 'concept_image_model.g.dart';

@freezed
class ConceptImageModel with _$ConceptImageModel {
  const factory ConceptImageModel({
    int? number,
    String? downloadUrl,
    bool? isSelected,
    bool? isClick,
  }) = _ConceptImageModel;

  factory ConceptImageModel.fromJson(Map<String, dynamic> json) =>
      _$ConceptImageModelFromJson(json);
}
