// ignore_for_file: deprecated_member_use_from_same_package, avoid_bool_literals_in_conditional_expressions

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readmore/readmore.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/features/map/map_show.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/comment/comment.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/event/widget/event_rating_popup.dart';
import 'package:togodo/ui/home/reels/components/event_action_button.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';
import 'package:togodo/ui/home/widget/index.dart';

@RoutePage()
class EventDetailsPage extends StatefulHookConsumerWidget {
  const EventDetailsPage({
    @PathParam('eventId') required this.eventId,
    this.applauseCount,
    this.isNotification = false,
    this.onLikeIncrement,
    super.key,
  });
  final String eventId;
  final bool isNotification;
  final String? applauseCount;
  final void Function()? onLikeIncrement;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventDetailsPageState();
}

class _EventDetailsPageState extends ConsumerState<EventDetailsPage> {
  FocusNode focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();
  @override
  void dispose() {
    focusNode.dispose();
    _scrollController.dispose();
    focusNode.removeListener(() {});
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        scrollToBottom();
      }
    });
  }

  void pageDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent * 5,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(eventDetailsViewModelProvider(widget.eventId));
    final notifier =
        ref.read(eventDetailsViewModelProvider(widget.eventId).notifier);
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final router = useRouter();
    final textEditingController = useTextEditingController();
    final userType = ref.watch(userTypeStateNotifierProvider);
    return PopScope(
      canPop: !widget.isNotification,
      onPopInvoked: (pop) async {
        await router.push(
          const HomeRoute(),
        );
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: model.events == null
              ? const Loading()
              : Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EventSlidesShow(
                            model: model,
                            notifier: notifier,
                            theme: theme,
                            router: router,
                            userType: userType! as UserType,
                            onLikeIncrement: widget.onLikeIncrement,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  l10n.eventDetail,
                                  style: theme.textTheme.h5.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ReadMoreText(
                                  model.events!.description ?? '',
                                  trimLines: 5,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: l10n.readMore,
                                  trimExpandedText: l10n.readLess,
                                  moreStyle: theme.textTheme.bodyLarge.copyWith(
                                    color: MainColors.primary,
                                  ),
                                  lessStyle: theme.textTheme.bodyLarge.copyWith(
                                    color: MainColors.primary,
                                  ),
                                  style: theme.textTheme.bodyLarge,
                                ),
                                TagChipWidget(
                                  tagList: model.events!.tags,
                                  userType: userType as UserType,
                                ),
                                Divider(
                                  color: theme.appColors.divider,
                                  height: 48,
                                ),
                                if (model.events!.startTime != null &&
                                    model.events!.date != null &&
                                    !isEventPassed(
                                      model.events!.date!,
                                      model.events!.startTime!,
                                      model.events!.endTime,
                                    ))
                                  const SizedBox()
                                else if (model.events!.startTime != null &&
                                    model.events!.date != null &&
                                    model.events!.rating == null &&
                                    model.events!.rating == 0.0 &&
                                    isEventPassed(
                                      model.events!.date!,
                                      model.events!.startTime!,
                                      model.events!.endTime,
                                    ))
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          PrimaryText(
                                            l10n.evaluation,
                                            style: theme.textTheme.h5.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: theme.appColors.text,
                                            ),
                                          ),
                                          const Spacer(),
                                          RatingBarIndicator(
                                            itemSize: 24,
                                            itemBuilder: (context, _) =>
                                                Assets.icons.bold.star.svg(
                                              color: MainColors.amber,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          PrimaryText(
                                            '0/5.0',
                                            style: theme.textTheme.bodyMedium
                                                .copyWith(
                                              color: theme.appColors.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      PrimaryText(
                                        l10n.notYetRating,
                                        style: theme.textTheme.h4.copyWith(
                                          color: MainColors.primary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      PrimaryText(
                                        l10n.notYetRatingInfo,
                                        style:
                                            theme.textTheme.bodyMedium.copyWith(
                                          color: theme.appColors.secondText,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      if (model.events!.joinedUserCount !=
                                              null &&
                                          model.events!.joinedUserCount! > 0 &&
                                          model.events!.joinedUsers!
                                              .where(
                                                (element) =>
                                                    element.userId ==
                                                    ref
                                                        .read(
                                                          userViewModelProvider,
                                                        )
                                                        .tokenModel!
                                                        .userId,
                                              )
                                              .isNotEmpty)
                                        SizedBox(
                                          width:
                                              context.sized.dynamicWidth(0.5),
                                          child: CustomButton(
                                            text: l10n.rate,
                                            radius: 100,
                                            onPressed: () {
                                              showDialog<Dialog>(
                                                context: context,
                                                builder: (context) => Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  child: CustomModal(
                                                    maxHeight: context.sized
                                                        .dynamicHeight(0.8),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(52),
                                                    ),
                                                    child: RatingPopupView(
                                                      eventName:
                                                          model.events!.name ??
                                                              '',
                                                      eventId:
                                                          model.events!.id ??
                                                              '',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      const CustomDivider(
                                        height: 48,
                                      ),
                                    ],
                                  )
                                else if (model.events!.rating != null)
                                  EventRatingsWidget(
                                    ratings: model.events!.rating,
                                    ratingsList: model.events!.ratings,
                                  ),
                                if (model.events!.price != null &&
                                    model.events!.price != '')
                                  EventPriceDetails(
                                    l10n: l10n,
                                    theme: theme,
                                    model: model,
                                  )
                                else
                                  Text(
                                    l10n.free,
                                    style: theme.textTheme.h3.copyWith(
                                      color: MainColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                EventInfo(
                                  name: l10n.details,
                                  date: model.events!.date ?? '',
                                  location: model.events!.location ?? '',
                                  starTime: '${model.events!.startTime}',
                                  endTime: model.events!.endTime,
                                  description: model.events!.description ?? '',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (model.events!.latitude != null)
                                  GestureDetector(
                                    onVerticalDragEnd: (details) {},
                                    child: AbsorbPointer(
                                      absorbing: false,
                                      child: CustomMapShow(
                                        selectedLocation: LatLng(
                                          double.parse(
                                            model.events!.latitude!,
                                          ),
                                          double.parse(
                                            model.events!.longitude!,
                                          ),
                                        ),
                                        isDarkTheme:
                                            theme.mode == ThemeMode.dark,
                                      ),
                                    ),
                                  ),
                                Divider(
                                  color: theme.appColors.divider,
                                  height: 48,
                                ),
                                if (userType == UserType.user)
                                  Row(
                                    children: [
                                      PrimaryText(
                                        l10n.comments,
                                        style: theme.textTheme.h5.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      if (model.events!.eventComment != null &&
                                          model
                                              .events!.eventComment!.isNotEmpty)
                                        TextButton(
                                          onPressed: () {
                                            showMaterialModalBottomSheet<
                                                DraggableScrollableSheet>(
                                              context: context,
                                              backgroundColor:
                                                  Colors.transparent,
                                              builder: (BuildContext context) {
                                                // Burada yeni post ekleme formunuzu oluşturun
                                                return DraggableScrollableSheet(
                                                  expand: false,
                                                  initialChildSize:
                                                      0.9, // Başlangıç boyutu
                                                  maxChildSize: 0.9,
                                                  minChildSize:
                                                      0.9, // Minimum kaplayacağı boyut
                                                  builder: (_, controller) {
                                                    return CommentPage(
                                                      eventId: widget.eventId,
                                                      isEventOwner: model
                                                                  .events!
                                                                  .vendorDetails ==
                                                              null
                                                          ? false
                                                          : (model
                                                                  .events!
                                                                  .vendorDetails!
                                                                  .id ==
                                                              ref
                                                                  .read(
                                                                    userViewModelProvider,
                                                                  )
                                                                  .tokenModel!
                                                                  .userId),
                                                      dragScrollController:
                                                          controller,
                                                      isClosedComment: model
                                                              .events!
                                                              .isClosedComment ??
                                                          false,
                                                      isCurrentUser: model
                                                              .events!
                                                              .isCurrentUser ??
                                                          false,
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: PrimaryText(
                                            '${l10n.seeAll} (${model.events!.eventComment!.length})',
                                            style: theme.textTheme.bodyLarge
                                                .copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: MainColors.primary,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                const SizedBox(
                                  height: 24,
                                ),
                                if (model.events!.eventComment != null &&
                                    model.events!.eventComment!.isNotEmpty &&
                                    userType == UserType.user)
                                  EventCommentList(
                                    eventId: widget.eventId,
                                    isEventOwner: model.events!.vendorDetails ==
                                            null
                                        ? false
                                        : (model.events!.vendorDetails!.id ==
                                            ref
                                                .read(
                                                  userViewModelProvider,
                                                )
                                                .tokenModel!
                                                .userId),
                                    commentReply: () {
                                      focusNode.requestFocus();
                                    },
                                    eventComment: [
                                      model.events!.eventComment!.first,
                                    ],
                                  )
                                else
                                  Center(
                                    child: Column(
                                      children: [
                                        PrimaryText(
                                          l10n.startTalking,
                                          style: theme.textTheme.h4.copyWith(
                                            color: MainColors.primary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        PrimaryText(
                                          l10n.notYetComment,
                                          style: theme.textTheme.bodyMedium
                                              .copyWith(
                                            color: theme.appColors.secondText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                const SizedBox(
                                  height: 24,
                                ),
                                if (userType == UserType.guest)
                                  const SizedBox.shrink()
                                else if ((model.events?.isClosedComment ??
                                        false) &&
                                    !model.events!.isCurrentUser!)
                                  Center(
                                    child: Column(
                                      children: [
                                        const CustomDivider(
                                          height: 12,
                                        ),
                                        PrimaryText(
                                          l10n.closeComment,
                                          style: theme.textTheme.bodyMedium
                                              .copyWith(
                                            color: theme.appColors.secondText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  EventCommentInput(
                                    model: model,
                                    notifier: notifier,
                                    theme: theme,
                                    textEditingController:
                                        textEditingController,
                                    l10n: l10n,
                                    focusNode: focusNode,
                                  ),
                                if (focusNode.hasFocus)
                                  SizedBox(
                                    height: context.dyHeight(150),
                                  )
                                else
                                  const SizedBox(
                                    height: 81,
                                  ),
                                context.sized.emptySizedHeightBoxHigh,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (userType == UserType.user &&
                        model.events!.date != null &&
                        model.events!.startTime != null &&
                        !isEventPassed(
                          model.events!.date!,
                          model.events!.startTime!,
                          model.events!.endTime,
                        ) &&
                        focusNode.hasFocus == false)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: theme.appColors.background,
                          padding: const EdgeInsets.all(
                            24,
                          ),
                          child: EventButton(
                            model: model.events!,
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
