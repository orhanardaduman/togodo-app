import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/ui/comment/widget/comment_container.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';

class EventCommentList extends HookConsumerWidget {
  const EventCommentList({
    required this.eventId,
    required this.commentReply,
    super.key,
    this.isEventOwner = false,
    this.eventComment,
  });
  final String eventId;
  final List<EventCommentModel>? eventComment;
  final bool isEventOwner;
  final void Function() commentReply;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(eventDetailsViewModelProvider(eventId).notifier);
    return CommentContainer(
      datas: eventComment!,
      eventId: eventId,
      isEventOwner: isEventOwner,
      onLike: ({required int index}) {
        notifier.toggleCommentLike(
          eventComment![index].id!,
        );
      },
      delete: (index) {
        notifier.eventCommentRemove(
          eventComment![index].id!,
        );
      },
      commentMark: (index) {
        if (eventComment![index].isMark!) {
          notifier.commentUnMark(
            eventComment![index].id!,
          );
        } else {
          notifier.commentMark(
            eventComment![index].id!,
          );
        }
      },
      commentReply: (index) {
        notifier.incrementIsReplyComment(false);
        notifier.focusNode.requestFocus();
        notifier.incrementReplyModel(eventComment![index]);
        commentReply.call();
      },
      replyOnLike: ({
        required String index,
        required String replyId,
      }) {
        notifier.replyLike(
          replyId,
          index,
        );
      },
      replyDelete: (commentIndex, replyId) {
        notifier.eventReplyIdRemove(
          replyId,
        );
      },
      replyReply: (commentIndex, index) {
        notifier.focusNode.requestFocus();
        notifier.incrementIsReplyComment(true);
        final data = eventComment!.firstWhere(
          (element) => element.id == commentIndex,
        );
        notifier.incrementReplyModel(
          data.replies!.firstWhere((element) => element.id == index),
        );
        commentReply.call();
      },
    );
  }
}
