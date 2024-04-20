// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'dart:io';

class MediaModel {
  MediaModel({this.index, this.url, this.width, this.height});
  final int? index;
  final File? url;
  final int? width;
  final int? height;

  MediaModel copyWith({
    int? index,
    File? url,
    int? width,
    int? height,
  }) {
    return MediaModel(
      index: index ?? this.index,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MediaModel && other.index == index;
  }

  @override
  int get hashCode => index.hashCode;
}
