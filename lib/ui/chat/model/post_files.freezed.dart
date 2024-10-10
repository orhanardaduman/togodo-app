// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_files.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostFiles _$PostFilesFromJson(Map<String, dynamic> json) {
  return _PostFiles.fromJson(json);
}

/// @nodoc
mixin _$PostFiles {
  String? get fileId => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;

  /// Serializes this PostFiles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostFiles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostFilesCopyWith<PostFiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFilesCopyWith<$Res> {
  factory $PostFilesCopyWith(PostFiles value, $Res Function(PostFiles) then) =
      _$PostFilesCopyWithImpl<$Res, PostFiles>;
  @useResult
  $Res call({String? fileId, String? filePath});
}

/// @nodoc
class _$PostFilesCopyWithImpl<$Res, $Val extends PostFiles>
    implements $PostFilesCopyWith<$Res> {
  _$PostFilesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostFiles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = freezed,
    Object? filePath = freezed,
  }) {
    return _then(_value.copyWith(
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostFilesImplCopyWith<$Res>
    implements $PostFilesCopyWith<$Res> {
  factory _$$PostFilesImplCopyWith(
          _$PostFilesImpl value, $Res Function(_$PostFilesImpl) then) =
      __$$PostFilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fileId, String? filePath});
}

/// @nodoc
class __$$PostFilesImplCopyWithImpl<$Res>
    extends _$PostFilesCopyWithImpl<$Res, _$PostFilesImpl>
    implements _$$PostFilesImplCopyWith<$Res> {
  __$$PostFilesImplCopyWithImpl(
      _$PostFilesImpl _value, $Res Function(_$PostFilesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostFiles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = freezed,
    Object? filePath = freezed,
  }) {
    return _then(_$PostFilesImpl(
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostFilesImpl implements _PostFiles {
  const _$PostFilesImpl({this.fileId, this.filePath});

  factory _$PostFilesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostFilesImplFromJson(json);

  @override
  final String? fileId;
  @override
  final String? filePath;

  @override
  String toString() {
    return 'PostFiles(fileId: $fileId, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFilesImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileId, filePath);

  /// Create a copy of PostFiles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFilesImplCopyWith<_$PostFilesImpl> get copyWith =>
      __$$PostFilesImplCopyWithImpl<_$PostFilesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostFilesImplToJson(
      this,
    );
  }
}

abstract class _PostFiles implements PostFiles {
  const factory _PostFiles({final String? fileId, final String? filePath}) =
      _$PostFilesImpl;

  factory _PostFiles.fromJson(Map<String, dynamic> json) =
      _$PostFilesImpl.fromJson;

  @override
  String? get fileId;
  @override
  String? get filePath;

  /// Create a copy of PostFiles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostFilesImplCopyWith<_$PostFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
