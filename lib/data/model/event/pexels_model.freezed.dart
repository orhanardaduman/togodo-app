// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pexels_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PexelsModel _$PexelsModelFromJson(Map<String, dynamic> json) {
  return _PexelsModel.fromJson(json);
}

/// @nodoc
mixin _$PexelsModel {
  int? get page => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  List<Photos>? get photos => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PexelsModelCopyWith<PexelsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PexelsModelCopyWith<$Res> {
  factory $PexelsModelCopyWith(
          PexelsModel value, $Res Function(PexelsModel) then) =
      _$PexelsModelCopyWithImpl<$Res, PexelsModel>;
  @useResult
  $Res call(
      {int? page,
      int? perPage,
      List<Photos>? photos,
      int? totalResults,
      String? nextPage});
}

/// @nodoc
class _$PexelsModelCopyWithImpl<$Res, $Val extends PexelsModel>
    implements $PexelsModelCopyWith<$Res> {
  _$PexelsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? photos = freezed,
    Object? totalResults = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photos>?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PexelsModelImplCopyWith<$Res>
    implements $PexelsModelCopyWith<$Res> {
  factory _$$PexelsModelImplCopyWith(
          _$PexelsModelImpl value, $Res Function(_$PexelsModelImpl) then) =
      __$$PexelsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      int? perPage,
      List<Photos>? photos,
      int? totalResults,
      String? nextPage});
}

