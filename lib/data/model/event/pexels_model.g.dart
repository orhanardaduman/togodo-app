// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pexels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PexelsModelImpl _$$PexelsModelImplFromJson(Map<String, dynamic> json) =>
    _$PexelsModelImpl(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photos.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
      nextPage: json['nextPage'] as String?,
    );

Map<String, dynamic> _$$PexelsModelImplToJson(_$PexelsModelImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'photos': instance.photos,
      'totalResults': instance.totalResults,
      'nextPage': instance.nextPage,
    };

_$PhotosImpl _$$PhotosImplFromJson(Map<String, dynamic> json) => _$PhotosImpl(
      id: (json['id'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      url: json['url'] as String?,
      photographer: json['photographer'] as String?,
      photographerUrl: json['photographerUrl'] as String?,
      photographerId: (json['photographerId'] as num?)?.toInt(),
      avgColor: json['avgColor'] as String?,
      src: json['src'] == null
          ? null
          : Src.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool?,
      alt: json['alt'] as String?,
    );

Map<String, dynamic> _$$PhotosImplToJson(_$PhotosImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographerUrl': instance.photographerUrl,
      'photographerId': instance.photographerId,
      'avgColor': instance.avgColor,
      'src': instance.src,
      'liked': instance.liked,
      'alt': instance.alt,
    };

_$SrcImpl _$$SrcImplFromJson(Map<String, dynamic> json) => _$SrcImpl(
      original: json['original'] as String?,
      large2x: json['large2x'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
      portrait: json['portrait'] as String?,
      landscape: json['landscape'] as String?,
      tiny: json['tiny'] as String?,
    );

Map<String, dynamic> _$$SrcImplToJson(_$SrcImpl instance) => <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2x,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };
