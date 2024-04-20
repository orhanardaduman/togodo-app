// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscoveryModelImpl _$$DiscoveryModelImplFromJson(Map<String, dynamic> json) =>
    _$DiscoveryModelImpl(
      popular: (json['popular'] as List<dynamic>?)
          ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      near: (json['near'] as List<dynamic>?)
          ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      soon: (json['soon'] as List<dynamic>?)
          ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DiscoveryModelImplToJson(
        _$DiscoveryModelImpl instance) =>
    <String, dynamic>{
      'popular': instance.popular,
      'near': instance.near,
      'soon': instance.soon,
    };
