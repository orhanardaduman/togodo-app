// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ready_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadyTemplateModel _$ReadyTemplateModelFromJson(Map<String, dynamic> json) {
  return _ReadyTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$ReadyTemplateModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<TagsModel>? get tags => throw _privateConstructorUsedError;
  List<Images>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadyTemplateModelCopyWith<ReadyTemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyTemplateModelCopyWith<$Res> {
  factory $ReadyTemplateModelCopyWith(
          ReadyTemplateModel value, $Res Function(ReadyTemplateModel) then) =
      _$ReadyTemplateModelCopyWithImpl<$Res, ReadyTemplateModel>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      List<TagsModel>? tags,
      List<Images>? images});
}

/// @nodoc
class _$ReadyTemplateModelCopyWithImpl<$Res, $Val extends ReadyTemplateModel>
    implements $ReadyTemplateModelCopyWith<$Res> {
  _$ReadyTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadyTemplateModelImplCopyWith<$Res>
    implements $ReadyTemplateModelCopyWith<$Res> {
  factory _$$ReadyTemplateModelImplCopyWith(_$ReadyTemplateModelImpl value,
          $Res Function(_$ReadyTemplateModelImpl) then) =
      __$$ReadyTemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      List<TagsModel>? tags,
      List<Images>? images});
}

/// @nodoc
class __$$ReadyTemplateModelImplCopyWithImpl<$Res>
    extends _$ReadyTemplateModelCopyWithImpl<$Res, _$ReadyTemplateModelImpl>
    implements _$$ReadyTemplateModelImplCopyWith<$Res> {
  __$$ReadyTemplateModelImplCopyWithImpl(_$ReadyTemplateModelImpl _value,
      $Res Function(_$ReadyTemplateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? images = freezed,
  }) {
    return _then(_$ReadyTemplateModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadyTemplateModelImpl implements _ReadyTemplateModel {
  const _$ReadyTemplateModelImpl(
      {this.id,
      this.title,
      this.description,
      final List<TagsModel>? tags,
      final List<Images>? images})
      : _tags = tags,
        _images = images;

  factory _$ReadyTemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadyTemplateModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  final List<TagsModel>? _tags;
  @override
  List<TagsModel>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Images>? _images;
  @override
  List<Images>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReadyTemplateModel(id: $id, title: $title, description: $description, tags: $tags, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadyTemplateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadyTemplateModelImplCopyWith<_$ReadyTemplateModelImpl> get copyWith =>
      __$$ReadyTemplateModelImplCopyWithImpl<_$ReadyTemplateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadyTemplateModelImplToJson(
      this,
    );
  }
}

abstract class _ReadyTemplateModel implements ReadyTemplateModel {
  const factory _ReadyTemplateModel(
      {final String? id,
      final String? title,
      final String? description,
      final List<TagsModel>? tags,
      final List<Images>? images}) = _$ReadyTemplateModelImpl;

  factory _ReadyTemplateModel.fromJson(Map<String, dynamic> json) =
      _$ReadyTemplateModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  List<TagsModel>? get tags;
  @override
  List<Images>? get images;
  @override
  @JsonKey(ignore: true)
  _$$ReadyTemplateModelImplCopyWith<_$ReadyTemplateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
