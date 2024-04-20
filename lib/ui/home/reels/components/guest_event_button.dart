import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';

class GuestEventButton extends HookConsumerWidget {
  const GuestEventButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: context.device.isAndroidDevice ? 10 : 1,
          bottom: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                joinedButton(
                  context,
                  l10n,
                  theme,
                ),
                const Spacer(),
                withFriendsButton(
                  context,
                  l10n,
                  theme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox withFriendsButton(
    BuildContext context,
    L10n l10n,
    AppTheme theme,
  ) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.5),
      child: CustomButton(
        text: l10n.joinWithFriends,
        style: theme.textTheme.bodyLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        onPressed: () {
          return showGuestInfo(theme, context);
        },
      ),
    );
  }

  SizedBox joinedButton(
    BuildContext context,
    L10n l10n,
    AppTheme theme,
  ) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.35),
      child: CustomButton(
        text: l10n.joined,
        style: theme.textTheme.bodyLarge.copyWith(
          color: theme.mode == ThemeMode.dark
              ? MainColors.white
              : MainColors.primary,
          fontWeight: FontWeight.w700,
        ),
        bgColor: theme.mode == ThemeMode.dark
            ? MainColors.dark3
            : MainColors.primary.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: theme.mode == ThemeMode.dark
              ? BorderSide.none
              : const BorderSide(
                  color: MainColors.primary400,
                  width: 3,
                ),
        ),
        onPressed: () {
          return showGuestInfo(theme, context);
        },
      ),
    );
  }
}
