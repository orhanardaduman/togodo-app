import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/features/component/comment_send_input.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/ui/comment/comment_view_model.dart';
import 'package:togodo/ui/comment/widget/comment_container.dart';
import 'package:togodo/ui/comment/widget/reply_info.dart';
import 'package:togodo/ui/notification/notification_view_model.dart';

@RoutePage()
class CommentPage extends StatefulHookConsumerWidget {
  const CommentPage({
    required this.eventId,
    required this.isEventOwner,
    required this.dragScrollController,
    required this.isClosedComment,
    required this.isCurrentUser,
    super.key,
  });
  final String eventId;
  final bool isEventOwner;
  final ScrollController dragScrollController;
  final bool isClosedComment;
  final bool isCurrentUser;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentPageState();
}

class _CommentPageState extends ConsumerState<CommentPage> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isPost = false;
  final FocusNode _focusNode = FocusNode();
  final ScrollController commentScrollController = ScrollController();

  EventCommentModel? _replyModel; // Eğer yoruma cevap veriliyorsa dolu  olacak
  bool _isReplyComment =
      false; // Yoruma mı yorum atılıyor yoksa ana yoruma mı / yoruma yorum ise true
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final notifier =
        ref.watch(commentViewModelProvider(widget.eventId).notifier);
    final model = ref.watch(commentViewModelProvider(widget.eventId));

    final loading = ref.watch(
      notificationViewModelProvider.select((value) {
        return value.loading;
      }),
    );
    final l10n = useL10n();

    return CustomModal(
      title: l10n.comments,
      maxHeight: context.sized.dynamicHeight(1.2),
      isCloseDivider: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      child: loading
          ? const Loading()
          : Stack(
              children: [
                SizedBox(
                  height: context.sized
                      .dynamicHeight(context.isMediumScrn ? 0.76 : 0.715),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      if (notification.metrics.pixels <=
                          notification.metrics.minScrollExtent) {}
                      return true;
                    },
                    child: CommentContainer(
                      datas: model.datas,
                      isEventOwner: widget.isEventOwner,
                      controller: commentScrollController,
                      physics: const BouncingScrollPhysics(),
                      eventId: widget.eventId,
                      padding: const EdgeInsets.only(bottom: 100),
                      onLike: ({required int index}) {
                        notifier.toggleLike(
                          model.datas[index].id!,
                        );
                      },
                      delete: (index) {
                        notifier.eventCommentRemove(
                          model.datas[index].id!,
                        );
                      },
                      commentMark: (index) {
                        if (model.datas[index].isMark!) {
                          notifier.commentMark(
                            model.datas[index].id!,
                          );
                        } else {
                          notifier.commentUnMark(
                            model.datas[index].id!,
                          );
                        }
                      },
                      commentReply: (index) {
                        setState(() {
                          _isReplyComment = false;
                          _focusNode.requestFocus();
                          _replyModel = model.datas[index];
                        });
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
                      replyDelete: (commentId, replyId) {
                        notifier.eventReplyIdRemove(replyId);
                      },
                      replyReply: (commentId, replyId) {
                        setState(() {
                          _focusNode.requestFocus();
                          _isReplyComment = true;
                          final data = model.datas.firstWhere(
                            (element) => element.id == commentId,
                          );
                          _replyModel = data.replies!
                              .firstWhere((element) => element.id == replyId);
                        });
                      },
                    ),
                  ),
                ),
                bottomTextField(
                  context,
                  theme,
                  l10n,
                  notifier,
                  MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
    );
  }

  Positioned bottomTextField(
    BuildContext context,
    AppTheme theme,
    L10n l10n,
    CommentViewModel notifier,
    double bottom,
  ) {
    return Positioned(
      bottom: bottom,
      left: 0,
      right: 0,
      child: widget.isClosedComment && !widget.isCurrentUser
          ? Center(
              child: Column(
                children: [
                  const CustomDivider(
                    height: 12,
                  ),
                  PrimaryText(
                    'Etkinlik için yorumlar kapatılmıştır.',
                    style: theme.textTheme.bodyMedium.copyWith(
                      color: theme.appColors.secondText,
                    ),
                  ),
                ],
              ),
            )
          : col(context, l10n, notifier),
    );
  }

  Column col(BuildContext context, L10n l10n, CommentViewModel notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_replyModel != null)
          CommentReplyInfo(
            name: _replyModel!.name!,
            imgUrl: _replyModel!.imageUrl!,
            closeOnTap: () {
              setState(() {
                _replyModel = null;
                _focusNode.unfocus();
              });
            },
          ),
        SizedBox(
          height: context.dyHeight(20),
        ),
        CommenSendInput(
          textEditingController: _textEditingController,
          label: l10n.userInfo,
          focusNode: _focusNode,
          onSuffixTap: _isPost
              ? () {}
              : () {
                  setState(() {
                    _isPost = true;
                  });
                  if (_textEditingController.text.isEmpty) return;
                  if (_replyModel != null) {
                    notifier
                        .eventCommentCreateReply(
                      commentId: _isReplyComment ? null : _replyModel!.id!,
                      replayId: _isReplyComment ? _replyModel!.id! : null,
                      _isReplyComment
                          ? '@${_replyModel!.userName} ${_textEditingController.text}'
                          : _textEditingController.text,
                    )
                        .then((value) {
                      setState(() {
                        _replyModel = null;
                        _textEditingController.clear();
                        _focusNode.unfocus();
                        _isPost = false;
                      });
                    });
                  } else {
                    notifier
                        .eventCommentCreate(_textEditingController.text)
                        .then((value) {
                      setState(() {
                        _textEditingController.clear();
                        _focusNode.unfocus();
                        _isPost = false;
                      });
                    });
                  }
                },
        ),
      ],
    );
  }
}
