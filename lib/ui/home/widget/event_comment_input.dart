import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/comment_send_input.dart';
import 'package:togodo/ui/comment/widget/reply_info.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';

class EventCommentInput extends StatelessWidget {
  const EventCommentInput({
    required this.model,
    required this.notifier,
    required this.theme,
    required this.textEditingController,
    required this.l10n,
    required this.focusNode,
    super.key,
  });
  final EventDetailsState model;
  final EventDetailsViewModel notifier;
  final AppTheme theme;
  final TextEditingController textEditingController;
  final L10n l10n;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (model.replyModel != null)
          CommentReplyInfo(
            name: model.replyModel!.name!,
            imgUrl: model.replyModel!.imageUrl!,
            closeOnTap: () {
              notifier.incrementReplyModel(null);
              focusNode.unfocus();
            },
          ),
        if (model.replyModel != null)
          SizedBox(
            height: context.dyHeight(20),
          ),
        CommenSendInput(
          textEditingController: textEditingController,
          label: l10n.doComment,
          focusNode: focusNode,
          isFillColor: true,
          onSuffixTap: () {
            if (textEditingController.text.isEmpty) return;
            if (model.replyModel != null) {
              notifier
                  .eventCommentCreateReply(
                commentId: model.isReplyComment ? null : model.replyModel!.id!,
                replayId: model.isReplyComment ? model.replyModel!.id! : null,
                model.isReplyComment
                    ? '@${model.replyModel!.userName} ${textEditingController.text}'
                    : textEditingController.text,
              )
                  .then((value) {
                notifier.incrementReplyModel(null);
                textEditingController.clear();
                focusNode.unfocus();
              });
            } else {
              notifier
                  .eventCommentCreate(
                textEditingController.text,
              )
                  .then((value) {
                textEditingController.clear();
                focusNode.unfocus();
              });
            }
          },
        ),
      ],
    );
  }
}