/// @nodoc
class __$$PexelsModelImplCopyWithImpl<$Res>
    extends _$PexelsModelCopyWithImpl<$Res, _$PexelsModelImpl>
    implements _$$PexelsModelImplCopyWith<$Res> {
  __$$PexelsModelImplCopyWithImpl(
      _$PexelsModelImpl _value, $Res Function(_$PexelsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? photos = freezed,
    Object? totalResults = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$PexelsModelImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photos>?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PexelsModelImpl with DiagnosticableTreeMixin implements _PexelsModel {
  const _$PexelsModelImpl(
      {this.page,
      this.perPage,
      final List<Photos>? photos,
      this.totalResults,
      this.nextPage})
      : _photos = photos;

  factory _$PexelsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PexelsModelImplFromJson(json);

  @override
  final int? page;
  @override
  final int? perPage;
  final List<Photos>? _photos;
  @override
  List<Photos>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalResults;
  @override
  final String? nextPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PexelsModel(page: $page, perPage: $perPage, photos: $photos, totalResults: $totalResults, nextPage: $nextPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PexelsModel'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('perPage', perPage))
      ..add(DiagnosticsProperty('photos', photos))
      ..add(DiagnosticsProperty('totalResults', totalResults))
      ..add(DiagnosticsProperty('nextPage', nextPage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PexelsModelImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage,
      const DeepCollectionEquality().hash(_photos), totalResults, nextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PexelsModelImplCopyWith<_$PexelsModelImpl> get copyWith =>
      __$$PexelsModelImplCopyWithImpl<_$PexelsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PexelsModelImplToJson(
      this,
    );
  }
}

abstract class _PexelsModel implements PexelsModel {
  const factory _PexelsModel(
      {final int? page,
      final int? perPage,
      final List<Photos>? photos,
      final int? totalResults,
      final String? nextPage}) = _$PexelsModelImpl;

  factory _PexelsModel.fromJson(Map<String, dynamic> json) =
      _$PexelsModelImpl.fromJson;

  @override
  int? get page;
  @override
  int? get perPage;
  @override
  List<Photos>? get photos;
  @override
  int? get totalResults;
  @override
  String? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$PexelsModelImplCopyWith<_$PexelsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Photos _$PhotosFromJson(Map<String, dynamic> json) {
  return _Photos.fromJson(json);
}

/// @nodoc
mixin _$Photos {
  int? get id => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get photographer => throw _privateConstructorUsedError;
  String? get photographerUrl => throw _privateConstructorUsedError;
  int? get photographerId => throw _privateConstructorUsedError;
  String? get avgColor => throw _privateConstructorUsedError;
  Src? get src => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  String? get alt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotosCopyWith<Photos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosCopyWith<$Res> {
  factory $PhotosCopyWith(Photos value, $Res Function(Photos) then) =
      _$PhotosCopyWithImpl<$Res, Photos>;
  @useResult
  $Res call(
      {int? id,
      int? width,
      int? height,
      String? url,
      String? photographer,
      String? photographerUrl,
      int? photographerId,
      String? avgColor,
      Src? src,
      bool? liked,
      String? alt});

  $SrcCopyWith<$Res>? get src;
}

/// @nodoc
class _$PhotosCopyWithImpl<$Res, $Val extends Photos>
    implements $PhotosCopyWith<$Res> {
  _$PhotosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
    Object? photographer = freezed,
    Object? photographerUrl = freezed,
    Object? photographerId = freezed,
    Object? avgColor = freezed,
    Object? src = freezed,
    Object? liked = freezed,
    Object? alt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      photographer: freezed == photographer
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerUrl: freezed == photographerUrl
          ? _value.photographerUrl
          : photographerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerId: freezed == photographerId
          ? _value.photographerId
          : photographerId // ignore: cast_nullable_to_non_nullable
              as int?,
      avgColor: freezed == avgColor
          ? _value.avgColor
          : avgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      src: freezed == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as Src?,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      alt: freezed == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SrcCopyWith<$Res>? get src {
    if (_value.src == null) {
      return null;
    }

    return $SrcCopyWith<$Res>(_value.src!, (value) {
      return _then(_value.copyWith(src: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotosImplCopyWith<$Res> implements $PhotosCopyWith<$Res> {
  factory _$$PhotosImplCopyWith(
          _$PhotosImpl value, $Res Function(_$PhotosImpl) then) =
      __$$PhotosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? width,
      int? height,
      String? url,
      String? photographer,
      String? photographerUrl,
      int? photographerId,
      String? avgColor,
      Src? src,
      bool? liked,
      String? alt});

  @override
  $SrcCopyWith<$Res>? get src;
}

/// @nodoc
class __$$PhotosImplCopyWithImpl<$Res>
    extends _$PhotosCopyWithImpl<$Res, _$PhotosImpl>
    implements _$$PhotosImplCopyWith<$Res> {
  __$$PhotosImplCopyWithImpl(
      _$PhotosImpl _value, $Res Function(_$PhotosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
    Object? photographer = freezed,
    Object? photographerUrl = freezed,
    Object? photographerId = freezed,
    Object? avgColor = freezed,
    Object? src = freezed,
    Object? liked = freezed,
    Object? alt = freezed,
  }) {
    return _then(_$PhotosImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      photographer: freezed == photographer
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerUrl: freezed == photographerUrl
          ? _value.photographerUrl
          : photographerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerId: freezed == photographerId
          ? _value.photographerId
          : photographerId // ignore: cast_nullable_to_non_nullable
              as int?,
      avgColor: freezed == avgColor
          ? _value.avgColor
          : avgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      src: freezed == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as Src?,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      alt: freezed == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotosImpl extends _Photos with DiagnosticableTreeMixin {
  const _$PhotosImpl(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.avgColor,
      this.src,
      this.liked,
      this.alt})
      : super._();

  factory _$PhotosImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotosImplFromJson(json);

  @override
  final int? id;
  @override
  final int? width;
  @override
  final int? height;
  @override
  final String? url;
  @override
  final String? photographer;
  @override
  final String? photographerUrl;
  @override
  final int? photographerId;
  @override
  final String? avgColor;
  @override
  final Src? src;
  @override
  final bool? liked;
  @override
  final String? alt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Photos(id: $id, width: $width, height: $height, url: $url, photographer: $photographer, photographerUrl: $photographerUrl, photographerId: $photographerId, avgColor: $avgColor, src: $src, liked: $liked, alt: $alt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Photos'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('photographer', photographer))
      ..add(DiagnosticsProperty('photographerUrl', photographerUrl))
      ..add(DiagnosticsProperty('photographerId', photographerId))
      ..add(DiagnosticsProperty('avgColor', avgColor))
      ..add(DiagnosticsProperty('src', src))
      ..add(DiagnosticsProperty('liked', liked))
      ..add(DiagnosticsProperty('alt', alt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.photographer, photographer) ||
                other.photographer == photographer) &&
            (identical(other.photographerUrl, photographerUrl) ||
                other.photographerUrl == photographerUrl) &&
            (identical(other.photographerId, photographerId) ||
                other.photographerId == photographerId) &&
            (identical(other.avgColor, avgColor) ||
                other.avgColor == avgColor) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.alt, alt) || other.alt == alt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, width, height, url,
      photographer, photographerUrl, photographerId, avgColor, src, liked, alt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosImplCopyWith<_$PhotosImpl> get copyWith =>
      __$$PhotosImplCopyWithImpl<_$PhotosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotosImplToJson(
      this,
    );
  }
}

abstract class _Photos extends Photos {
  const factory _Photos(
      {final int? id,
      final int? width,
      final int? height,
      final String? url,
      final String? photographer,
      final String? photographerUrl,
      final int? photographerId,
      final String? avgColor,
      final Src? src,
      final bool? liked,
      final String? alt}) = _$PhotosImpl;
  const _Photos._() : super._();

  factory _Photos.fromJson(Map<String, dynamic> json) = _$PhotosImpl.fromJson;

  @override
  int? get id;
  @override
  int? get width;
  @override
  int? get height;
  @override
  String? get url;
  @override
  String? get photographer;
  @override
  String? get photographerUrl;
  @override
  int? get photographerId;
  @override
  String? get avgColor;
  @override
  Src? get src;
  @override
  bool? get liked;
  @override
  String? get alt;
  @override
  @JsonKey(ignore: true)
  _$$PhotosImplCopyWith<_$PhotosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Src _$SrcFromJson(Map<String, dynamic> json) {
  return _Src.fromJson(json);
}

/// @nodoc
mixin _$Src {
  String? get original => throw _privateConstructorUsedError;
  String? get large2x => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get small => throw _privateConstructorUsedError;
  String? get portrait => throw _privateConstructorUsedError;
  String? get landscape => throw _privateConstructorUsedError;
  String? get tiny => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SrcCopyWith<Src> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrcCopyWith<$Res> {
  factory $SrcCopyWith(Src value, $Res Function(Src) then) =
      _$SrcCopyWithImpl<$Res, Src>;
  @useResult
  $Res call(
      {String? original,
      String? large2x,
      String? large,
      String? medium,
      String? small,
      String? portrait,
      String? landscape,
      String? tiny});
}

/// @nodoc
class _$SrcCopyWithImpl<$Res, $Val extends Src> implements $SrcCopyWith<$Res> {
  _$SrcCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = freezed,
    Object? large2x = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? small = freezed,
    Object? portrait = freezed,
    Object? landscape = freezed,
    Object? tiny = freezed,
  }) {
    return _then(_value.copyWith(
      original: freezed == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      large2x: freezed == large2x
          ? _value.large2x
          : large2x // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      portrait: freezed == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String?,
      landscape: freezed == landscape
          ? _value.landscape
          : landscape // ignore: cast_nullable_to_non_nullable
              as String?,
      tiny: freezed == tiny
          ? _value.tiny
          : tiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SrcImplCopyWith<$Res> implements $SrcCopyWith<$Res> {
  factory _$$SrcImplCopyWith(_$SrcImpl value, $Res Function(_$SrcImpl) then) =
      __$$SrcImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? original,
      String? large2x,
      String? large,
      String? medium,
      String? small,
      String? portrait,
      String? landscape,
      String? tiny});
}

/// @nodoc
class __$$SrcImplCopyWithImpl<$Res> extends _$SrcCopyWithImpl<$Res, _$SrcImpl>
    implements _$$SrcImplCopyWith<$Res> {
  __$$SrcImplCopyWithImpl(_$SrcImpl _value, $Res Function(_$SrcImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = freezed,
    Object? large2x = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? small = freezed,
    Object? portrait = freezed,
    Object? landscape = freezed,
    Object? tiny = freezed,
  }) {
    return _then(_$SrcImpl(
      original: freezed == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      large2x: freezed == large2x
          ? _value.large2x
          : large2x // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      portrait: freezed == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String?,
      landscape: freezed == landscape
          ? _value.landscape
          : landscape // ignore: cast_nullable_to_non_nullable
              as String?,
      tiny: freezed == tiny
          ? _value.tiny
          : tiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SrcImpl with DiagnosticableTreeMixin implements _Src {
  const _$SrcImpl(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  factory _$SrcImpl.fromJson(Map<String, dynamic> json) =>
      _$$SrcImplFromJson(json);

  @override
  final String? original;
  @override
  final String? large2x;
  @override
  final String? large;
  @override
  final String? medium;
  @override
  final String? small;
  @override
  final String? portrait;
  @override
  final String? landscape;
  @override
  final String? tiny;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Src(original: $original, large2x: $large2x, large: $large, medium: $medium, small: $small, portrait: $portrait, landscape: $landscape, tiny: $tiny)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Src'))
      ..add(DiagnosticsProperty('original', original))
      ..add(DiagnosticsProperty('large2x', large2x))
      ..add(DiagnosticsProperty('large', large))
      ..add(DiagnosticsProperty('medium', medium))
      ..add(DiagnosticsProperty('small', small))
      ..add(DiagnosticsProperty('portrait', portrait))
      ..add(DiagnosticsProperty('landscape', landscape))
      ..add(DiagnosticsProperty('tiny', tiny));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SrcImpl &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.large2x, large2x) || other.large2x == large2x) &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.portrait, portrait) ||
                other.portrait == portrait) &&
            (identical(other.landscape, landscape) ||
                other.landscape == landscape) &&
            (identical(other.tiny, tiny) || other.tiny == tiny));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, original, large2x, large, medium,
      small, portrait, landscape, tiny);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SrcImplCopyWith<_$SrcImpl> get copyWith =>
      __$$SrcImplCopyWithImpl<_$SrcImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SrcImplToJson(
      this,
    );
  }
}

abstract class _Src implements Src {
  const factory _Src(
      {final String? original,
      final String? large2x,
      final String? large,
      final String? medium,
      final String? small,
      final String? portrait,
      final String? landscape,
      final String? tiny}) = _$SrcImpl;

  factory _Src.fromJson(Map<String, dynamic> json) = _$SrcImpl.fromJson;

  @override
  String? get original;
  @override
  String? get large2x;
  @override
  String? get large;
  @override
  String? get medium;
  @override
  String? get small;
  @override
  String? get portrait;
  @override
  String? get landscape;
  @override
  String? get tiny;
  @override
  @JsonKey(ignore: true)
  _$$SrcImplCopyWith<_$SrcImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
