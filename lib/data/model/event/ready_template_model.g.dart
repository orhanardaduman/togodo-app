// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ready_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReadyTemplateModelImpl _$$ReadyTemplateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadyTemplateModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReadyTemplateModelImplToJson(
        _$ReadyTemplateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'images': instance.images,
    };
