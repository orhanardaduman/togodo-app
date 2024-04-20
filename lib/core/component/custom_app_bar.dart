// ignore_for_file: deprecated_member_use_from_same_package, prefer_null_aware_method_calls

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class CustomAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.onTap,
    this.isBackButtonShow = true,
    super.key,
  });

  final String? title;
  final bool isBackButtonShow;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return AppBar(
      surfaceTintColor: Colors.transparent,
      title: title == null
          ? const SizedBox.shrink()
          : PrimaryText(
              title!,
              style: theme.textTheme.h4.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: isBackButtonShow
          ? InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (onTap != null) {
                  onTap!();
                } else {
                  context.router.pop();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20), // Sol boşluk
                child: Assets.icons.lightOutline.arrowLeft.svg(
                  width: 28,
                  height: 28,
                  color: theme.appColors.text,
                ),
              ),
            )
          : const SizedBox.shrink(),
      /*   actions: [
        ThemeButton(
          width: 32,
          height: 32,
          onChanged: (bool value) async {
            themeModeNotifier.setThemeMode(
              value ? ThemeMode.light : ThemeMode.dark,
              await sharedPreferences,
            );
          },
        ),
        const SizedBox(width: 15),
      ], */
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
