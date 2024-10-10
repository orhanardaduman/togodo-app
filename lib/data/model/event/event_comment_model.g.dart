// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCommentModelImpl _$$EventCommentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventCommentModelImpl(
      id: json['id'] as String?,
      commentId: json['commentId'] as String?,
      replyId: json['replyId'] as String?,
      vendorId: json['vendorId'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      comment: json['comment'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      replyCount: (json['replyCount'] as num?)?.toInt(),
      likeStatus: json['likeStatus'] as bool?,
      isCurrentUser: json['isCurrentUser'] as bool?,
      isEventOwner: json['isEventOwner'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      isMark: json['isMark'] as bool?,
      date: json['date'] as String?,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => EventCommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventCommentModelImplToJson(
        _$EventCommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commentId': instance.commentId,
      'replyId': instance.replyId,
      'vendorId': instance.vendorId,
      'name': instance.name,
      'userId': instance.userId,
      'userName': instance.userName,
      'imageUrl': instance.imageUrl,
      'comment': instance.comment,
      'likeCount': instance.likeCount,
      'replyCount': instance.replyCount,
      'likeStatus': instance.likeStatus,
      'isCurrentUser': instance.isCurrentUser,
      'isEventOwner': instance.isEventOwner,
      'isDeleted': instance.isDeleted,
      'isMark': instance.isMark,
      'date': instance.date,
      'replies': instance.replies,
    };
