// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/screens/chat_home_page.dart';

class ChatAppbar extends HookConsumerWidget {
  const ChatAppbar({
    required this.theme,
    required this.widget,
    required this.router,
    super.key,
  });

  final AppTheme theme;
  final ChatHomePage widget;
  final StackRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    return AppBar(
      backgroundColor: theme.appColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: PrimaryText(
        l10n.messages,
        style: theme.textTheme.h4.copyWith(
          color: theme.appColors.text,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: widget.isBackButton
          ? InkWell(
              onTap: () async {
                if (widget.isNotificationRoute) {
                  await router.pushAndPopUntil(
                    const HomeRoute(),
                    predicate: (_) {
                      return false;
                    },
                  );
                  return;
                }
                Navigator.of(context).pop();
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
          : null,
      actions: [
        IconButton(
          onPressed: () {
            router.push(SearchScreenRoute());
          },
          icon: Assets.icons.light.plus.svg(
            color: theme.appColors.text,
            height: 25,
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
