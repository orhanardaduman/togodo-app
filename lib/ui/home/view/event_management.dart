// ignore_for_file: deprecated_member_use_from_same_package
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_stack_image.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/features/component/comment_send_input.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/comment/widget/reply_info.dart';
import 'package:togodo/ui/event/create_event_page.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';
import 'package:togodo/ui/home/widget/details_management_comment_list.dart';
import 'package:togodo/ui/home/widget/event_info.dart';

class ManagementEvent extends StatefulHookConsumerWidget {
  const ManagementEvent({
    required this.eventId,
    required this.controller,
    super.key,
  });
  final String eventId;
  final ScrollController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManagementEventState();
}

class _ManagementEventState extends ConsumerState<ManagementEvent> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isPost = false;
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(eventDetailsViewModelProvider(widget.eventId));
    final notifier =
        ref.read(eventDetailsViewModelProvider(widget.eventId).notifier);
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    return DragCustomModal(
      title: l10n.eventManagement,
      isCloseDivider: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      controller: widget.controller,
      child: model.events == null
          ? const SizedBox.shrink()
          : Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: context.sized.dynamicHeight(0.76),
                    child: body(model, theme, context, l10n, router, notifier),
                  ),
                ),
                bottomTextField(
                  context,
                  theme,
                  l10n,
                  notifier,
                  MediaQuery.of(context).viewInsets.bottom,
                  model,
                ),
              ],
            ),
    );
  }

  AnimatedPositioned bottomTextField(
    BuildContext context,
    AppTheme theme,
    L10n l10n,
    EventDetailsViewModel notifier,
    double bottom,
    EventDetailsState model,
  ) {
    return AnimatedPositioned(
      bottom: bottom,
      duration: const Duration(milliseconds: 150),
      left: 0,
      right: 0,
      child: col(context, l10n, notifier, model),
    );
  }

  Column col(
    BuildContext context,
    L10n l10n,
    EventDetailsViewModel notifier,
    EventDetailsState model,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (model.replyModel != null)
          CommentReplyInfo(
            name: model.replyModel!.name!,
            imgUrl: model.replyModel!.imageUrl!,
            closeOnTap: () {
              setState(() {
                notifier.incrementReplyModel(null);
                notifier.focusNode.unfocus();
              });
            },
          ),
        SizedBox(
          height: context.dyHeight(20),
        ),
        CommenSendInput(
          textEditingController: _textEditingController,
          label: l10n.userInfo,
          focusNode: notifier.focusNode,
          onSuffixTap: _isPost
              ? () {}
              : () {
                  setState(() {
                    _isPost = true;
                  });
                  if (_textEditingController.text.isEmpty) return;
                  if (model.replyModel != null) {
                    notifier
                        .eventCommentCreateReply(
                      commentId:
                          model.isReplyComment ? null : model.replyModel!.id!,
                      replayId:
                          model.isReplyComment ? model.replyModel!.id! : null,
                      model.isReplyComment
                          ? '@${model.replyModel!.name} ${_textEditingController.text}'
                          : _textEditingController.text,
                    )
                        .then((value) {
                      setState(() {
                        notifier.incrementReplyModel(null);
                        _textEditingController.clear();
                        notifier.focusNode.unfocus();
                        _isPost = false;
                      });
                    });
                  } else {
                    notifier
                        .eventCommentCreate(_textEditingController.text)
                        .then((value) {
                      setState(() {
                        _textEditingController.clear();
                        _isPost = false;
                        notifier.focusNode.unfocus();
                      });
                    });
                  }
                },
        ),
        SizedBox(
          height: context.dyHeight(20),
        ),
      ],
    );
  }

  ListView body(
    EventDetailsState model,
    AppTheme theme,
    BuildContext context,
    L10n l10n,
    StackRouter router,
    EventDetailsViewModel notifier,
  ) {
    return ListView(
      shrinkWrap: true,
      children: [
        if (model.events!.request != null)
          GestureDetector(
            onTap: () {
              (model.events!.isQuotaFull ?? false)
                  ? showMaterialModalBottomSheet<CreateEventPage>(
                      context: context,
                      enableDrag: false,
                      builder: (BuildContext context) {
                        return CreateEventPage(
                          isDraft: true,
                          isUpdate: true,
                          eventId: widget.eventId,
                          initStep: 3,
                        );
                      },
                    )
                  : router.push(
                      EventRequestRoute(
                        eventId: widget.eventId,
                      ),
                    );
            },
            child: eventRequests(
              context,
              theme,
              model.events!.request!,
              l10n.eventRequests,
              isQuotaFull: model.events!.isQuotaFull ?? false,
            ),
          ),
        divider(theme),
        GestureDetector(
          onTap: () {
            router.push(
              EventJoinedUserRoute(
                eventId: widget.eventId,
              ),
            );
          },
          child: joinedUser(l10n, model, theme),
        ),
        divider(theme),
        eventInfo(theme, model.events!),
        divider(theme),
        if (model.events!.eventComment != null &&
            model.events!.eventComment!.isNotEmpty)
          EventCommentList(
            eventId: widget.eventId,
            isEventOwner: true,
            eventComment: model.events!.eventComment,
            commentReply: () {},
          ),
        context.sized.emptySizedHeightBoxHigh,
      ],
    );
  }

  Row joinedUser(L10n l10n, EventDetailsState model, AppTheme theme) {
    return Row(
      children: <Widget>[
        Assets.icons.bold.threeUser.svg(
          width: 20,
          height: 20,
          color: MainColors.primary,
        ),
        const SizedBox(
          width: 8,
        ),
        PrimaryText(
          l10n.eventJoinedUser(model.events!.joinedUserCount ?? 0),
          style: theme.textTheme.bodyLarge.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        StackedWidgets(
          imageLength: 6,
          size: context.isMediumScrn ? 32 : 28,
          joinedUsers:
              model.events!.joinedUsers!.map((e) => e.imageUrl!).toList(),
        ),
      ],
    );
  }

  EventInfo eventInfo(AppTheme theme, EventDetailsModel model) {
    return EventInfo(
      name: model.name ?? '',
      date: model.date ?? '',
      location: model.location ?? '',
      starTime: '${model.startTime}',
      endTime: model.endTime,
      description: model.description ?? '',
    );
  }

  Divider divider(AppTheme theme) {
    return Divider(
      color: theme.appColors.divider,
      height: 40,
    );
  }

  Row eventRequests(
    BuildContext context,
    AppTheme theme,
    List<Request> request,
    String title, {
    bool isQuotaFull = false,
  }) {
    return Row(
      children: [
        StackedWidgets(
          size: context.isMediumScrn ? 32 : 28,
          direction: TextDirection.rtl,
          xShift: 18,
          joinedUsers: request.map((e) => e.imageUrl!).toList(),
          imageLength: 1,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
              title,
              style: theme.textTheme.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (request.isEmpty)
              const SizedBox.shrink()
            else if (isQuotaFull)
              SizedBox(
                width: context.dyWidth(160),
                child: PrimaryText(
                  'Etkinlik dolu, istekleri kabul etmek için kontenjan aç.',
                  maxLines: 2,
                  style: theme.textTheme.bodySmall.copyWith(),
                ),
              )
            else
              PrimaryText(
                getFriendsRequestText(
                  request,
                  2,
                ),
                style: theme.textTheme.bodySmall.copyWith(),
              ),
          ],
        ),
        const Spacer(),
        // 👋🏼
        if (isQuotaFull)
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              width: context.dyWidth(120),
              height: 32,
              child: CustomButton(
                text: 'Kontenjanı Artır',
                bgColor: MainColors.transparentYellow,
                style: theme.textTheme.bodyMedium.copyWith(
                  color: MainColors.yellow,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  showMaterialModalBottomSheet<CreateEventPage>(
                    context: context,
                    enableDrag: false,
                    builder: (BuildContext context) {
                      return CreateEventPage(
                        isDraft: true,
                        isUpdate: true,
                        eventId: widget.eventId,
                        initStep: 3,
                      );
                    },
                  );
                },
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: MainColors.yellow,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        else
          const Text(
            '👋🏼',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        if (!isQuotaFull)
          const SizedBox(
            width: 14,
          ),
        if (!isQuotaFull)
          Assets.icons.bold.addRight.svg(
            width: 24,
            height: 24,
            color: MainColors.grey600,
          ),
      ],
    );
  }

  String getFriendsRequestText(
    List<Request> requests,
    int maxNamesToShow,
  ) {
    // İstek sayısı maxNamesToShow'dan fazla ise,
    // ilk birkaç ismi al ve geri kalan sayıyı ekle
    if (requests.length > maxNamesToShow) {
      final names = requests.take(maxNamesToShow).map((e) => e.name).join(', ');
      final remainingCount = requests.length - maxNamesToShow;
      return '$names +$remainingCount';
    } else {
      // İstek sayısı maxNamesToShow'dan az veya eşit ise,
      // tüm isimleri birleştir ve döndür
      return requests.map((e) => e.name).join(', ');
    }
  }
}
