import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pexels_model.freezed.dart';
part 'pexels_model.g.dart';

@freezed
class PexelsModel with _$PexelsModel {
  const factory PexelsModel({
    int? page,
    int? perPage,
    List<Photos>? photos,
    int? totalResults,
    String? nextPage,
  }) = _PexelsModel;

  factory PexelsModel.fromJson(Map<String, Object?> json) =>
      _$PexelsModelFromJson(json);
}

@freezed
class Photos with _$Photos {
  const factory Photos({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    Src? src,
    bool? liked,
    String? alt,
  }) = _Photos;
  const Photos._();
  factory Photos.fromJson(Map<String, Object?> json) => _$PhotosFromJson(json);
  bool get isPortrait => height != null && width != null && height! > width!;
}

@freezed
class Src with _$Src {
  const factory Src({
    String? original,
    String? large2x,
    String? large,
    String? medium,
    String? small,
    String? portrait,
    String? landscape,
    String? tiny,
  }) = _Src;

  factory Src.fromJson(Map<String, Object?> json) => _$SrcFromJson(json);
}
