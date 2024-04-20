import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/profile/widget/block_container.dart';

class NullEventWidget extends StatelessWidget {
  const NullEventWidget({
    required this.theme,
    required this.userName,
    required this.l10n,
    required this.isCurrentUser,
    this.userType = 0,
    super.key,
    this.userId,
  });

  final AppTheme theme;
  final String? userId;
  final String userName;
  final int? userType;
  final L10n l10n;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      height: context.sized.dynamicHeight(0.5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          EmptyContainer(theme: theme),
          if (userType == 0)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PrimaryText(
                  userId != null ? l10n.inviteToEvent : l10n.eventTime,
                  style: theme.textTheme.h5.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: context.sized.dynamicWidth(0.7),
                  child: PrimaryText(
                    userId != null
                        ? l10n.noParticipationYet(userName)
                        : l10n.greatTimeForEvents,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium.copyWith(
                      color: theme.mode == ThemeMode.dark
                          ? MainColors.grey500
                          : MainColors.grey700,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 166,
                  height: 45,
                  decoration: const BoxDecoration().buttonShadow,
                  child: CustomButton(
                    radius: 100,
                    text: l10n.findEvent,
                    style: theme.textTheme.bodyXLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MainColors.white,
                    ),
                    onPressed: () {
                      if (isCurrentUser) {
                        AutoTabsRouter.of(context).setActiveIndex(
                          0,
                        );
                      } else {
                        AutoRouter.of(context).push(const HomeRoute());
                      }
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
