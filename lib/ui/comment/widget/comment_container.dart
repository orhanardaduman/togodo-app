import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/ui/comment/comment_items.dart';

class CommentContainer extends HookConsumerWidget {
  const CommentContainer({
    required this.datas,
    required this.eventId,
    required this.onLike,
    required this.delete,
    required this.commentMark,
    required this.commentReply,
    required this.replyOnLike,
    required this.replyDelete,
    required this.replyReply,
    this.isEventOwner = false,
    this.controller,
    this.padding,
    this.physics,
    super.key,
  });
  final List<EventCommentModel> datas;
  final String eventId;
  final void Function({required int index}) onLike;
  final void Function(int index) delete;
  final void Function(int index) commentReply;
  final void Function(int index) commentMark;
  final void Function({required String index, required String replyId})
      replyOnLike;
  final void Function(String commentId, String replyId) replyDelete;
  final void Function(String commentId, String replyId) replyReply;
  final ScrollPhysics? physics;
  final bool isEventOwner;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
        itemCount: datas.length,
        controller: controller,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: padding,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommentItems(
                model: datas[index],
                theme: theme,
                eventId: eventId,
                isEventOwner: isEventOwner,
                markPressed: (BuildContext? context) {
                  commentMark(index);
                },
                onLikeChanged: ({required bool isLiked}) {
                  onLike(index: index);
                },
                deleteOnPressed: (BuildContext? context) {
                  delete(index);
                },
                replyOnTap: () {
                  commentReply(index);
                },
              ),
              if (datas[index].replies != null)
                ListView.separated(
                  itemCount: datas[index].replies!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: context.dyWidth(64),
                    top: context.dyHeight(20),
                  ),
                  itemBuilder: (context, indexs) {
                    final data = datas[index].replies![indexs];
                    return CommentItems(
                      model: data,
                      theme: theme,
                      isEventOwner: isEventOwner,
                      eventId: eventId,
                      /* markPressed: (BuildContext? context) {
                        replyMark(datas[index].id!, data.id!);
                      }, */
                      deleteOnPressed: (BuildContext? context) {
                        replyDelete(datas[index].id!, data.id!);
                      },
                      onLikeChanged: ({required bool isLiked}) {
                        replyOnLike(index: datas[index].id!, replyId: data.id!);
                      },
                      replyOnTap: () {
                        replyReply(datas[index].id!, data.id!);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16);
                  },
                ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
