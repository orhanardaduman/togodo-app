// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class CommentReplyInfo extends HookConsumerWidget {
  const CommentReplyInfo({
    required this.name,
    required this.closeOnTap,
    required this.imgUrl,
    super.key,
  });
  final String name;
  final String imgUrl;
  final void Function() closeOnTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color:
            theme.mode == ThemeMode.dark ? MainColors.dark2 : MainColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border(
          bottom: BorderSide(
            color: theme.mode == ThemeMode.dark
                ? MainColors.dark3
                : MainColors.grey100,
          ),
        ),
      ),
      child: Row(
        children: [
          CustomAvatarImage(
            size: 24,
            imageUrl: imgUrl,
          ),
          const SizedBox(
            width: 8,
          ),
          PrimaryText(
            l10n.replyTo(name),
            style: theme.textTheme.bodySmall,
          ),
          const Spacer(),
          InkWell(
            onTap: closeOnTap,
            child: Assets.icons.bold.close.svg(
              color: theme.appColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
