// ignore_for_file: deprecated_member_use_from_same_package, avoid_positional_boolean_parameters

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/local/token_model.dart';
import 'package:togodo/features/component/togodo_logo.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';
import 'package:togodo/ui/notification_view_model.dart';

class ReelsAppBar extends HookConsumerWidget {
  const ReelsAppBar({
    required this.controller,
    required this.onTopMove,
    super.key,
  });
  final PageController controller;
  final void Function() onTopMove;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final notifier = ref.read(homeViewModelProvider.notifier);
    final homeViewModel = ref.watch(homeViewModelProvider);
    final notificationState = ref.watch(notificationStateProvider);
    final notifierNotification = ref.read(notificationStateProvider.notifier);
    final userModel = ref.watch(userViewModelProvider).tokenModel;
    final userType = ref.watch(userTypeStateNotifierProvider);

    return body(
      context,
      router,
      notificationState,
      notifierNotification,
      homeViewModel.isToday,
      theme,
      l10n,
      notifier,
      homeViewModel.enableShowcase,
      userModel,
      userType! as UserType,
    );
  }

  SafeArea body(
    BuildContext context,
    StackRouter router,
    NotificationModel notificationState,
    NotificationState notifierNotification,
    bool isToday,
    AppTheme theme,
    L10n l10n,
    HomeViewModel notifier,
    bool enableShowCase,
    TokenModel? userModel,
    UserType userType,
  ) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: context.device.isAndroidDevice ? 10 : 1,
        ),
        child: Column(
          children: [
            appLogo(router, notificationState, notifierNotification, userType),
            SizedBox(height: context.isMediumScrn ? 10 : 5),
            forYouToday(isToday, theme, l10n, notifier),
          ],
        ),
      ),
    );
  }

  Row appLogo(
    StackRouter router,
    NotificationModel notificationState,
    NotificationState notifierNotification,
    UserType userType,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTopMove,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 30,
                  offset: const Offset(
                    0,
                    3,
                  ), // gölgenin pozisyonunu değiştirebilirsiniz
                ),
              ],
            ),
            child: const TogodoLogo(),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            if (userType == UserType.guest) {
              return;
            }
            router.push(const DiscoverSearchRoute());
          },
          icon: Assets.icons.bold.newSearch.svg(),
        ),
        IconButton(
          onPressed: () {
            if (userType == UserType.guest) {
              return;
            }
            if (notificationState.newNotification) {
              notifierNotification.updateNotification(false);
            }
            router.push(
              NotificationRoute(),
            );
          },
          icon: notificationState.newNotification
              ? Badge(
                  smallSize: 10,
                  backgroundColor: MainColors.primary,
                  child: Assets.icons.bold.newNot.svg(),
                )
              : Assets.icons.bold.newNot.svg(),
        ),
        IconButton(
          onPressed: () {
            if (userType == UserType.guest) {
              return;
            }
            if (notificationState.newMessage) {
              notifierNotification.updateMessage(false);
            }
            router.push(
              ChatHomeRoute(),
            );
          },
          icon: notificationState.newMessage
              ? Badge(
                  smallSize: 10,
                  backgroundColor: MainColors.primary,
                  child: Assets.icons.bold.newMessage.svg(),
                )
              : Assets.icons.bold.newMessage.svg(),
        ),
      ],
    );
  }

  Row forYouToday(
    bool isToday,
    AppTheme theme,
    L10n l10n,
    HomeViewModel notifier,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 98,
          height: 32,
          child: CustomButton(
            bgColor: !isToday ? null : Colors.transparent,
            shadowColor: !isToday ? null : Colors.transparent,
            side: !isToday
                ? BorderSide.none
                : const BorderSide(
                    color: MainColors.disabled,
                  ),
            style: !isToday
                ? null
                : theme.textTheme.bodyMedium.copyWith(
                    color: MainColors.disabledButton,
                  ),
            text: l10n.forYou,
            radius: 100,
            onPressed: () {
              controller.jumpToPage(0);
              notifier.changeToday(isVal: false);
            },
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 75,
          height: 32,
          child: CustomButton(
            bgColor: isToday ? null : Colors.transparent,
            shadowColor: isToday ? null : Colors.transparent,
            side: isToday
                ? BorderSide.none
                : const BorderSide(
                    color: MainColors.disabled,
                  ),
            style: isToday
                ? null
                : theme.textTheme.bodyMedium.copyWith(
                    color: MainColors.disabledButton,
                  ),
            text: l10n.today,
            radius: 100,
            onPressed: () {
              controller.jumpToPage(1);
              notifier.changeToday(isVal: true);
            },
          ),
        ),
      ],
    );
  }
}
