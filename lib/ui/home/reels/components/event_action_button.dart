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

import '../../../../core/helpers/utility.dart';
import '../../../../data/local/token_model.dart';

class EventButton extends StatefulHookConsumerWidget {
  const EventButton({
    required this.showMore,
    required this.model,
    required this.onShowMore,
    super.key,
    this.enableShowCase = false,
    this.isHomePage = false,
  });

  final EventCommonProperties model;
  final bool enableShowCase;
  final bool isHomePage;
  final bool showMore;
  final Function(bool newValue) onShowMore;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => EventButtonState();
}

class EventButtonState extends ConsumerState<EventButton> {
  final GlobalKey _one = GlobalKey();
  bool isRedirecting = false;
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showMore)
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: Color.fromRGBO(21, 34, 42, 1),
            ),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    launchUrls(widget.model.ticketUrl ?? '');
                    widget.onShowMore(false);
                  },
                  child: PrimaryText(
                    l10n.buyTicket,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: const Color.fromRGBO(53, 56, 61, 1),
                ),
                const SizedBox(
                  height: 2,
                ),
                TextButton(
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
                          Navigator.of(context).pop();
                          widget.onShowMore(false);
                        }
                      },
                      theme,
                      context,
                    );
                  },
                  child: PrimaryText(
                    l10n.leaveEvent,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (userModel != null &&
            userModel.token!.userType != null &&
            userModel.token!.userType == 101)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              editButton(themeMode, context),
              buttonBody(
                context,
                themeMode,
                l10n,
                theme,
                router,
                notifier,
                userModel,
              ),
            ],
          )
        else
          buttonBody(
            context,
            themeMode,
            l10n,
            theme,
            router,
            notifier,
            userModel,
          ),
      ],
    );
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
    return Row(
      children: [
        if (isRedirecting)
          redirectingButton(l10n, theme, themeMode, notifier)
        else if (widget.model.joinedStatus ?? false)
          joinedButton(context, l10n, theme, themeMode, notifier)
        else if (widget.model.requestStatus ?? false)
          requestWaitingButton(
            l10n,
            theme,
            themeMode,
            notifier,
          )
        else
          joinButton(l10n, theme, themeMode, notifier),
      ],
    );
  }

  SizedBox requestWaitingButton(
    L10n l10n,
    AppTheme theme,
    bool themeMode,
    HomeViewModel notifier,
  ) {
    return SizedBox(
      height: 58,
      width: MediaQuery.of(context).size.width - 48,

      child: CustomButton(

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
                Navigator.of(context).pop();
              }
            },
            theme,
            context,
          );
        },
      ),
    );
  }

  SizedBox joinButton(
    L10n l10n,
    AppTheme theme,
    bool themeMode,
    HomeViewModel notifier,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 48,
      height: 58,
      child: CustomButton(
        text: (widget.model.isQuotaFull ?? false) == true
            ? l10n.getInLine
            : l10n.join,
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
        onPressed: () async {
          if (widget.model.ticketUrl != null && widget.model.ticketUrl != '') {
            setState(() {
              isRedirecting = true;
            });
            await Future.delayed(const Duration(milliseconds: 200));

            launchUrls(widget.model.ticketUrl ?? '');
            setState(() {
              isRedirecting = false;
            });
          }

          await notifier.eventJoinRequest(
            widget.model.id!,
            homePage: widget.isHomePage,
          );
        },
      ),
    );
  }

  Container redirectingButton(
    L10n l10n,
    AppTheme theme,
    bool themeMode,
    HomeViewModel notifier,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      height: 58,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(24, 26, 32, 1),
      ),
      child: Row(
        children: [
          Assets.icons.bold.twoTicket.svg(
            width: 42,
            height: 42,
          ),
          const SizedBox(
            width: 5,
          ),
          PrimaryText(
            l10n.redirectingTOTicket,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
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
      width: MediaQuery.of(context).size.width - 48,
      height: 58,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomButton(
              text: widget.model.isQuotaFull == true
                  ? l10n.getInLined
                  : l10n.joined,
              style: theme.textTheme.bodyLarge.copyWith(
                color: MainColors.primary,
                fontWeight: FontWeight.w700,
              ),
              bgColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: MainColors.primary,
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
                      Navigator.of(context).pop();
                    }
                  },
                  theme,
                  context,
                );
              },
            ),
          ),
          if (widget.model.ticketUrl != null && widget.model.ticketUrl != '')
            Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              width: 60,
              child: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: themeMode
                        ? MainColors.dark3
                        : MainColors.primary.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      side: themeMode
                          ? BorderSide.none
                          : const BorderSide(
                              color: MainColors.primary400,
                              width: 3,
                            ),
                    )),
                onPressed: () {
                  widget.onShowMore(!widget.showMore);
                },
                icon: Icon(
                  widget.showMore
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
              ),
            ),
        ],
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
