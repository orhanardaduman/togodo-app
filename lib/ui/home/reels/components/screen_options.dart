// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_stack_image.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/date_time.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/features/component/like_button.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';
import 'package:togodo/ui/home/widget/more_button_actions.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class ScreenOptions extends HookConsumerWidget {
  const ScreenOptions({
    required this.item,
    super.key,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
    this.padding,
    this.isDetailsRoute = true,
  });
  final EventCommonProperties item;
  final void Function(EventCommonProperties)? onShare;
  final void Function(String)? onLike;
  final void Function(String)? onComment;
  final void Function()? onClickMoreBtn;
  final void Function()? onFollow;
  final EdgeInsetsGeometry? padding;
  final bool isDetailsRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final loading = ref.watch(homeViewModelProvider).loading;
    final userType = ref.watch(userTypeStateNotifierProvider);
    final language = ref.watch(languageProvider);

    final router = useRouter();
    final l10n = useL10n();
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            left: 24,
            right: 12,
            bottom: context.sized
                .dynamicHeight(context.isSmallScrn ? 0.215 : 0.205),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  leftInfo(
                    theme,
                    context,
                    router,
                    userType! as UserType,
                    language,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (loading)
                        SizedBox.fromSize()
                      else
                        rightActionButton(context, theme),
                      const SizedBox(height: 24),
                      if (item.date != null &&
                          item.startTime != null &&
                          isEventPassed(
                            item.date!,
                            item.startTime!,
                            item.endTime,
                          ))
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SizedBox(
                            width: context.dyWidth(110),
                            height: 32,
                            child: CustomButton(
                              text: l10n.eventPassed,
                              bgColor: MainColors.transparentRed,
                              style: theme.textTheme.bodyMedium.copyWith(
                                color: MainColors.red,
                                fontWeight: FontWeight.w700,
                              ),
                              onPressed: () {
                                if (userType == UserType.guest) {
                                  return showGuestInfo(theme, context);
                                }
                                router.push(
                                  EventJoinedUserRoute(
                                    eventId: item.id!,
                                    isManagement: false,
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: MainColors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        )
                      else if ((item.joinedUserCount ?? 0) > 0)
                        Column(
                          children: [
                            if (item.isQuotaFull!)
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: SizedBox(
                                  width: context.dyWidth(110),
                                  height: 32,
                                  child: CustomButton(
                                    text: l10n.eventFull,
                                    bgColor: MainColors.transparentYellow,
                                    style: theme.textTheme.bodyMedium.copyWith(
                                      color: MainColors.yellow,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    onPressed: () {
                                      if (userType == UserType.guest) {
                                        return showGuestInfo(theme, context);
                                      }
                                      router.push(
                                        EventJoinedUserRoute(
                                          eventId: item.id!,
                                          isManagement: false,
                                        ),
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
                              const SizedBox.shrink(),
                            if (item.isQuotaFull!)
                              const SizedBox(
                                height: 10,
                              ),
                            GestureDetector(
                              onTap: () {
                                if (userType == UserType.guest) {
                                  return showGuestInfo(theme, context);
                                }
                                router.push(
                                  EventJoinedUserRoute(
                                    eventId: item.id!,
                                    isManagement: false,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: StackedWidgets(
                                  size: context.isMediumScrn ? 32 : 28,
                                  direction: TextDirection.rtl,
                                  xShift: 18,
                                  joinedUsers: item.joinedUsers!
                                      .map((e) => e.imageUrl!)
                                      .toList(),
                                  imageLength: 5,
                                ),
                              ),
                            )
                          ],
                        )
                      else
                        SizedBox(
                          height: context.isMediumScrn ? 32 : 28,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column leftInfo(
    AppTheme theme,
    BuildContext context,
    StackRouter router,
    UserType userType,
    String language,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (item.vendorDetails?.name != null &&
            (item.vendorDetails?.id != '8ebb12ec-05db-4230-aa9e-28af26600d93'))
          GestureDetector(
            onTap: () {
              if (userType == UserType.guest) {
                return showGuestInfo(theme, context);
              }
              if (isDetailsRoute) {
                item.isCurrentUser!
                    ? AutoTabsRouter.of(context).setActiveIndex(
                        4,
                      )
                    : router.push(
                        UserProfileRoute(userId: item.vendorDetails!.id!),
                      );
              } else {
                if (item.isCurrentUser!) {
                  router.popAndPush(ProfileRoute());
                } else {
                  router.push(
                    UserProfileRoute(userId: item.vendorDetails!.id!),
                  );
                }
              }
            },
            child: Row(
              children: [
                CustomAvatarImage(
                  size: 32,
                  imageUrl: item.vendorDetails!.imageUrl,
                  border: Border.all(
                    color: MainColors.white.withOpacity(0.4),
                  ),
                ),
                const SizedBox(width: 6),
                PrimaryText(
                  '${item.vendorDetails?.name}',
                  style: theme.textTheme.bodyLarge.copyWith(
                    color: MainColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            if (isDetailsRoute) {
              router.push(EventDetailsRoute(eventId: item.id!));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.sized.dynamicWidth(0.58),
                child: PrimaryText(
                  '${item.name}',
                  maxLines: 2,
                  style: context.isMediumScrn
                      ? theme.textTheme.h4.copyWith(
                          color: MainColors.white,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        )
                      : theme.textTheme.h5.copyWith(
                          color: MainColors.white,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ),
              if (item.location != null)
                SizedBox(
                  width: context.sized.dynamicWidth(0.58),
                  child: PrimaryText(
                    item.location ?? '',
                    maxLines: 1,
                    style: theme.textTheme.bodyMedium.copyWith(
                      color: MainColors.white,
                    ),
                  ),
                ),
              if (item.date != null)
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodySmall
                        .copyWith(color: theme.appColors.secondText),
                    children: <TextSpan>[
                      TextSpan(
                        text: item.date!.getFormattedDate(language),
                        style: theme.textTheme.h5.copyWith(
                          color: MainColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' ${item.date!.getFormattedDay(language)}',
                        style: theme.textTheme.bodyMedium.copyWith(
                          color: MainColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Column rightActionButton(
    BuildContext context,
    AppTheme theme,
  ) {
    return Column(
      children: [
        if (onLike != null)
          LikeButton(
            isLiked: item.likeStatus!,
            isShowCount: true,
            theme: theme,
            likeCount: item.likeCount,
            onLikeChanged: ({required bool isLiked}) {
              onLike!(item.id!);
            },
          ),
        SizedBox(height: context.dyHeight(15)),
        if (onShare != null)
          InkWell(
            onTap: () => onShare!(item),
            child: Column(
              children: [
                Assets.icons.lightOutline.send.svg(
                  width: 28,
                  height: 28,
                  color: Colors.white,
                ),
                const SizedBox(height: 2),
                PrimaryText(
                  '${item.shareCount}',
                  style: theme.textTheme.bodyLarge.copyWith(
                    color: MainColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        SizedBox(height: context.dyHeight(15)),
        if (onClickMoreBtn != null)
          item.isCurrentUser!
              ? OwnerIconPopupMenu(
                  userId: item.vendorDetails!.id!,
                  eventId: item.id!,
                  isClosedComment: item.isClosedComment ?? false,
                )
              : UserIconPopupMenu(
                  userId: item.vendorDetails?.id ?? '0',
                  eventId: item.id!,
                ),
      ],
    );
  }
}
