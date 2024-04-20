import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_comment_model.freezed.dart';
part 'event_comment_model.g.dart';

@freezed
class EventCommentModel with _$EventCommentModel {
  const factory EventCommentModel({
    String? id,
    String? commentId,
    String? replyId,
    String? vendorId,
    String? name,
    String? userId,
    String? userName,
    String? imageUrl,
    String? comment,
    int? likeCount,
    int? replyCount,
    bool? likeStatus,
    bool? isCurrentUser,
    bool? isEventOwner,
    bool? isDeleted,
    bool? isMark,
    String? date,
    List<EventCommentModel>? replies,
  }) = _EventCommentModel;

  factory EventCommentModel.fromJson(Map<String, Object?> json) =>
      _$EventCommentModelFromJson(json);
}
