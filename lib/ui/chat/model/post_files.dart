import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_files.freezed.dart';
part 'post_files.g.dart';

@freezed
class PostFiles with _$PostFiles {
  const factory PostFiles({
    String? fileId,
    String? filePath,
  }) = _PostFiles;

  factory PostFiles.fromJson(Map<String, Object?> json) =>
      _$PostFilesFromJson(json);
}
