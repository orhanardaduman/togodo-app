// ignore_for_file: deprecated_member_use_from_same_package, avoid_positional_boolean_parameters

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/button/custom_circle_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/chat/utils/chat_constants.dart';
import 'package:togodo/ui/event/create_event_page.dart';
import 'package:togodo/ui/home/view/event_management.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

import '../../../../data/local/token_model.dart';

class EventButton extends StatefulHookConsumerWidget {
  const EventButton({
    required this.model,
    super.key,
    this.enableShowCase = false,
    this.isHomePage = false,
  });

  final EventCommonProperties model;
  final bool enableShowCase;
  final bool isHomePage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => EventButtonState();
}

class EventButtonState extends ConsumerState<EventButton> {
  final GlobalKey _one = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.enableShowCase) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShowCaseWidget.of(context).startShowCase([_one]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    final notifier = ref.read(homeViewModelProvider.notifier);
    final userModel = ref.watch(userViewModelProvider).tokenModel;
    return userModel != null &&
            userModel.token!.userType != null &&
            userModel.token!.userType == 101
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              editButton(themeMode, context),
              buttonBody(
                  context, themeMode, l10n, theme, router, notifier, userModel),
            ],
          )
        : buttonBody(
            context, themeMode, l10n, theme, router, notifier, userModel);
  }

  Padding buttonBody(
    BuildContext context,
    bool themeMode,
    L10n l10n,
    AppTheme theme,
    StackRouter router,
    HomeViewModel notifier,
    TokenModel? userModel,
  ) {
    return Padding(
        padding: EdgeInsets.only(
          bottom: context.sized.dynamicHeight(
            0.01,
          ),
        ),
        child: widget.model.isCurrentUser == true ||
                userModel?.token?.userType == 101
            ? Row(
                children: <Widget>[
                  editButton(themeMode, context),
                  const Spacer(),
                  SizedBox(
                    width: context.dyWidth(context.isMediumScrn ? 293 : 280),
                    child: CustomButton(
                      mode: themeMode ? ButtonMode.dark : ButtonMode.primary,
                      text: l10n.eventManagement,
                      onPressed: () {
                        showModalBottomSheet<CreateEventPage>(
                          context: context,
                          enableDrag: false,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          builder: (BuildContext context) {
                            // Burada yeni post ekleme formunuzu oluşturun
                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.9, // Başlangıç boyutu
                              maxChildSize: 0.9,
                              minChildSize: 0.5, // Minimum kaplayacağı boyut
                              builder: (_, controller) {
                                return ManagementEvent(
                                  eventId: widget.model.id!,
                                  controller: controller,
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            : communityButton(
                context,
                l10n,
                theme,
                themeMode,
                notifier,
                router,
              ));
  }

  SizedBox editButton(bool themeMode, BuildContext context) {
    return SizedBox(
      width: 74,
      child: CustomCircleButton(
        backgroundColor: themeMode ? MainColors.dark2 : MainColors.primary100,
        borderRadius: BorderRadius.circular(16),
        iconPath: Assets.icons.bold.edit.path,
        iconColor: themeMode ? MainColors.white : MainColors.primary,
        onPressed: () {
          showMaterialModalBottomSheet<CreateEventPage>(
            context: context,
            enableDrag: false,
            builder: (BuildContext context) {
              return CreateEventPage(
                isDraft: true,
                isUpdate: true,
                eventId: widget.model.id,
              );
            },
          );
        },
      ),
    );
  }

  Row communityButton(
    BuildContext context,
    L10n l10n,
    AppTheme theme,
    bool themeMode,
    HomeViewModel notifier,
    StackRouter router,
  ) {
    return (widget.model.openToJoinStatus ?? false)
        ? Row(
            children: [
              SizedBox(
                width: context.sized.dynamicWidth(0.35),
                child: widget.model.joinedStatus ?? false
                    ? joinedButton(context, l10n, theme, themeMode, notifier)
                    : joinButton(l10n, theme, themeMode, notifier),
              ),
              if (widget.model.openToJoinStatus ?? false) const Spacer(),
              if (widget.model.openToJoinStatus ?? false)
                joinWithFriendsButton(
                  theme,
                  l10n,
                  context,
                  router,
                  notifier,
                ),
            ],
          )
        : Row(
            children: [
              if (widget.model.joinedStatus ?? false)
                SizedBox(
                  width: context.sized
                      .dynamicWidth(context.isSmallScrn ? 0.85 : 0.88),
                  child:
                      joinedButton(context, l10n, theme, themeMode, notifier),
                )
              else if (widget.model.requestStatus ?? false)
                SizedBox(
                  width: context.sized
                      .dynamicWidth(context.isSmallScrn ? 0.85 : 0.88),
                  child: requestWaitingButton(
                    l10n,
                    theme,
                    themeMode,
                    notifier,
                  ),
                )
              else if (widget.model.isQuotaFull == true)
                SizedBox(
                  width: context.sized
                      .dynamicWidth(context.isSmallScrn ? 0.85 : 0.88),
                  child:
                      withFriendsButton(context, l10n, theme, notifier, router),
                )
              else
                SizedBox(
                  width: context.sized.dynamicWidth(0.35),
                  child: joinButton(l10n, theme, themeMode, notifier),
                ),
              if (!(widget.model.joinedStatus ?? false) &&
                  (widget.model.isQuotaFull != true) &&
                  !(widget.model.requestStatus ?? false))
                const Spacer(),
              if (!(widget.model.joinedStatus ?? false) &&
                  (widget.model.isQuotaFull != true) &&
                  !(widget.model.requestStatus ?? false))
                joinWithFriendsButton(
                  theme,
                  l10n,
                  context,
                  router,
                  notifier,
                ),
            ],
          );
  }

  CustomButton requestWaitingButton(
    L10n l10n,
    AppTheme theme,
    bool themeMode,
    HomeViewModel notifier,
  ) {
    return CustomButton(
      text: l10n.requestWaiting,
      style: theme.textTheme.bodyLarge.copyWith(
        color: themeMode ? MainColors.white : MainColors.primary,
        fontWeight: FontWeight.w700,
      ),
      bgColor: MainColors.primary.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: MainColors.primary400,
          width: 3,
        ),
      ),
      onPressed: () {
        warningShowDialog(
          l10n.leaveEvent,
          l10n.leaveEventInfo,
          l10n.leaveEvent,
          () async {
            final response = await notifier.eventRemoveJoinRequest(
              widget.model.id!,
              homePage: widget.isHomePage,
            );
            if (response) {
              // ignore: use_build_context_synchronously
              await AutoRouter.of(context).pop();
            }
          },
          theme,
          context,
        );
      },
    );
  }

  CustomButton joinButton(
    L10n l10n,
    AppTheme theme,
    bool themeMode,
    HomeViewModel notifier,
  ) {
    return CustomButton(
      text: widget.model.isQuotaFull == true ? l10n.getInLine : l10n.join,
      style: theme.textTheme.bodyLarge.copyWith(
        color: themeMode ? MainColors.white : MainColors.primary,
        fontWeight: FontWeight.w700,
      ),
      bgColor: MainColors.primary.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: MainColors.primary400,
          width: 3,
        ),
      ),
      onPressed: () {
        notifier.eventJoinRequest(
          widget.model.id!,
          homePage: widget.isHomePage,
        );
      },
    );
  }

  SizedBox joinedButton(
    BuildContext context,
    L10n l10n,
    AppTheme theme,
    bool themeMode,
    HomeViewModel notifier,
  ) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.35),
      child: CustomButton(
        text: widget.model.isQuotaFull == true ? l10n.getInLined : l10n.joined,
        style: theme.textTheme.bodyLarge.copyWith(
          color: themeMode ? MainColors.white : MainColors.primary,
          fontWeight: FontWeight.w700,
        ),
        bgColor:
            themeMode ? MainColors.dark3 : MainColors.primary.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: themeMode
              ? BorderSide.none
              : const BorderSide(
                  color: MainColors.primary400,
                  width: 3,
                ),
        ),
        onPressed: () {
          warningShowDialog(
            l10n.leaveEvent,
            l10n.leaveEventInfo,
            l10n.leaveEvent,
            () async {
              final response = await notifier.leaveEvent(
                widget.model.id!,
                homePage: widget.isHomePage,
              );
              if (response) {
                // ignore: use_build_context_synchronously
                await AutoRouter.of(context).pop();
              }
            },
            theme,
            context,
          );
        },
      ),
    );
  }

  Widget joinWithFriendsButton(
    AppTheme theme,
    L10n l10n,
    BuildContext context,
    StackRouter router,
    HomeViewModel notifier,
  ) {
    return widget.enableShowCase
        ? Showcase.withWidget(
            key: _one,
            height:
                117, // Yükseklik ve genişlik, içeriğinize göre ayarlanmalıdır.
            width: 300,
            disableMovingAnimation: true,
            targetBorderRadius: BorderRadius.circular(16),
            tooltipPosition: TooltipPosition.top,

            onBarrierClick: () {
              notifier.setEnableShowcase();
            },
            container: Container(
              width: 320,
              decoration: BoxDecoration(
                color: theme.appColors.background,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(
                16,
              ), // İçerik için padding ekleyin
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    l10n.greetings,
                    style: theme.textTheme.bodyLarge.copyWith(
                      color: theme.appColors.text,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: '1 - ',
                        style: theme.textTheme.bodyMedium.copyWith(
                          color: theme.appColors.text,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: l10n.joinWithFriends,
                            style: theme.textTheme.bodyMedium.copyWith(
                              color: theme.appColors.themeColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: l10n.step1,
                            style: theme.textTheme.bodyMedium.copyWith(
                              color: theme.appColors.text,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: '2 - ',
                        style: theme.textTheme.bodyMedium.copyWith(
                          color: theme.appColors.text,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: l10n.join,
                            style: theme.textTheme.bodyMedium.copyWith(
                              color: theme.appColors.themeColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: l10n.step2,
                            style: theme.textTheme.bodyMedium.copyWith(
                              color: theme.appColors.text,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: withFriendsButton(context, l10n, theme, notifier, router),
          )
        : withFriendsButton(context, l10n, theme, notifier, router);
  }

  SizedBox withFriendsButton(
    BuildContext context,
    L10n l10n,
    AppTheme theme,
    HomeViewModel notifier,
    StackRouter router,
  ) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.5),
      child: CustomButton(
        text: widget.model.isQuotaFull == true
            ? l10n.getInLine
            : l10n.joinWithFriends,
        style: theme.textTheme.bodyLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        onPressed: () {
          print("burda");
          print(!(widget.model.openToJoinStatus ?? false));
          if (widget.model.isQuotaFull == true) {
            notifier.eventJoinRequest(
              widget.model.id!,
              homePage: widget.isHomePage,
              forLine: true,
            );
          } else {
            if (!(widget.model.openToJoinStatus ?? false)) {
              notifier.eventJoinRequest(
                widget.model.id!,
                openToJoin: true,
                homePage: widget.isHomePage,
              );
            }
            router.push(
              JoinWithFriendsRoute(
                eventId: widget.model.id!,
                ticketUrl: (widget.model.openToJoinStatus ?? false)
                    ? widget.model.ticketUrl
                    : null,
              ),
            );
          }
        },
      ),
    );
  }
}
